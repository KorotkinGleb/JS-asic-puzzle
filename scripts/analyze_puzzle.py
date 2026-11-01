"""Structural analysis of puzzle.gds using only GDS geometry and the SKY130 PDK."""

from __future__ import annotations

from collections import Counter, defaultdict
from dataclasses import dataclass
from pathlib import Path

import klayout.db as kdb

try:
    from .klayoutexmp import (
        DFFR,
        MUX2,
        LogicDefinition,
        RecognizedCell,
        RegisterStage,
        extract_conductor_nets,
        follows,
        is_stage,
        load_liberty_logic,
        load_pdk_cell_names,
        recognize_schematic_cells,
        share_pin_net,
        single_pin_net,
    )
except ImportError:
    from klayoutexmp import (
        DFFR,
        MUX2,
        LogicDefinition,
        RecognizedCell,
        RegisterStage,
        extract_conductor_nets,
        follows,
        is_stage,
        load_liberty_logic,
        load_pdk_cell_names,
        recognize_schematic_cells,
        share_pin_net,
        single_pin_net,
    )


PUZZLE_GDS = Path("puzzle.gds")
LABEL_DATATYPE = 5

# Label layer numbers follow their routing metal. Via layers reuse the same
# GDS layer numbers, so list only the actual conductor to avoid duplicate ports.
LABEL_CONDUCTORS = {
    67: "li",
    68: "met1",
    69: "met2",
    70: "met3",
    71: "met4",
    72: "met5",
}


@dataclass
class Port:
    name: str
    conductor: str
    net: int
    point: kdb.Point


@dataclass
class FaninCone:
    cells: list[RecognizedCell]
    register_boundaries: list[RecognizedCell]


@dataclass
class BlockConnection:
    source_bit: int
    net: int
    source_cell: RecognizedCell
    destination_pins: list[tuple[RecognizedCell, str]]


@dataclass
class RecoveredGateInterface:
    cell: RecognizedCell
    input_nets: dict[str, int]
    output_nets: dict[str, int]
    output_functions: dict[str, str]


def extract_top_ports(
    layout: kdb.Layout,
    top: kdb.Cell,
    l2n: kdb.LayoutToNetlist,
) -> list[Port]:
    """Resolve top-level GDS text labels to extracted conductor net IDs."""
    ports: list[Port] = []

    for gds_layer, conductor in LABEL_CONDUCTORS.items():
        label_layer = layout.layer(gds_layer, LABEL_DATATYPE)
        conductor_region = l2n.polygons_by_name(conductor)

        for shape in top.shapes(label_layer).each():
            if not shape.is_text():
                continue

            text = shape.text
            point = text.trans.disp
            net = l2n.probe_net(conductor_region, point)
            if net is None:
                continue

            ports.append(
                Port(
                    name=text.string,
                    conductor=conductor,
                    net=net.cluster_id,
                    point=point,
                )
            )

    return ports


def build_driver_index(
    cells: list[RecognizedCell],
    logic: dict[str, LogicDefinition],
) -> dict[int, list[RecognizedCell]]:
    """Index functional cell output nets for backward graph traversal."""
    drivers: dict[int, list[RecognizedCell]] = defaultdict(list)

    for cell in cells:
        definition = logic.get(cell.cell_type)
        if definition is None:
            continue
        for output_pin in definition.output_functions:
            net = single_pin_net(cell, output_pin)
            if net is not None:
                drivers[net].append(cell)

    return drivers


def combinational_fanin(
    output_net: int,
    drivers: dict[int, list[RecognizedCell]],
    logic: dict[str, LogicDefinition],
) -> FaninCone:
    """Trace an output backward, stopping at flip-flop/latch boundaries."""
    cells: dict[int, RecognizedCell] = {}
    boundaries: dict[int, RecognizedCell] = {}
    visited_nets: set[int] = set()

    def visit(net: int) -> None:
        if net in visited_nets:
            return
        visited_nets.add(net)

        for cell in drivers.get(net, []):
            if cell.symbol_kind in {"flip-flop", "latch"}:
                boundaries[cell.instance_id] = cell
                continue

            cells[cell.instance_id] = cell
            definition = logic[cell.cell_type]
            for input_pin in definition.input_pins:
                input_net = single_pin_net(cell, input_pin)
                if input_net is not None:
                    visit(input_net)

    visit(output_net)
    return FaninCone(list(cells.values()), list(boundaries.values()))


