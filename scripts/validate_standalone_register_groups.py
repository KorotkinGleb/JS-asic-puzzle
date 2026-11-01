"""Randomly compare standalone RTL D outputs with recovered SKY130 cones."""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import json
from pathlib import Path
import re
import subprocess
import tempfile

try:
    from .klayoutexmp import PDK_PATH
except ImportError:
    from klayoutexmp import PDK_PATH


DEFAULT_MANIFEST = Path(
    "scripts/register_groups/standalone/standalone_manifest.json"
)
STRUCTURAL_DIR = Path("scripts/register_groups")
PORT_RE = re.compile(
    r"^\s*(?P<direction>input|output)\s+"
    r"(?P<kind>wire|reg)\s+"
    r"(?:\[(?P<msb>\d+):(?P<lsb>\d+)\]\s+)?"
    r"(?P<name>[A-Za-z_$][A-Za-z0-9_$]*)"
)
MODULE_RE = re.compile(r"^\s*module\s+([A-Za-z_$][A-Za-z0-9_$]*)")


@dataclass(frozen=True)
class ParsedPort:
    direction: str
    width: int
    name: str

    @property
    def range_text(self) -> str:
        return f"[{self.width - 1}:0] " if self.width > 1 else ""


def parse_module(path: Path) -> tuple[str, list[ParsedPort]]:
    name: str | None = None
    ports: list[ParsedPort] = []
    for line in path.read_text().splitlines():
        if name is None and (match := MODULE_RE.match(line)):
            name = match.group(1)
        if match := PORT_RE.match(line):
            msb = int(match.group("msb") or 0)
            lsb = int(match.group("lsb") or 0)
            ports.append(
                ParsedPort(
                    match.group("direction"),
                    abs(msb - lsb) + 1,
                    match.group("name"),
                )
            )
    if name is None:
        raise ValueError(f"No module in {path}")
    return name, ports


def make_testbench(item: dict, structural_path: Path) -> str:
    standalone_path = Path(item["output"])
    standalone_module, standalone_ports = parse_module(standalone_path)
    structural_module, structural_ports = parse_module(structural_path)
    standalone_inputs = {
        port.name: port for port in standalone_ports if port.direction == "input"
    }
    structural_inputs = {
        port.name: port for port in structural_ports if port.direction == "input"
    }
    q_name = item["q_port"]
    d_name = item["d_port"]
    q_width = item["width"]
    own_q_is_input = q_name in structural_inputs

    driven: dict[str, ParsedPort] = dict(structural_inputs)
    driven.pop(q_name, None)
    driven.update(standalone_inputs)
    lines = [
        "`timescale 1ns / 1ps",
        "module tb;",
    ]
    for name, port in sorted(driven.items()):
        lines.append(f"  reg {port.range_text}{name};")
    if own_q_is_input:
        lines.append(f"  reg [{q_width - 1}:0] stimulus_q;")
    lines.extend(
        [
            f"  wire [{q_width - 1}:0] standalone_q;",
            f"  wire [{q_width - 1}:0] standalone_d;",
            f"  wire [{q_width - 1}:0] structural_d;",
            "  integer iteration;",
            "  integer errors;",
            "",
            f"  {standalone_module} standalone (",
        ]
    )
    standalone_connections = []
    for port in standalone_ports:
        if port.name == q_name:
            signal = "standalone_q"
        elif port.name == d_name:
            signal = "standalone_d"
        else:
            signal = port.name
        standalone_connections.append(f"    .{port.name}({signal})")
    lines.append(",\n".join(standalone_connections))
    lines.extend(["  );", "", f"  {structural_module} structural ("])
    structural_connections = []
    for port in structural_ports:
        if port.name == q_name:
            signal = "stimulus_q"
        elif port.name == d_name:
            signal = "structural_d"
        else:
            signal = port.name
        structural_connections.append(f"    .{port.name}({signal})")
    lines.append(",\n".join(structural_connections))
    lines.extend(["  );", "", "  initial begin", "    errors = 0;"])

    clock_name = item["clock"]["name"]
    inactive_controls: dict[str, str] = {}
    for bit in item["sequential_bits"]:
        for control in bit["controls"]:
            inactive_controls[control["signal"]] = (
                "1'b1" if control["edge"] == "negedge" else "1'b0"
            )
    lines.append(f"    {clock_name} = 1'b0;")
    for signal, value in sorted(inactive_controls.items()):
        lines.append(f"    {signal} = {value};")
    random_names = sorted(
        set(structural_inputs) - {q_name, clock_name} - set(inactive_controls)
    )
    lines.append(
        "    for (iteration = 0; iteration < `TEST_ITERATIONS; "
        "iteration = iteration + 1) begin"
    )
    for name in random_names:
        lines.append(f"      {name} = $random;")
    if own_q_is_input:
        lines.extend(
            [
                "      stimulus_q = $random;",
                f"      force standalone.{q_name} = stimulus_q;",
            ]
        )
    lines.extend(
        [
            "      #1;",
            "      if (standalone_d !== structural_d) begin",
            "        errors = errors + 1;",
            "        $display(\"MISMATCH iteration=%0d rtl=%b structural=%b\",",
            "                 iteration, standalone_d, structural_d);",
            "      end",
        ]
    )
    if own_q_is_input:
        lines.append(f"      release standalone.{q_name};")
    lines.extend(
        [
            "    end",
            "    if (errors != 0)",
            "      $fatal(1, \"FAIL: %0d mismatches\", errors);",
            f"    $display(\"PASS group_{item['group_index']:02d}: "
            "%0d randomized vectors\", `TEST_ITERATIONS);",
            "    $finish;",
            "  end",
            "endmodule",
            "",
        ]
    )
    return "\n".join(lines)


