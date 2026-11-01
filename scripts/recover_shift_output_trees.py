"""Recover the complete combinational cone driven by shift-register outputs.

Pass 1 follows the four shift-register Q nets forward through combinational
loads until it finds destination flip-flops. Pass 2 starts at those destination
pins and follows gate inputs backward to recover every side-input dependency.
The separate passes prevent shared input signals from pulling unrelated
fan-out branches into the recovered block.
"""

from __future__ import annotations

import argparse
from collections import deque
from dataclasses import dataclass
from pathlib import Path
import re

try:
    from .recover_schematic_elements import (
        PinReference,
        RecoveryContext,
        SchematicElement,
        ShiftRegisterOutput,
        build_driver_index,
        build_load_index,
        find_input_pins,
        find_shift_register_outputs,
        find_shift_registers,
        recover_schematic,
        short_module,
    )
except ImportError:
    from recover_schematic_elements import (
        PinReference,
        RecoveryContext,
        SchematicElement,
        ShiftRegisterOutput,
        build_driver_index,
        build_load_index,
        find_input_pins,
        find_shift_register_outputs,
        find_shift_registers,
        recover_schematic,
        short_module,
    )


DEFAULT_GDS = Path("puzzle.gds")
DEFAULT_VERILOG = Path("scripts/recovered_shift_output_logic.v")
SEQUENTIAL_KINDS = {"flip-flop", "latch"}


@dataclass(frozen=True)
class TraceRoot:
    """A named output net used to start a forward traversal."""

    port_name: str
    label: str
    net: int
    source: PinReference
    destinations: tuple[PinReference, ...]
    is_boundary_input: bool = True


@dataclass
class RecoveredBlock:
    """One register-to-register combinational cone."""

    roots: list[TraceRoot]
    root_path_cells: list[SchematicElement]
    combinational_cells: list[SchematicElement]
    source_pins: list[PinReference]
    destination_pins: list[PinReference]
    boundary_input_nets: set[int]
    constant_nets: dict[int, str]
    visited_nets: set[int]


def _cell_nets(cell: SchematicElement) -> set[int]:
    return set(cell.input_pins.values()) | set(cell.output_pins.values())


def _constant_value(cell: SchematicElement, pin: str) -> str | None:
    if cell.symbol_kind != "constant source":
        return None
    value = cell.output_functions.get(pin)
    return value if value in {"0", "1"} else None


def trace_combinational_block(
    roots: list[TraceRoot],
    elements: list[SchematicElement],
    excluded_cell_ids: set[int] | None = None,
) -> RecoveredBlock:
    """Recover the forward paths and complete fan-in of their destination FFs."""

    excluded_cell_ids = excluded_cell_ids or set()
    by_id = {element.instance_id: element for element in elements}
    drivers = build_driver_index(elements)
    loads = build_load_index(elements)

    # Pass 1: only follow fan-out from the selected shift Q nets. This finds
    # every sequential endpoint whose D logic is influenced by those Q bits.
    forward_queue = deque(root.net for root in roots)
    forward_nets: set[int] = set()
    root_path_cells: dict[int, SchematicElement] = {}
    destination_pins: dict[tuple[int, str], PinReference] = {}

    while forward_queue:
        net = forward_queue.popleft()
        if net in forward_nets:
            continue
        forward_nets.add(net)

        for endpoint in loads.get(net, []):
            load = by_id[endpoint.instance_id]
            if load.instance_id in excluded_cell_ids:
                continue
            if load.symbol_kind in SEQUENTIAL_KINDS:
                destination_pins[(endpoint.instance_id, endpoint.pin)] = endpoint
                continue
            if load.instance_id not in root_path_cells:
                root_path_cells[load.instance_id] = load
                forward_queue.extend(load.output_pins.values())

    # Pass 2: follow fan-in from each destination sequential pin. For an
    # upstream combinational driver, follow only its inputs. We intentionally
    # do not follow its unrelated output loads.
    backward_queue = deque(
        _pin_net(endpoint, by_id) for endpoint in destination_pins.values()
    )
    backward_nets: set[int] = set()
    combinational: dict[int, SchematicElement] = {}
    source_pins: dict[tuple[int, str], PinReference] = {}
    constants: dict[int, str] = {}

    while backward_queue:
        net = backward_queue.popleft()
        if net in backward_nets:
            continue
        backward_nets.add(net)

        for endpoint in drivers.get(net, []):
            driver = by_id[endpoint.instance_id]
            value = _constant_value(driver, endpoint.pin)
            if value is not None:
                constants[net] = value
            elif (
                driver.instance_id in excluded_cell_ids
                or driver.symbol_kind in SEQUENTIAL_KINDS
            ):
                source_pins[(endpoint.instance_id, endpoint.pin)] = endpoint
            else:
                if driver.instance_id not in combinational:
                    combinational[driver.instance_id] = driver
                    backward_queue.extend(driver.input_pins.values())

    cells = sorted(combinational.values(), key=lambda cell: cell.instance_id)
    driven_inside = {
        net for cell in cells for net in cell.output_pins.values()
    }
    root_nets = {root.net for root in roots if root.is_boundary_input}
    # ``backward_nets`` also contains a destination D net that is driven
    # directly by a sequential Q or a top-level input.  Deriving boundaries
    # only from combinational-cell inputs would lose those zero-gate paths.
    boundary_inputs = (
        backward_nets - driven_inside - set(constants)
    ) | root_nets

    return RecoveredBlock(
        roots=roots,
        root_path_cells=sorted(
            root_path_cells.values(), key=lambda cell: cell.instance_id
        ),
        combinational_cells=cells,
        source_pins=sorted(
            source_pins.values(),
            key=lambda endpoint: (endpoint.instance_id, endpoint.pin),
        ),
        destination_pins=sorted(
            destination_pins.values(),
            key=lambda endpoint: (endpoint.instance_id, endpoint.pin),
        ),
        boundary_input_nets=boundary_inputs,
        constant_nets=constants,
        visited_nets=forward_nets | backward_nets,
    )