def region_text(cells: list[RecognizedCell], dbu: float) -> str:
    if not cells:
        return "no placed cells"

    left = min(cell.bbox.left for cell in cells) * dbu
    bottom = min(cell.bbox.bottom for cell in cells) * dbu
    right = max(cell.bbox.right for cell in cells) * dbu
    top = max(cell.bbox.top for cell in cells) * dbu
    return f"x={left:.3f}..{right:.3f}, y={bottom:.3f}..{top:.3f} um"


def find_mux_register_chains(
    cells: list[RecognizedCell],
) -> tuple[list[RegisterStage], list[list[RegisterStage]]]:
    muxes = [cell for cell in cells if cell.cell_type == MUX2]
    dffs = [cell for cell in cells if cell.cell_type == DFFR]
    stages = [
        RegisterStage(mux, dff)
        for mux in muxes
        for dff in dffs
        if is_stage(mux, dff)
    ]

    successors: dict[int, list[int]] = {
        index: [] for index in range(len(stages))
    }
    predecessors: dict[int, list[int]] = {
        index: [] for index in range(len(stages))
    }
    for previous_index, previous in enumerate(stages):
        for following_index, following in enumerate(stages):
            if previous_index != following_index and follows(previous, following):
                successors[previous_index].append(following_index)
                predecessors[following_index].append(previous_index)

    chains: list[list[RegisterStage]] = []
    for root in (index for index in predecessors if not predecessors[index]):
        indexes: list[int] = []
        current = root
        while current not in indexes:
            indexes.append(current)
            if len(successors[current]) != 1:
                break
            current = successors[current][0]

        chain = [stages[index] for index in indexes]
        # The puzzle's clock tree splits one logical clock into local buffered
        # branches, so CLK cluster IDs need not be identical across the chain.
        if (
            len(chain) >= 2
            and share_pin_net(chain, "mux", "S")
            and share_pin_net(chain, "dff", "RESET_B")
        ):
            chains.append(chain)

    return stages, chains


def find_shift_register_outputs(
    chain: list[RegisterStage],
    all_cells: list[RecognizedCell],
    logic: dict[str, LogicDefinition],
) -> list[BlockConnection]:
    """Return Q nets that cross from a shift chain into external logic."""
    chain_cell_ids = {
        cell.instance_id
        for stage in chain
        for cell in (stage.mux, stage.dff)
    }
    connections: list[BlockConnection] = []

    for bit, stage in enumerate(chain):
        q_net = single_pin_net(stage.dff, "Q")
        if q_net is None:
            continue

        destinations: list[tuple[RecognizedCell, str]] = []
        for cell in all_cells:
            if cell.instance_id in chain_cell_ids:
                continue
            definition = logic[cell.cell_type]
            for input_pin in definition.input_pins:
                if single_pin_net(cell, input_pin) == q_net:
                    destinations.append((cell, input_pin))

        if destinations:
            connections.append(
                BlockConnection(
                    source_bit=bit,
                    net=q_net,
                    source_cell=stage.dff,
                    destination_pins=destinations,
                )
            )

    return connections


def recover_destination_gate_interfaces(
    connections: list[BlockConnection],
    logic: dict[str, LogicDefinition],
) -> list[RecoveredGateInterface]:
    """Recover complete logical interfaces of gates receiving shift outputs."""
    destination_cells = {
        cell.instance_id: cell
        for connection in connections
        for cell, _pin in connection.destination_pins
    }
    interfaces: list[RecoveredGateInterface] = []

    for cell in destination_cells.values():
        definition = logic[cell.cell_type]
        input_nets = {
            pin: net
            for pin in definition.input_pins
            if (net := single_pin_net(cell, pin)) is not None
        }
        output_nets = {
            pin: net
            for pin in definition.output_functions
            if (net := single_pin_net(cell, pin)) is not None
        }
        interfaces.append(
            RecoveredGateInterface(
                cell=cell,
                input_nets=input_nets,
                output_nets=output_nets,
                output_functions=dict(definition.output_functions),
            )
        )

    return sorted(interfaces, key=lambda interface: interface.cell.instance_id)


