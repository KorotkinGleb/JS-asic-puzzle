"""Convert example_inputs.vcd into a self-checking Verilog replay testbench."""

from __future__ import annotations

import argparse
from collections import defaultdict
from pathlib import Path
import re


DEFAULT_VCD = Path("example_inputs.vcd")
DEFAULT_OUTPUT = Path("scripts/tb_recovered_puzzle_example.v")
VAR_RE = re.compile(
    r"^\$var\s+\S+\s+(?P<width>\d+)\s+(?P<code>\S+)\s+"
    r"(?P<name>\S+)"
)


def parse_vcd(path: Path):
    variables: dict[str, tuple[str, int]] = {}
    changes: dict[int, dict[str, str]] = defaultdict(dict)
    in_values = False
    current_time = 0
    last_time = 0

    for raw_line in path.read_text().splitlines():
        line = raw_line.strip()
        if not in_values:
            if match := VAR_RE.match(line):
                variables[match.group("code")] = (
                    match.group("name"),
                    int(match.group("width")),
                )
            if line == "$enddefinitions $end":
                in_values = True
            continue
        if not line or line.startswith("$"):
            continue
        if line.startswith("#"):
            current_time = int(line[1:])
            last_time = max(last_time, current_time)
            continue
        if line[0] in "bB":
            value, code = line[1:].split(None, 1)
        elif line[0] in "01xXzZ":
            value, code = line[0], line[1:]
        else:
            continue
        if code not in variables:
            continue
        name, width = variables[code]
        changes[current_time][name] = value.lower().zfill(width)

    by_name = {name: width for name, width in variables.values()}
    return by_name, dict(changes), last_time


def literal(value: str, width: int) -> str:
    return f"{width}'b{value.zfill(width)}"


def generate_testbench(vcd_path: Path, dump_path: Path) -> str:
    widths, changes, last_time = parse_vcd(vcd_path)
    inputs = ("clk", "rst_n", "enable", "I")
    outputs = ("O", "success")
    missing = set(inputs + outputs) - set(widths)
    if missing:
        raise ValueError("VCD is missing: " + ", ".join(sorted(missing)))

    # Build expected-output snapshots after applying all changes at each time.
    # Once outputs become known, check them after every input/clock event too;
    # this detects an incorrect intermediate state even if the next recorded
    # output transition happens much later.
    expected: dict[str, str | None] = {name: None for name in outputs}
    checkpoints: list[tuple[int, dict[str, str]]] = []
    for timestamp in sorted(changes):
        output_changed = False
        for name in outputs:
            if name in changes[timestamp]:
                expected[name] = changes[timestamp][name]
                output_changed = True
        input_changed = any(name in changes[timestamp] for name in inputs)
        outputs_known = all(
            value is not None and set(value) <= {"0", "1"}
            for value in expected.values()
        )
        if (output_changed or input_changed) and outputs_known:
            checkpoints.append(
                (timestamp + 1, {name: expected[name] for name in outputs})
            )
    if all(expected.values()) and (
        not checkpoints or checkpoints[-1][0] != last_time + 1
    ):
        checkpoints.append(
            (last_time + 1, {name: expected[name] for name in outputs})
        )

    lines = [
        "`timescale 1ps / 1ps",
        "",
        "module tb_recovered_puzzle_example;",
        "  reg clk;",
        "  reg rst_n;",
        "  reg enable;",
        "  reg I;",
        "  wire [7:0] O;",
        "  wire success;",
        "  integer errors;",
        "",
        "  puzzle dut (",
        "      .clk(clk),",
        "      .rst_n(rst_n),",
        "      .enable(enable),",
        "      .I(I),",
        "      .O(O),",
        "      .success(success)",
        "  );",
        "",
        "  // Input transitions reproduced exactly from example_inputs.vcd.",
        "  initial begin",
        "    errors = 0;",
        f"    $dumpfile(\"{dump_path}\");",
        "    $dumpvars(0, tb_recovered_puzzle_example);",
    ]
    current = 0
    initialized = set()
    for timestamp in sorted(changes):
        input_changes = {
            name: value
            for name, value in changes[timestamp].items()
            if name in inputs
        }
        if not input_changes:
            continue
        delay = timestamp - current
        if delay:
            lines.append(f"    #{delay};")
        current = timestamp
        for name in inputs:
            if name in input_changes:
                lines.append(
                    f"    {name} = {literal(input_changes[name], widths[name])};"
                )
                initialized.add(name)
    uninitialized = set(inputs) - initialized
    if uninitialized:
        raise ValueError(
            "VCD has no initial value for: " + ", ".join(sorted(uninitialized))
        )
    finish_delay = last_time + 2 - current
    if finish_delay:
        lines.append(f"    #{finish_delay};")
    lines.extend(
        [
            "    if (errors == 0)",
            "      $display(\"PASS: recovered puzzle matches example_inputs.vcd\");",
            "    else",
            "      $fatal(1, \"FAIL: %0d VCD mismatches\", errors);",
            "    $finish;",
            "  end",
            "",
            "  // Expected outputs sampled one picosecond after each VCD event",
            "  // so clocked nonblocking assignments and combinational logic settle.",
            "  initial begin",
        ]
    )
    current = 0
    for timestamp, values in checkpoints:
        delay = timestamp - current
        if delay:
            lines.append(f"    #{delay};")
        current = timestamp
        for name in outputs:
            expected_value = values[name]
            if set(expected_value) <= {"0", "1"}:
                lines.extend(
                    [
                        f"    if ({name} !== {literal(expected_value, widths[name])}) begin",
                        "      errors = errors + 1;",
                        f"      $display(\"MISMATCH t=%0t {name}=%b expected=%b\", "
                        f"$time, {name}, {literal(expected_value, widths[name])});",
                        "    end",
                    ]
                )
    lines.extend(["  end", "endmodule", ""])
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate a self-checking replay of example_inputs.vcd"
    )
    parser.add_argument("vcd", nargs="?", type=Path, default=DEFAULT_VCD)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument(
        "--dump",
        type=Path,
        default=Path("scripts/recovered_puzzle_example_replay.vcd"),
    )
    args = parser.parse_args()
    text = generate_testbench(args.vcd, args.dump)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(text)
    print(f"Replay testbench: {args.output}")


if __name__ == "__main__":
    main()
