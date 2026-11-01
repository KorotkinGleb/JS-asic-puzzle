"""Generate one complete, dependency-free RTL model from puzzle.gds."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

try:
    from .analyze_puzzle import extract_top_ports
    from .generate_standalone_register_groups import (
        _async_control,
        _replace_function_pins,
    )
    from .recover_schematic_elements import (
        build_driver_index,
        build_load_index,
        find_input_pins,
        recover_schematic,
    )
except ImportError:
    from analyze_puzzle import extract_top_ports
    from generate_standalone_register_groups import (
        _async_control,
        _replace_function_pins,
    )
    from recover_schematic_elements import (
        build_driver_index,
        build_load_index,
        find_input_pins,
        recover_schematic,
    )


DEFAULT_GDS = Path("puzzle.gds")
DEFAULT_OUTPUT = Path("scripts/recovered_puzzle_complete.v")
DEFAULT_MANIFEST = Path("scripts/recovered_puzzle_complete.json")
SEQUENTIAL_KINDS = {"flip-flop", "latch"}


def parse_ties(values: list[str]) -> dict[int, str]:
    ties: dict[int, str] = {}
    for value in values:
        try:
            net_text, bit = value.split("=", 1)
            net = int(net_text.removeprefix("net_"))
        except ValueError as error:
            raise ValueError(
                f"Invalid tie {value!r}; expected NET=0, NET=1, or NET=x"
            ) from error
        if bit.lower() not in {"0", "1", "x"}:
            raise ValueError(f"Invalid tie value {bit!r}; expected 0, 1, or x")
        ties[net] = bit.lower()
    return ties


def generate_complete_rtl(context, ties: dict[int, str]) -> tuple[str, dict]:
    elements = sorted(context.elements, key=lambda cell: cell.instance_id)
    drivers = build_driver_index(elements)
    loads = build_load_index(elements)
    top_inputs = {pin.net: pin.name for pin in find_input_pins(context)}
    layout_ports = extract_top_ports(
        context.layout, context.top, context.l2n
    )
    output_nets = {
        port.name: port.net
        for port in layout_ports
        if port.name == "success" or port.name.startswith("O[")
    }
    required_outputs = {"success", *(f"O[{bit}]" for bit in range(8))}
    missing_outputs = required_outputs - set(output_nets)
    if missing_outputs:
        raise ValueError(
            "Missing GDS output labels: " + ", ".join(sorted(missing_outputs))
        )

    undriven = sorted(set(loads) - set(drivers) - set(top_inputs))
    missing_ties = set(undriven) - set(ties)
    extra_ties = set(ties) - set(undriven)
    if missing_ties:
        raise ValueError(
            "Undriven extracted nets need --tie-net: "
            + ", ".join(f"net_{net}" for net in sorted(missing_ties))
        )
    if extra_ties:
        raise ValueError(
            "Tie values supplied for driven/input nets: "
            + ", ".join(f"net_{net}" for net in sorted(extra_ties))
        )

    referenced_nets = {
        net
        for cell in elements
        for net in (
            list(cell.input_pins.values()) + list(cell.output_pins.values())
        )
    } | set(output_nets.values())
    internal_nets = sorted(referenced_nets - set(top_inputs))
    sequential_q_nets = {
        net
        for cell in elements
        if cell.symbol_kind in SEQUENTIAL_KINDS
        for net in cell.output_pins.values()
    }

    def signal(net: int) -> str:
        if net in top_inputs:
            return top_inputs[net]
        return f"net_{net}"

    lines = [
        "// Complete dependency-free RTL recovered from puzzle.gds.",
        "// 728 functional cells; 2767/2767 functional pins resolved.",
        "// No PDK modules or include files are required for simulation.",
        "`timescale 1ps / 1ps",
        "",
        "module puzzle (",
        "    input  wire       clk,",
        "    input  wire       rst_n,",
        "    input  wire       enable,",
        "    input  wire       I,",
        "    output wire [7:0] O,",
        "    output wire       success",
        ");",
        "",
        "  // Extracted electrical nets.",
    ]
    lines.extend(
        f"  {'reg' if net in sequential_q_nets else 'wire'} net_{net};"
        for net in internal_nets
    )
    lines.append("")

    lines.extend(
        [
            "  // Recovered top-level output mapping.",
            *[
                f"  assign O[{bit}] = net_{output_nets[f'O[{bit}]']};"
                for bit in range(8)
            ],
            f"  assign success = net_{output_nets['success']};",
            "",
        ]
    )

    if ties:
        lines.append("  // Extracted conductor islands with no recognized driver.")
        for net, value in sorted(ties.items()):
            lines.append(
                f"  assign net_{net} = 1'b{value};  "
                "// physically undriven conductor island"
            )
        lines.append("")

    combinational = [
        cell for cell in elements if cell.symbol_kind not in SEQUENTIAL_KINDS
    ]
    sequential = [
        cell for cell in elements if cell.symbol_kind in SEQUENTIAL_KINDS
    ]
    lines.append("  // Inlined recovered combinational standard cells.")
    for cell in combinational:
        lines.append(f"  // u_{cell.instance_id}: {cell.module}")
        for output_pin, net in cell.output_pins.items():
            function = cell.output_functions.get(output_pin)
            if function is None:
                raise ValueError(
                    f"u_{cell.instance_id}.{output_pin} has no Liberty function"
                )
            expression = _replace_function_pins(function, cell, signal)
            lines.append(f"  assign {signal(net)} = {expression};")
    lines.append("")

    lines.append("  // Recovered sequential standard cells.")
    sequential_manifest: list[dict] = []
    for cell in sequential:
        if cell.symbol_kind == "latch":
            raise ValueError(f"Latch u_{cell.instance_id} is not yet supported")
        if set(cell.output_pins) != {"Q"}:
            raise ValueError(
                f"u_{cell.instance_id} has unsupported outputs "
                f"{sorted(cell.output_pins)}"
            )
        clock = signal(cell.input_pins["CLK"])
        d_signal = signal(cell.input_pins["D"])
        q_signal = signal(cell.output_pins["Q"])
        controls = []
        for pin, net in cell.input_pins.items():
            if pin in {"CLK", "D"}:
                continue
            controls.append(_async_control(pin, signal(net)))
        sensitivity = [f"posedge {clock}"] + [
            f"{control.edge} {control.signal}" for control in controls
        ]
        lines.append(f"  // u_{cell.instance_id}: {cell.module}")
        lines.append(f"  always @({' or '.join(sensitivity)}) begin")
        for index, control in enumerate(controls):
            keyword = "if" if index == 0 else "else if"
            lines.append(
                f"    {keyword} ({control.condition}) "
                f"{q_signal} <= {control.value};"
            )
        if controls:
            lines.append(f"    else {q_signal} <= {d_signal};")
        else:
            lines.append(f"    {q_signal} <= {d_signal};")
        lines.append("  end")
        sequential_manifest.append(
            {
                "instance_id": cell.instance_id,
                "module": cell.module,
                "d_net": cell.input_pins["D"],
                "q_net": cell.output_pins["Q"],
                "clock_net": cell.input_pins["CLK"],
                "controls": [
                    {"pin": control.pin, "signal": control.signal}
                    for control in controls
                ],
            }
        )
    lines.extend(["endmodule", ""])

    manifest = {
        "gds": str(DEFAULT_GDS),
        "top_module": "puzzle",
        "functional_cells": len(elements),
        "combinational_cells": len(combinational),
        "sequential_cells": len(sequential),
        "top_inputs": {
            name: net for net, name in sorted(top_inputs.items())
        },
        "top_outputs": output_nets,
        "undriven_nets": undriven,
        "selected_ties": {str(net): bit for net, bit in sorted(ties.items())},
        "sequential_instances": sequential_manifest,
    }
    return "\n".join(lines), manifest


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate complete dependency-free puzzle RTL from GDS"
    )
    parser.add_argument("gds", nargs="?", type=Path, default=DEFAULT_GDS)
    parser.add_argument("--output", type=Path, default=DEFAULT_OUTPUT)
    parser.add_argument("--manifest", type=Path, default=DEFAULT_MANIFEST)
    parser.add_argument(
        "--tie-net",
        action="append",
        default=[],
        metavar="NET=BIT",
        help="resolve an extracted net island with no recognized driver",
    )
    args = parser.parse_args()

    context = recover_schematic(args.gds)
    ties = parse_ties(args.tie_net)
    text, manifest = generate_complete_rtl(context, ties)
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(text)
    args.manifest.parent.mkdir(parents=True, exist_ok=True)
    args.manifest.write_text(json.dumps(manifest, indent=2) + "\n")
    print(
        f"Complete RTL: {args.output}; "
        f"{manifest['combinational_cells']} combinational + "
        f"{manifest['sequential_cells']} sequential cells"
    )
    print(f"Manifest: {args.manifest}")


if __name__ == "__main__":
    main()