def print_clock_groups(cells: list[RecognizedCell], dbu: float) -> None:
    groups: dict[int | None, list[RecognizedCell]] = defaultdict(list)
    for cell in cells:
        if cell.symbol_kind == "flip-flop":
            groups[single_pin_net(cell, "CLK")].append(cell)

    print("\nFlip-flop clock groups:")
    for net, group in sorted(groups.items(), key=lambda item: -len(item[1])):
        net_name = f"net_{net}" if net is not None else "unresolved"
        print(
            f"  {net_name}: {len(group)} flip-flops; "
            f"{region_text(group, dbu)}"
        )


def print_connectivity_quality(
    cells: list[RecognizedCell],
    logic: dict[str, LogicDefinition],
    drivers: dict[int, list[RecognizedCell]],
) -> None:
    expected_pins = 0
    missing_pins = 0
    ambiguous_pins = 0

    for cell in cells:
        definition = logic[cell.cell_type]
        pins = set(definition.input_pins) | set(definition.output_functions)
        expected_pins += len(pins)
        for pin in pins:
            resolved = cell.pin_nets.get(pin, set())
            if not resolved:
                missing_pins += 1
            elif len(resolved) != 1:
                ambiguous_pins += 1

    multiple_driver_nets = sum(
        len(net_drivers) > 1 for net_drivers in drivers.values()
    )
    print("\nConnectivity quality:")
    print(f"  expected functional pins: {expected_pins}")
    print(f"  unresolved functional pins: {missing_pins}")
    print(f"  ambiguous functional pins: {ambiguous_pins}")
    print(f"  nets with multiple functional drivers: {multiple_driver_nets}")


def print_control_fanout(
    ports: list[Port],
    cells: list[RecognizedCell],
    logic: dict[str, LogicDefinition],
) -> None:
    interesting = {"I", "clk", "enable", "rst_n"}
    print("\nDirect top-input fanout:")

    for port in (item for item in ports if item.name in interesting):
        connections: Counter[str] = Counter()
        for cell in cells:
            definition = logic[cell.cell_type]
            for input_pin in definition.input_pins:
                if single_pin_net(cell, input_pin) == port.net:
                    connections[f"{cell.symbol_kind}.{input_pin}"] += 1

        summary = ", ".join(
            f"{name}={count}" for name, count in sorted(connections.items())
        )
        print(f"  {port.name} (net_{port.net}): {summary or 'no direct loads'}")


def print_register_boundaries(
    title: str,
    registers: list[RecognizedCell],
    dbu: float,
) -> None:
    """Print the state bits on the boundary of a combinational block."""
    print(f"\n{title}: {len(registers)} registers")
    for cell in sorted(
        registers,
        key=lambda item: (item.transform.disp.y, item.transform.disp.x),
        reverse=True,
    ):
        point = cell.transform.disp
        print(
            f"  u_{cell.instance_id}: Q=net_{single_pin_net(cell, 'Q')}, "
            f"D=net_{single_pin_net(cell, 'D')}, "
            f"CLK=net_{single_pin_net(cell, 'CLK')} at "
            f"({point.x * dbu:.3f}, {point.y * dbu:.3f}) um"
        )


