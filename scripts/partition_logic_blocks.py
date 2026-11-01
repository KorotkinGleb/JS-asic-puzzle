"""Partition a recovered GDS netlist into physically local logic-block candidates.

The graph contains one node per functional standard-cell instance. A directed
edge connects a driving cell to a loading cell. Global/control nets and edges
longer than a configurable physical threshold do not join components. The
remaining connected components become candidate higher-level logical blocks.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict
from dataclasses import dataclass
from math import hypot
from pathlib import Path

import klayout.db as kdb

try:
    from .analyze_puzzle import (
        Port,
        extract_top_ports,
        find_mux_register_chains,
        region_text,
    )
    from .klayoutexmp import (
        LogicDefinition,
        RecognizedCell,
        extract_conductor_nets,
        load_liberty_logic,
        load_pdk_cell_names,
        recognize_schematic_cells,
        single_pin_net,
    )
except ImportError:
    from analyze_puzzle import (
        Port,
        extract_top_ports,
        find_mux_register_chains,
        region_text,
    )
    from klayoutexmp import (
        LogicDefinition,
        RecognizedCell,
        extract_conductor_nets,
        load_liberty_logic,
        load_pdk_cell_names,
        recognize_schematic_cells,
        single_pin_net,
    )


DEFAULT_GDS = Path("puzzle.gds")

# These connections distribute control rather than express local data flow.
# They remain block boundary nets, but do not merge otherwise unrelated logic.
NON_DATA_PINS = {
    "CLK",
    "GATE",
    "RESET_B",
    "SET_B",
    "SLEEP",
    "VPWR",
    "VGND",
    "VPB",
    "VNB",
}


@dataclass(frozen=True)
class PinEndpoint:
    cell_id: int
    pin: str


@dataclass(frozen=True)
class CellEdge:
    net: int
    source: PinEndpoint
    target: PinEndpoint
    distance_um: float


@dataclass
class LogicBlock:
    block_id: int
    cells: list[RecognizedCell]
    input_nets: set[int]
    output_nets: set[int]
    internal_nets: set[int]


class UnionFind:
    def __init__(self, items: list[int]) -> None:
        self.parent = {item: item for item in items}
        self.rank = {item: 0 for item in items}

    def find(self, item: int) -> int:
        root = item
        while self.parent[root] != root:
            root = self.parent[root]
        while self.parent[item] != item:
            parent = self.parent[item]
            self.parent[item] = root
            item = parent
        return root

    def union(self, first: int, second: int) -> None:
        first_root = self.find(first)
        second_root = self.find(second)
        if first_root == second_root:
            return

        if self.rank[first_root] < self.rank[second_root]:
            first_root, second_root = second_root, first_root
        self.parent[second_root] = first_root
        if self.rank[first_root] == self.rank[second_root]:
            self.rank[first_root] += 1


def build_net_endpoints(
    cells: list[RecognizedCell],
    logic: dict[str, LogicDefinition],
) -> tuple[
    dict[int, list[PinEndpoint]],
    dict[int, list[PinEndpoint]],
]:
    """Build net-to-driver and net-to-load indexes from recognized pins."""
    drivers: dict[int, list[PinEndpoint]] = defaultdict(list)
    loads: dict[int, list[PinEndpoint]] = defaultdict(list)

    for cell in cells:
        definition = logic[cell.cell_type]
        for pin in definition.input_pins:
            net = single_pin_net(cell, pin)
            if net is not None:
                loads[net].append(PinEndpoint(cell.instance_id, pin))
        for pin in definition.output_functions:
            net = single_pin_net(cell, pin)
            if net is not None:
                drivers[net].append(PinEndpoint(cell.instance_id, pin))

    return drivers, loads


def cell_center(cell: RecognizedCell, dbu: float) -> tuple[float, float]:
    return (
        (cell.bbox.left + cell.bbox.right) * dbu / 2,
        (cell.bbox.bottom + cell.bbox.top) * dbu / 2,
    )


def build_cell_edges(
    cells: list[RecognizedCell],
    drivers: dict[int, list[PinEndpoint]],
    loads: dict[int, list[PinEndpoint]],
    dbu: float,
) -> list[CellEdge]:
    """Create driver-to-load edges and attach Euclidean placement distance."""
    by_id = {cell.instance_id: cell for cell in cells}
    centers = {
        cell.instance_id: cell_center(cell, dbu)
        for cell in cells
    }
    edges: list[CellEdge] = []

    for net, net_loads in loads.items():
        net_drivers = drivers.get(net, [])
        if len(net_drivers) != 1:
            # Top-level inputs have no cell driver. Multi-driver nets are kept
            # as boundaries because they are unsafe to use for clustering.
            continue

        source = net_drivers[0]
        if source.cell_id not in by_id:
            continue

        source_x, source_y = centers[source.cell_id]
        for target in net_loads:
            if target.cell_id == source.cell_id or target.pin in NON_DATA_PINS:
                continue
            target_x, target_y = centers[target.cell_id]
            edges.append(
                CellEdge(
                    net=net,
                    source=source,
                    target=target,
                    distance_um=hypot(target_x - source_x, target_y - source_y),
                )
            )

    return edges


def partition_logic_blocks(
    cells: list[RecognizedCell],
    drivers: dict[int, list[PinEndpoint]],
    loads: dict[int, list[PinEndpoint]],
    edges: list[CellEdge],
    max_distance_um: float,
    max_fanout: int,
) -> list[LogicBlock]:
    """Cut long/high-fanout edges, then return connected cell components."""
    by_id = {cell.instance_id: cell for cell in cells}
    union_find = UnionFind(list(by_id))

    for edge in edges:
        if len(loads[edge.net]) > max_fanout:
            continue
        if edge.distance_um > max_distance_um:
            continue
        union_find.union(edge.source.cell_id, edge.target.cell_id)

    component_ids: dict[int, list[int]] = defaultdict(list)
    for cell_id in by_id:
        component_ids[union_find.find(cell_id)].append(cell_id)

    components = sorted(
        component_ids.values(),
        key=lambda ids: (-len(ids), min(ids)),
    )
    blocks: list[LogicBlock] = []

    for block_id, ids in enumerate(components, start=1):
        id_set = set(ids)
        input_nets: set[int] = set()
        output_nets: set[int] = set()
        internal_nets: set[int] = set()

        all_nets = {
            net
            for cell_id in ids
            for net_set in by_id[cell_id].pin_nets.values()
            for net in net_set
        }
        for net in all_nets:
            driver_ids = {endpoint.cell_id for endpoint in drivers.get(net, [])}
            load_ids = {endpoint.cell_id for endpoint in loads.get(net, [])}
            driver_inside = bool(driver_ids & id_set)
            load_inside = bool(load_ids & id_set)

            if load_inside and not driver_ids.issubset(id_set):
                input_nets.add(net)
            if load_inside and not driver_ids:
                input_nets.add(net)
            if driver_inside and (
                not load_ids or not load_ids.issubset(id_set)
            ):
                output_nets.add(net)
            if driver_inside and load_inside:
                internal_nets.add(net)

        blocks.append(
            LogicBlock(
                block_id=block_id,
                cells=[by_id[cell_id] for cell_id in ids],
                input_nets=input_nets,
                output_nets=output_nets,
                internal_nets=internal_nets,
            )
        )

    return blocks


def percentile(values: list[float], fraction: float) -> float:
    if not values:
        return 0.0
    ordered = sorted(values)
    index = round((len(ordered) - 1) * fraction)
    return ordered[index]


def net_name(net: int, port_names: dict[int, list[str]]) -> str:
    names = port_names.get(net, [])
    return "/".join(names) if names else f"net_{net}"


def infer_role(
    block: LogicBlock,
    shift_chain_ids: set[int],
    top_output_nets: set[int],
) -> str:
    ids = {cell.instance_id for cell in block.cells}
    kinds = Counter(cell.symbol_kind for cell in block.cells)
    output_hits = block.output_nets & top_output_nets

    if shift_chain_ids and shift_chain_ids.issubset(ids):
        return "verified 12-bit shift register"
    if output_hits and kinds["flip-flop"]:
        return "registered output/state block"
    if output_hits:
        return "combinational output block"
    if kinds["flip-flop"] >= 2:
        return "sequential state-machine/counter candidate"
    if kinds["XOR gate"] + kinds["XNOR gate"] >= 3:
        return "comparison/arithmetic candidate"
    if kinds["buffer"] == len(block.cells):
        return "buffer-tree fragment"
    return "combinational logic candidate"


def print_blocks(
    blocks: list[LogicBlock],
    ports: list[Port],
    dbu: float,
    shift_chain_ids: set[int],
    min_cells: int,
    limit: int,
) -> None:
    port_names: dict[int, list[str]] = defaultdict(list)
    for port in ports:
        if port.name not in port_names[port.net]:
            port_names[port.net].append(port.name)
    top_output_nets = {
        port.net
        for port in ports
        if port.name == "success" or port.name.startswith("O[")
    }

    candidates = [block for block in blocks if len(block.cells) >= min_cells]
    print(
        f"Candidate blocks with at least {min_cells} cells: "
        f"{len(candidates)}"
    )

    for block in candidates[:limit]:
        kinds = Counter(cell.symbol_kind for cell in block.cells)
        kind_summary = ", ".join(
            f"{kind}={count}" for kind, count in sorted(kinds.items())
        )
        input_summary = ", ".join(
            net_name(net, port_names) for net in sorted(block.input_nets)
        )
        output_summary = ", ".join(
            net_name(net, port_names) for net in sorted(block.output_nets)
        )
        print(
            f"\nblock_{block.block_id}: {len(block.cells)} cells — "
            f"{infer_role(block, shift_chain_ids, top_output_nets)}"
        )
        print(f"  region: {region_text(block.cells, dbu)}")
        print(f"  cells: {kind_summary}")
        print(f"  inputs ({len(block.input_nets)}): {input_summary or 'none'}")
        print(f"  outputs ({len(block.output_nets)}): {output_summary or 'none'}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Partition a GDS-derived cell graph into local logic blocks",
    )
    parser.add_argument("gds", nargs="?", type=Path, default=DEFAULT_GDS)
    parser.add_argument("--max-distance", type=float, default=18.0)
    parser.add_argument("--max-fanout", type=int, default=12)
    parser.add_argument("--min-cells", type=int, default=3)
    parser.add_argument("--limit", type=int, default=25)
    args = parser.parse_args()

    layout = kdb.Layout()
    layout.read(str(args.gds))
    top = layout.top_cell()
    logic = load_liberty_logic(load_pdk_cell_names())
    l2n = extract_conductor_nets(layout, top)
    cells = recognize_schematic_cells(layout, top, l2n, logic)
    ports = extract_top_ports(layout, top, l2n)
    drivers, loads = build_net_endpoints(cells, logic)
    edges = build_cell_edges(cells, drivers, loads, layout.dbu)
    blocks = partition_logic_blocks(
        cells,
        drivers,
        loads,
        edges,
        max_distance_um=args.max_distance,
        max_fanout=args.max_fanout,
    )

    _stages, shift_chains = find_mux_register_chains(cells)
    shift_chain_ids = {
        cell.instance_id
        for chain in shift_chains
        for stage in chain
        for cell in (stage.mux, stage.dff)
    }

    eligible_lengths = [
        edge.distance_um
        for edge in edges
        if len(loads[edge.net]) <= args.max_fanout
    ]
    joined_edges = sum(
        edge.distance_um <= args.max_distance
        and len(loads[edge.net]) <= args.max_fanout
        for edge in edges
    )

    print(f"GDS: {args.gds}; top: {top.name}")
    print(f"Graph nodes: {len(cells)} functional cells")
    print(f"Directed data edges: {len(edges)}")
    print(
        "Eligible edge distances: "
        f"p50={percentile(eligible_lengths, 0.50):.2f}, "
        f"p75={percentile(eligible_lengths, 0.75):.2f}, "
        f"p90={percentile(eligible_lengths, 0.90):.2f}, "
        f"p95={percentile(eligible_lengths, 0.95):.2f} um"
    )
    print(
        f"Partition: max_distance={args.max_distance:.2f} um, "
        f"max_fanout={args.max_fanout}; joined edges={joined_edges}"
    )
    print(f"All connected components: {len(blocks)}")
    print_blocks(
        blocks,
        ports,
        layout.dbu,
        shift_chain_ids,
        args.min_cells,
        args.limit,
    )


if __name__ == "__main__":
    main()