def shift_trace_roots(outputs: list[ShiftRegisterOutput]) -> list[TraceRoot]:
    return [
        TraceRoot(
            port_name=f"shift_q_{output.bit}",
            label=f"Q[{output.bit}]",
            net=output.net,
            source=output.source,
            destinations=output.destinations,
        )
        for output in outputs
    ]


def flip_flop_trace_root(
    instance_id: int,
    elements: list[SchematicElement],
) -> TraceRoot:
    """Create a trace root from one recovered flip-flop's Q pin."""

    by_id = {element.instance_id: element for element in elements}
    if instance_id not in by_id:
        raise ValueError(f"No recovered instance u_{instance_id}")
    flip_flop = by_id[instance_id]
    if flip_flop.symbol_kind not in SEQUENTIAL_KINDS:
        raise ValueError(f"u_{instance_id} is not a flip-flop or latch")
    if "Q" not in flip_flop.output_pins:
        raise ValueError(f"u_{instance_id} has no recovered Q output")

    net = flip_flop.output_pins["Q"]
    loads = build_load_index(elements)
    return TraceRoot(
        port_name=f"ff_{instance_id}_q",
        label=f"u_{instance_id}.Q",
        net=net,
        source=PinReference(instance_id, flip_flop.module, "Q"),
        destinations=tuple(loads.get(net, [])),
    )


def flip_flop_input_trace_root(
    instance_id: int,
    elements: list[SchematicElement],
) -> TraceRoot:
    """Create a backward-cone trace root at one flip-flop's D pin."""

    by_id = {element.instance_id: element for element in elements}
    if instance_id not in by_id:
        raise ValueError(f"No recovered instance u_{instance_id}")
    flip_flop = by_id[instance_id]
    if flip_flop.symbol_kind not in SEQUENTIAL_KINDS:
        raise ValueError(f"u_{instance_id} is not a flip-flop or latch")
    if "D" not in flip_flop.input_pins:
        raise ValueError(f"u_{instance_id} has no recovered D input")

    net = flip_flop.input_pins["D"]
    loads = build_load_index(elements)
    return TraceRoot(
        port_name=f"to_ff_{instance_id}_d",
        label=f"u_{instance_id}.D",
        net=net,
        source=PinReference(instance_id, flip_flop.module, "D"),
        destinations=tuple(loads.get(net, [])),
        is_boundary_input=False,
    )


def sanitize_identifier(name: str) -> str:
    identifier = re.sub(r"[^A-Za-z0-9_$]", "_", name)
    if not identifier or identifier[0].isdigit():
        identifier = f"n_{identifier}"
    return identifier


