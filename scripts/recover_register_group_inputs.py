"""Recover the combinational logic feeding every candidate register group.

For each selected group this script starts at every member flip-flop's D pin
and walks backward until it reaches sequential outputs, constants, or top-level
inputs.  The result is one structural Verilog module per destination group.

Source flip-flop Q ports are packed using ``recovered_register_groups.json``.
The destination D pins are also exposed as one packed vector.  For heuristic
groups, bit indexes are deterministic (sorted instance IDs), but they are not
claimed to be the original RTL bit ordering.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path
import re

try:
    from .group_flip_flop_ports import (
        GroupDefinition,
        build_identifier_map,
        group_verilog_text,
        load_groups,
    )
    from .recover_schematic_elements import recover_schematic
    from .recover_shift_output_trees import (
        boundary_input_names,
        destination_output_names,
        flip_flop_input_trace_root,
        generate_verilog,
        trace_combinational_block,
    )
except ImportError:
    from group_flip_flop_ports import (
        GroupDefinition,
        build_identifier_map,
        group_verilog_text,
        load_groups,
    )
    from recover_schematic_elements import recover_schematic
    from recover_shift_output_trees import (
        boundary_input_names,
        destination_output_names,
        flip_flop_input_trace_root,
        generate_verilog,
        trace_combinational_block,
    )


DEFAULT_GDS = Path("puzzle.gds")
DEFAULT_GROUP_REPORT = Path("scripts/recovered_register_groups.json")
DEFAULT_OUTPUT_DIR = Path("scripts/register_groups")
OUTPUT_PORT_RE = re.compile(
    r"^(?P<indent>\s*)output\s+wire\s+"
    r"(?P<name>[A-Za-z_$][A-Za-z0-9_$]*)"
    r"(?P<comma>,?)\s*(?P<comment>//.*)?$"
)


def _normalize_header_commas(lines: list[str]) -> None:
    """Make the input/output declaration list legal after port replacement."""

    header_end = next(
        (index for index, line in enumerate(lines) if line.strip() == ");"),
        None,
    )
    if header_end is None:
        raise ValueError("Generated Verilog has no module-header terminator")
    declarations = [
        index
        for index, line in enumerate(lines[:header_end])
        if re.match(r"^\s*(input|output|inout)\s+", line)
    ]
    for position, index in enumerate(declarations):
        code, separator, comment = lines[index].partition("//")
        code = code.rstrip().rstrip(",")
        if position + 1 < len(declarations):
            code += ","
        lines[index] = code + (f"  //{comment}" if separator else "")


def _grouped_signal_name(
    scalar_name: str,
    groups: list[GroupDefinition],
) -> str:
    mapping = build_identifier_map(groups).get(scalar_name)
    if mapping is None:
        return scalar_name
    return f"{mapping.group.name}[{mapping.bit}]"


def add_destination_vector(
    grouped_text: str,
    group: GroupDefinition,
    groups: list[GroupDefinition],
    block,
    context,
) -> tuple[str, dict]:
    """Replace target scalar D ports with one packed destination-D vector."""

    input_names = boundary_input_names(block, context)
    output_names, output_destinations = destination_output_names(
        block, context.elements
    )
    constant_values = {
        net: f"1'b{value}" for net, value in block.constant_nets.items()
    }
    by_id = {element.instance_id: element for element in context.elements}
    target_ids = set(group.members)
    target_nets = {
        by_id[instance_id].input_pins["D"] for instance_id in target_ids
    }
    scalar_outputs = {
        output_names[net] for net in target_nets if net in output_names
    }
    d_vector = group.name.removesuffix("_q") + "_d"

    lines = grouped_text.splitlines()
    output_lines: list[str] = []
    inside_header = False
    vector_emitted = False

    for line in lines:
        if re.match(r"^\s*module\s+", line):
            inside_header = True
        match = OUTPUT_PORT_RE.match(line) if inside_header else None
        if match and match.group("name") in scalar_outputs:
            if not vector_emitted:
                output_lines.append(
                    f"{match.group('indent')}output wire "
                    f"[{group.width - 1}:0] {d_vector},  "
                    "// complete recovered destination D vector"
                )
                vector_emitted = True
            continue
        if inside_header and line.strip() == ");":
            if not vector_emitted:
                output_lines.append(
                    f"    output wire [{group.width - 1}:0] {d_vector},  "
                    "// complete recovered destination D vector"
                )
                vector_emitted = True
            output_lines.append(line)
            inside_header = False
            continue
        output_lines.append(line)

    _normalize_header_commas(output_lines)
    header_end = next(
        index for index, line in enumerate(output_lines) if line.strip() == ");"
    )

    # Scalar output signals remain as internal wires when the recovered cell
    # cone drives them.  Direct Q->D and constant->D paths use their boundary
    # signal directly and therefore do not need an internal scalar wire.
    internal_output_signals: set[str] = set()
    bit_entries: list[dict] = []
    assignment_lines: list[str] = [
        "",
        f"  // Recovered D-pin mapping for {group.name}",
    ]
    for instance_id in group.bit_order:
        bit = group.bit_for_instance(instance_id)
        net = by_id[instance_id].input_pins["D"]
        if net in constant_values:
            rhs = constant_values[net]
            source_kind = "constant"
        elif net in input_names:
            rhs = _grouped_signal_name(input_names[net], groups)
            source_kind = "boundary"
        else:
            rhs = output_names[net]
            internal_output_signals.add(rhs)
            source_kind = "combinational"
        assignment_lines.append(
            f"  assign {d_vector}[{bit}] = {rhs};  "
            f"// u_{instance_id}.D / net_{net}"
        )
        bit_entries.append(
            {
                "bit": bit,
                "instance_id": instance_id,
                "net": net,
                "signal": rhs,
                "source_kind": source_kind,
            }
        )

    declaration_lines = [
        f"  wire {name};"
        for name in sorted(internal_output_signals)
    ]
    insertion = [""] + declaration_lines + assignment_lines + [""]
    output_lines[header_end + 1 : header_end + 1] = insertion

    # Capture additional sequential loads sharing any target D net.  They are
    # useful evidence that two inferred groups may interact or overlap.
    shared_destinations: dict[str, list[str]] = {}
    for net in sorted(target_nets):
        endpoints = output_destinations.get(net, [])
        extras = [
            f"u_{endpoint.instance_id}.{endpoint.pin}"
            for endpoint in endpoints
            if endpoint.instance_id not in target_ids
        ]
        if extras:
            shared_destinations[f"net_{net}"] = extras

    return "\n".join(output_lines) + "\n", {
        "name": d_vector,
        "width": group.width,
        "bits": bit_entries,
        "shared_sequential_destinations": shared_destinations,
    }


def recover_one_group(group, groups, context, output_dir: Path) -> dict:
    roots = [
        flip_flop_input_trace_root(instance_id, context.elements)
        for instance_id in group.bit_order
    ]
    block = trace_combinational_block(roots, context.elements)
    base_module = f"recovered_register_group_{group.report_index:02d}_input_logic"
    raw_text = generate_verilog(block, context, base_module)
    grouped_text, source_manifest = group_verilog_text(raw_text, groups)
    final_text, destination_manifest = add_destination_vector(
        grouped_text, group, groups, block, context
    )

    output_path = output_dir / f"{base_module}_grouped.v"
    output_path.write_text(final_text)
    by_id = {element.instance_id: element for element in context.elements}
    source_ff_ids = sorted(
        {
            endpoint.instance_id
            for endpoint in block.source_pins
            if by_id[endpoint.instance_id].symbol_kind == "flip-flop"
        }
    )

    return {
        "group_index": group.report_index,
        "kind": group.kind,
        "confidence": group.confidence,
        "bit_order_note": (
            "verified shift order"
            if group.kind == "verified shift register"
            else "heuristic index order follows sorted instance IDs"
        ),
        "destination_flip_flops": list(group.bit_order),
        "destination_d": destination_manifest,
        "source_flip_flops": source_ff_ids,
        "source_register_vectors": source_manifest["groups"],
        "boundary_input_nets": sorted(block.boundary_input_nets),
        "constant_nets": {
            str(net): value for net, value in sorted(block.constant_nets.items())
        },
        "combinational_cell_count": len(block.combinational_cells),
        "combinational_cell_ids": [
            cell.instance_id for cell in block.combinational_cells
        ],
        "output": str(output_path),
        "module": source_manifest["grouped_module"],
    }


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Recover the complete backward D cone of register groups"
    )
    parser.add_argument("gds", nargs="?", type=Path, default=DEFAULT_GDS)
    parser.add_argument("--groups", type=Path, default=DEFAULT_GROUP_REPORT)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT_DIR)
    parser.add_argument(
        "--group",
        type=int,
        action="append",
        dest="group_indexes",
        help="recover only this report group index; may be repeated",
    )
    parser.add_argument(
        "--include-shift",
        action="store_true",
        help="also recover group 1, the already-explored verified shift register",
    )
    args = parser.parse_args()

    groups = load_groups(args.groups)
    requested = set(args.group_indexes or [])
    known_indexes = {group.report_index for group in groups}
    unknown = requested - known_indexes
    if unknown:
        raise ValueError(
            "Unknown group indexes: " + ", ".join(map(str, sorted(unknown)))
        )

    selected = [
        group
        for group in groups
        if (not requested or group.report_index in requested)
        and (
            args.include_shift
            or requested
            or group.kind != "verified shift register"
        )
    ]
    if not selected:
        raise ValueError("No register groups selected")

    context = recover_schematic(args.gds)
    args.output_dir.mkdir(parents=True, exist_ok=True)
    results: list[dict] = []
    for group in selected:
        result = recover_one_group(group, groups, context, args.output_dir)
        results.append(result)
        print(
            f"group_{group.report_index:02d}: {group.width} D bits, "
            f"{result['combinational_cell_count']} combinational cells, "
            f"{len(result['source_flip_flops'])} source FFs -> "
            f"{result['output']}"
        )

    skipped = [
        {
            "group_index": group.report_index,
            "reason": "verified shift register already structurally explored",
        }
        for group in groups
        if group.kind == "verified shift register"
        and group not in selected
        and not requested
    ]
    manifest = {
        "gds": str(args.gds),
        "register_group_report": str(args.groups),
        "direction": "backward from every destination FF.D",
        "heuristic_bit_order_warning": (
            "Only verified shift-register order is proven. Candidate group "
            "vectors use sorted instance IDs."
        ),
        "recovered_groups": results,
        "skipped_groups": skipped,
    }
    manifest_path = args.output_dir / "recovery_manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2) + "\n")
    print(f"Manifest: {manifest_path}")


if __name__ == "__main__":
    main()