def validate(item: dict, iterations: int, temp_dir: Path) -> str:
    index = item["group_index"]
    structural_path = STRUCTURAL_DIR / (
        f"recovered_register_group_{index:02d}_input_logic_grouped.v"
    )
    standalone_path = Path(item["output"])
    testbench_path = temp_dir / f"tb_group_{index:02d}.v"
    simulation_path = temp_dir / f"group_{index:02d}.vvp"
    testbench_path.write_text(make_testbench(item, structural_path))
    pdk_verilog = (
        PDK_PATH
        / "libs.ref"
        / "sky130_fd_sc_hd"
        / "verilog"
        / "sky130_fd_sc_hd.v"
    )
    pdk_primitives = pdk_verilog.with_name("primitives.v")
    compile_result = subprocess.run(
        [
            "iverilog",
            "-g2012",
            "-DFUNCTIONAL",
            "-DUNIT_DELAY=",
            f"-DTEST_ITERATIONS={iterations}",
            "-s",
            "tb",
            "-o",
            str(simulation_path),
            str(pdk_primitives),
            str(pdk_verilog),
            str(structural_path),
            str(standalone_path),
            str(testbench_path),
        ],
        check=False,
        capture_output=True,
        text=True,
    )
    if compile_result.returncode != 0:
        raise RuntimeError(
            f"iverilog failed for group_{index:02d}:\n"
            f"{compile_result.stdout}{compile_result.stderr}"
        )
    if compile_result.stderr:
        print(compile_result.stderr, end="")
    simulation = subprocess.run(
        ["vvp", str(simulation_path)],
        check=True,
        capture_output=True,
        text=True,
    )
    return simulation.stdout.strip()


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Compare standalone next-state RTL with structural cones"
    )
    parser.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    parser.add_argument("--iterations", type=int, default=256)
    parser.add_argument("--group", type=int, action="append", dest="groups")
    args = parser.parse_args()

    manifest = json.loads(args.manifest.read_text())
    requested = set(args.groups or [])
    selected = [
        item
        for item in manifest["groups"]
        if not requested or item["group_index"] in requested
    ]
    with tempfile.TemporaryDirectory(prefix="asic_group_validation_") as path:
        temp_dir = Path(path)
        for item in selected:
            print(validate(item, args.iterations, temp_dir))


if __name__ == "__main__":
    main()