def boundary_input_names(
    block: RecoveredBlock,
    context: RecoveryContext,
) -> dict[int, str]:
    """Name shift taps, top inputs, and sequential Q boundaries."""

    names = {
        root.net: root.port_name
        for root in block.roots
        if root.is_boundary_input
    }
    top_names = {
        pin.net: sanitize_identifier(pin.name)
        for pin in find_input_pins(context)
    }
    drivers = build_driver_index(context.elements)
    by_id = {element.instance_id: element for element in context.elements}

    for net in sorted(block.boundary_input_nets):
        if net in names:
            continue
        if net in top_names:
            names[net] = top_names[net]
            continue

        sequential_sources = [
            endpoint
            for endpoint in drivers.get(net, [])
            if by_id[endpoint.instance_id].symbol_kind in SEQUENTIAL_KINDS
        ]
        if len(sequential_sources) == 1:
            source = sequential_sources[0]
            names[net] = f"ff_{source.instance_id}_{source.pin.lower()}"
        else:
            names[net] = f"input_net_{net}"

    return names


def destination_output_names(
    block: RecoveredBlock,
    elements: list[SchematicElement],
) -> tuple[dict[int, str], dict[int, list[PinReference]]]:
    by_id = {element.instance_id: element for element in elements}
    by_net: dict[int, list[PinReference]] = {}

    for endpoint in block.destination_pins:
        destination = by_id[endpoint.instance_id]
        net = destination.input_pins[endpoint.pin]
        by_net.setdefault(net, []).append(endpoint)

    names: dict[int, str] = {}
    for net, endpoints in by_net.items():
        if len(endpoints) == 1:
            endpoint = endpoints[0]
            names[net] = f"to_ff_{endpoint.instance_id}_{endpoint.pin.lower()}"
        else:
            names[net] = f"to_sequential_net_{net}"
    return names, by_net


def generate_verilog(
    block: RecoveredBlock,
    context: RecoveryContext,
    module_name: str = "recovered_shift_output_logic",
) -> str:
    """Generate structural SKY130 Verilog for the complete component."""

    input_names = boundary_input_names(block, context)
    output_names, output_destinations = destination_output_names(
        block, context.elements
    )
    constants = {
        net: f"1'b{value}" for net, value in block.constant_nets.items()
    }

    def signal(net: int) -> str:
        if net in input_names:
            return input_names[net]
        if net in output_names:
            return output_names[net]
        if net in constants:
            return constants[net]
        return f"net_{net}"

    ports: list[tuple[str, str, int]] = []
    for net, name in sorted(input_names.items(), key=lambda item: item[1]):
        ports.append(("input", name, net))
    for net, name in sorted(output_names.items(), key=lambda item: item[1]):
        if net not in input_names:
            ports.append(("output", name, net))

    lines = [
        "// Complete register-to-register cone recovered from puzzle.gds.",
        "// Forward search: selected root nets -> destination sequential pins.",
        "// Backward search: destination pins -> all required source signals.",
        f"module {sanitize_identifier(module_name)} (",
    ]
    for index, (direction, name, net) in enumerate(ports):
        comma = "," if index + 1 < len(ports) else ""
        lines.append(
            f"    {direction} wire {name}{comma:<2} // extracted net_{net}"
        )
    lines.extend([");", ""])

    referenced_nets = {
        net
        for cell in block.combinational_cells
        for net in _cell_nets(cell)
    }
    internal_nets = sorted(
        referenced_nets
        - set(input_names)
        - set(output_names)
        - set(constants)
    )
    for net in internal_nets:
        lines.append(f"  wire net_{net};")
    if internal_nets:
        lines.append("")

    for net, endpoints in sorted(output_destinations.items()):
        destination_text = ", ".join(
            f"u_{endpoint.instance_id}.{endpoint.pin}"
            for endpoint in endpoints
        )
        lines.append(f"  // {signal(net)} drives {destination_text}")
    if output_destinations:
        lines.append("")

    for cell in block.combinational_cells:
        functions = "; ".join(
            f"{pin}={function}"
            for pin, function in cell.output_functions.items()
        )
        lines.append(f"  // {short_module(cell.module)}: {functions}")
        connections = list(cell.input_pins.items()) + list(cell.output_pins.items())
        lines.append(f"  {cell.module} u_{cell.instance_id} (")
        for index, (pin, net) in enumerate(connections):
            comma = "," if index + 1 < len(connections) else ""
            lines.append(f"      .{pin}({signal(net)}){comma}")
        lines.append("  );")
        lines.append("")

    lines.extend(["endmodule", ""])
    return "\n".join(lines)


def _pin_net(endpoint: PinReference, by_id: dict[int, SchematicElement]) -> int:
    net = by_id[endpoint.instance_id].pin_net(endpoint.pin)
    if net is None:
        raise RuntimeError(f"Cannot resolve u_{endpoint.instance_id}.{endpoint.pin}")
    return net