def main() -> None:
    if not PUZZLE_GDS.is_file():
        raise FileNotFoundError(f"GDS not found: {PUZZLE_GDS}")

    layout = kdb.Layout()
    layout.read(str(PUZZLE_GDS))
    top = layout.top_cell()
    logic = load_liberty_logic(load_pdk_cell_names())
    l2n = extract_conductor_nets(layout, top)
    cells = recognize_schematic_cells(layout, top, l2n, logic)
    ports = extract_top_ports(layout, top, l2n)
    drivers = build_driver_index(cells, logic)
    stages, chains = find_mux_register_chains(cells)

    print(f"GDS: {PUZZLE_GDS}")
    print(f"Top cell: {top.name}")
    print(f"Layout bounds: {region_text(cells, layout.dbu)}")
    print(f"Functional schematic instances: {len(cells)}")
    print("Cell categories:")
    for kind, count in sorted(Counter(cell.symbol_kind for cell in cells).items()):
        print(f"  {kind}: {count}")

    print("\nTop-level ports:")
    for port in sorted(ports, key=lambda item: item.name):
        print(
            f"  {port.name}: net_{port.net} on {port.conductor} at "
            f"({port.point.x * layout.dbu:.3f}, "
            f"{port.point.y * layout.dbu:.3f}) um"
        )

    print_connectivity_quality(cells, logic, drivers)
    print_control_fanout(ports, cells, logic)
    print_clock_groups(cells, layout.dbu)

    print(f"\nEnable-MUX + DFF stages: {len(stages)}")
    selector_counts = Counter(single_pin_net(stage.mux, "S") for stage in stages)
    for selector_net, count in selector_counts.items():
        print(f"  selector net_{selector_net}: {count} stages")
    print(f"Verified shift-register chains (buffered clocks allowed): {len(chains)}")
    for index, chain in enumerate(chains, start=1):
        chain_cells = [part for stage in chain for part in (stage.mux, stage.dff)]
        serial_input = single_pin_net(chain[0].mux, "A1")
        q_nets = [single_pin_net(stage.dff, "Q") for stage in chain]
        print(
            f"  chain_{index}: {len(chain)} bits; "
            f"{region_text(chain_cells, layout.dbu)}"
        )
        print(f"    serial input: net_{serial_input}")
        print("    Q order: " + " -> ".join(f"net_{net}" for net in q_nets))

        boundary_connections = find_shift_register_outputs(chain, cells, logic)
        print("    outputs crossing into external/state logic:")
        for connection in boundary_connections:
            destinations = ", ".join(
                f"u_{cell.instance_id}.{pin} "
                f"({cell.cell_type.removeprefix('sky130_fd_sc_hd__')})"
                for cell, pin in connection.destination_pins
            )
            print(
                f"      shift_q[{connection.source_bit}] / net_{connection.net} "
                f"-> {destinations}"
            )

        shift_names = {
            connection.net: f"shift_q[{connection.source_bit}]"
            for connection in boundary_connections
        }
        interfaces = recover_destination_gate_interfaces(
            boundary_connections,
            logic,
        )
        print("    complete destination-gate interfaces:")
        for interface in interfaces:
            short_name = interface.cell.cell_type.removeprefix(
                "sky130_fd_sc_hd__"
            )
            print(f"      u_{interface.cell.instance_id} ({short_name})")
            for pin, net in interface.input_nets.items():
                source = shift_names.get(net)
                annotation = f" <- {source}" if source else ""
                print(f"        input  {pin:>2} = net_{net}{annotation}")
            for pin, net in interface.output_nets.items():
                function = interface.output_functions[pin]
                print(f"        output {pin:>2} = net_{net}")
                print(f"        logic  {pin:>2} = {function}")

    print("\nCombinational output cones (stopping at registers):")
    output_names = {"success", *(f"O[{bit}]" for bit in range(8))}
    output_boundaries: dict[int, RecognizedCell] = {}
    success_boundaries: dict[int, RecognizedCell] = {}
    for port in sorted(
        (port for port in ports if port.name in output_names),
        key=lambda item: item.name,
    ):
        cone = combinational_fanin(port.net, drivers, logic)
        destination = (
            success_boundaries if port.name == "success" else output_boundaries
        )
        destination.update(
            (cell.instance_id, cell) for cell in cone.register_boundaries
        )
        print(
            f"  {port.name}: {len(cone.cells)} combinational cells, "
            f"{len(cone.register_boundaries)} register inputs; "
            f"{region_text(cone.cells, layout.dbu)}"
        )

    print_register_boundaries(
        "Union of O[7:0] state boundaries",
        list(output_boundaries.values()),
        layout.dbu,
    )
    print_register_boundaries(
        "Success output boundary",
        list(success_boundaries.values()),
        layout.dbu,
    )


if __name__ == "__main__":
    main()