def print_summary(block: RecoveredBlock, elements: list[SchematicElement]) -> None:
    by_id = {element.instance_id: element for element in elements}
    loads = build_load_index(elements)
    drivers = build_driver_index(elements)

    print("Starting nets:")
    for root in block.roots:
        destinations = ", ".join(
            f"u_{pin.instance_id}.{pin.pin}({short_module(pin.module)})"
            for pin in root.destinations
        )
        print(f"  {root.label} / net_{root.net} -> {destinations}")

    print(
        f"\nForward Q-to-FF paths: {len(block.root_path_cells)} "
        "combinational cells"
    )
    print(
        f"Complete destination fan-in cone: {len(block.combinational_cells)} "
        "combinational cells"
    )
    for cell in block.combinational_cells:
        print(f"  u_{cell.instance_id} {short_module(cell.module)}")
        for pin, net in cell.input_pins.items():
            sources = ", ".join(
                f"u_{source.instance_id}.{source.pin}"
                for source in drivers.get(net, [])
            ) or "top-level/unresolved"
            print(f"    IN  {pin} <- net_{net} <- {sources}")
        for pin, net in cell.output_pins.items():
            destinations = ", ".join(
                f"u_{load.instance_id}.{load.pin}"
                for load in loads.get(net, [])
            ) or "top-level/unresolved"
            print(f"    OUT {pin} -> net_{net} -> {destinations}")

    print("\nSequential input boundaries:")
    for endpoint in block.source_pins:
        net = _pin_net(endpoint, by_id)
        print(
            f"  u_{endpoint.instance_id}.{endpoint.pin} "
            f"({short_module(endpoint.module)}) -> net_{net}"
        )

    print("Sequential output boundaries:")
    for endpoint in block.destination_pins:
        net = _pin_net(endpoint, by_id)
        print(
            f"  net_{net} -> u_{endpoint.instance_id}.{endpoint.pin} "
            f"({short_module(endpoint.module)})"
        )

    print(f"Boundary input nets: {len(block.boundary_input_nets)}")
    print(f"Constant nets: {len(block.constant_nets)}")
    print(f"Visited nets: {len(block.visited_nets)}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description=(
            "Trace shift-register outputs or one selected flip-flop Q, then "
            "recover the complete combinational fan-in of destination FFs"
        )
    )
    parser.add_argument("gds", nargs="?", type=Path, default=DEFAULT_GDS)
    direction = parser.add_mutually_exclusive_group()
    direction.add_argument(
        "--start-ff",
        type=int,
        metavar="INSTANCE_ID",
        help="trace from u_INSTANCE_ID.Q instead of the shift-register taps",
    )
    direction.add_argument(
        "--target-ff",
        type=int,
        metavar="INSTANCE_ID",
        help="recover the upstream combinational cone driving u_INSTANCE_ID.D",
    )
    parser.add_argument("--output", type=Path)
    parser.add_argument("--module-name")
    args = parser.parse_args()

    context = recover_schematic(args.gds)
    excluded_cell_ids: set[int] = set()

    if args.target_ff is not None:
        roots = [flip_flop_input_trace_root(args.target_ff, context.elements)]
        output = args.output or Path(
            f"scripts/recovered_ff_{args.target_ff}_input_logic.v"
        )
        module_name = args.module_name or f"recovered_ff_{args.target_ff}_input_logic"
    elif args.start_ff is not None:
        roots = [flip_flop_trace_root(args.start_ff, context.elements)]
        output = args.output or Path(
            f"scripts/recovered_ff_{args.start_ff}_output_logic.v"
        )
        module_name = args.module_name or f"recovered_ff_{args.start_ff}_output_logic"
    else:
        registers = find_shift_registers(context.elements)
        if not registers:
            raise RuntimeError("No shift register found")
        shift_register = registers[0]
        outputs = find_shift_register_outputs(shift_register, context.elements)
        roots = shift_trace_roots(outputs)
        excluded_cell_ids = {
            element.instance_id
            for stage in shift_register.stages
            for element in (stage.mux, stage.dff)
        }
        output = args.output or DEFAULT_VERILOG
        module_name = args.module_name or "recovered_shift_output_logic"

    block = trace_combinational_block(
        roots,
        context.elements,
        excluded_cell_ids=excluded_cell_ids,
    )
    verilog = generate_verilog(block, context, module_name)

    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(verilog)

    print_summary(block, context.elements)
    print(f"\nStructural Verilog: {output}")


if __name__ == "__main__":
    main()
