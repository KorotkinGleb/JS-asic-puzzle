"""Recover likely multi-bit register groups from an extracted GDS netlist.

The result is heuristic because synthesis and place-and-route remove RTL bus
names and hierarchy.  The script combines independent evidence:

* normalized clock root and clock-gating branch;
* reset/set signature and flip-flop family;
* physical proximity;
* backward FF.D fan-in dependencies;
* forward FF.Q fan-out and shared decoder cells;
* similarity of next-state combinational cones.

Exact MUX+DFF shift chains discovered by ``find_shift_registers`` are reported
separately with high confidence.  Other groups are conservative candidates.
"""

from __future__ import annotations

import argparse
from collections import Counter, defaultdict, deque
from dataclasses import dataclass
import json
import math
from pathlib import Path
import re

try:
    from .recover_schematic_elements import (
        RecoveryContext,
        SchematicElement,
        build_driver_index,
        build_load_index,
        find_input_pins,
        find_shift_registers,
        recover_schematic,
        short_module,
    )
except ImportError:
    from recover_schematic_elements import (
        RecoveryContext,
        SchematicElement,
        build_driver_index,
        build_load_index,
        find_input_pins,
        find_shift_registers,
        recover_schematic,
        short_module,
    )


DEFAULT_GDS = Path("puzzle.gds")
DEFAULT_REPORT = Path("scripts/recovered_register_groups.json")
SEQUENTIAL_KINDS = {"flip-flop", "latch"}
CLOCK_BUFFER_PREFIXES = (
    "clkbuf",
    "clkinv",
    "clkdlybuf",
    "dlygate",
    "buf",
    "inv",
)
CLOCK_GATE_PREFIXES = ("dlclkp", "sdlclkp")
PAIR_THRESHOLD = 0.66
MAX_HEURISTIC_GROUP_SIZE = 16
MAX_HEURISTIC_SPAN_UM = 40.0


@dataclass(frozen=True)
class ClockTrace:
    local_net: int
    root_net: int
    path_nets: tuple[int, ...]
    buffer_ids: tuple[int, ...]
    gate_ids: tuple[int, ...]
    gate_control_nets: tuple[int, ...]


@dataclass
class FaninCone:
    cells: set[int]
    cell_types: set[str]
    source_ffs: set[int]
    source_latches: set[int]
    boundary_nets: set[int]
    visited_nets: set[int]


@dataclass
class FlipFlopInfo:
    cell: SchematicElement
    clock: ClockTrace
    reset_signature: tuple[tuple[str, int], ...]
    family: str
    d_net: int
    q_net: int
    center_um: tuple[float, float]
    fanin: FaninCone
    immediate_q_loads: set[int]
    forward_cells: set[int]
    d_driver_inputs: set[int]


@dataclass(frozen=True)
class PairEvidence:
    first: int
    second: int
    score: float
    reasons: tuple[str, ...]


@dataclass
class RegisterGroup:
    kind: str
    confidence: float
    members: list[int]
    evidence: list[str]
    bit_order: list[int] | None = None


def base_cell_name(cell: SchematicElement) -> str:
    return re.sub(r"_\d+$", "", short_module(cell.module))


def _single_clock_input(cell: SchematicElement) -> int | None:
    if len(cell.input_pins) != 1:
        return None
    return next(iter(cell.input_pins.values()))


def trace_clock(
    local_net: int,
    elements: list[SchematicElement],
    drivers: dict[int, list],
) -> ClockTrace:
    """Trace a local FF clock backward through CTS buffers and clock gates."""

    by_id = {element.instance_id: element for element in elements}
    current = local_net
    path_nets = [current]
    buffers: list[int] = []
    gates: list[int] = []
    gate_controls: list[int] = []
    seen_nets: set[int] = set()

    while current not in seen_nets:
        seen_nets.add(current)
        endpoints = drivers.get(current, [])
        if len(endpoints) != 1:
            break

        driver = by_id[endpoints[0].instance_id]
        name = base_cell_name(driver)

        if name.startswith(CLOCK_GATE_PREFIXES):
            clock_pin = next(
                (
                    pin
                    for pin in ("CLK", "GCLK", "A")
                    if pin in driver.input_pins
                ),
                None,
            )
            if clock_pin is None:
                break
            gates.append(driver.instance_id)
            gate_controls.extend(
                net
                for pin, net in driver.input_pins.items()
                if pin != clock_pin
            )
            current = driver.input_pins[clock_pin]
            path_nets.append(current)
            continue

        if not name.startswith(CLOCK_BUFFER_PREFIXES):
            break
        input_net = _single_clock_input(driver)
        if input_net is None:
            break
        buffers.append(driver.instance_id)
        current = input_net
        path_nets.append(current)

    return ClockTrace(
        local_net=local_net,
        root_net=current,
        path_nets=tuple(path_nets),
        buffer_ids=tuple(buffers),
        gate_ids=tuple(gates),
        gate_control_nets=tuple(sorted(set(gate_controls))),
    )


def recover_fanin(
    d_net: int,
    elements: list[SchematicElement],
    drivers: dict[int, list],
) -> FaninCone:
    """Walk backward from one D net until sequential/top-level boundaries."""

    by_id = {element.instance_id: element for element in elements}
    queue = deque([d_net])
    visited_nets: set[int] = set()
    cells: set[int] = set()
    cell_types: set[str] = set()
    source_ffs: set[int] = set()
    source_latches: set[int] = set()
    boundary_nets: set[int] = set()

    while queue:
        net = queue.popleft()
        if net in visited_nets:
            continue
        visited_nets.add(net)
        endpoints = drivers.get(net, [])
        if not endpoints:
            boundary_nets.add(net)
            continue

        for endpoint in endpoints:
            driver = by_id[endpoint.instance_id]
            if driver.symbol_kind == "flip-flop":
                source_ffs.add(driver.instance_id)
                continue
            if driver.symbol_kind == "latch":
                source_latches.add(driver.instance_id)
                continue
            if driver.symbol_kind == "constant source":
                continue
            if driver.instance_id in cells:
                continue
            cells.add(driver.instance_id)
            cell_types.add(base_cell_name(driver))
            queue.extend(driver.input_pins.values())

    return FaninCone(
        cells=cells,
        cell_types=cell_types,
        source_ffs=source_ffs,
        source_latches=source_latches,
        boundary_nets=boundary_nets,
        visited_nets=visited_nets,
    )


def recover_forward_cells(
    q_net: int,
    elements: list[SchematicElement],
    loads: dict[int, list],
    max_depth: int = 2,
) -> set[int]:
    """Collect a shallow Q fan-out signature without crossing sequential cells."""

    by_id = {element.instance_id: element for element in elements}
    queue = deque([(q_net, 0)])
    visited: set[tuple[int, int]] = set()
    cells: set[int] = set()

    while queue:
        net, depth = queue.popleft()
        marker = (net, depth)
        if marker in visited:
            continue
        visited.add(marker)

        for endpoint in loads.get(net, []):
            load = by_id[endpoint.instance_id]
            if load.symbol_kind in SEQUENTIAL_KINDS:
                continue
            cells.add(load.instance_id)
            if depth < max_depth:
                queue.extend(
                    (output_net, depth + 1)
                    for output_net in load.output_pins.values()
                )
    return cells


def _jaccard(first: set, second: set) -> float:
    union = first | second
    return len(first & second) / len(union) if union else 0.0


def _center_um(cell: SchematicElement, dbu: float) -> tuple[float, float]:
    return (
        (cell.bbox.left + cell.bbox.right) * 0.5 * dbu,
        (cell.bbox.bottom + cell.bbox.top) * 0.5 * dbu,
    )


def build_ff_information(context: RecoveryContext) -> dict[int, FlipFlopInfo]:
    elements = context.elements
    by_id = {element.instance_id: element for element in elements}
    drivers = build_driver_index(elements)
    loads = build_load_index(elements)
    information: dict[int, FlipFlopInfo] = {}

    for cell in elements:
        if cell.symbol_kind != "flip-flop":
            continue
        d_net = cell.input_pins.get("D")
        q_net = cell.output_pins.get("Q")
        clock_net = cell.input_pins.get("CLK")
        if d_net is None or q_net is None or clock_net is None:
            continue

        immediate_loads = {
            endpoint.instance_id
            for endpoint in loads.get(q_net, [])
            if endpoint.instance_id != cell.instance_id
            and by_id[endpoint.instance_id].symbol_kind not in SEQUENTIAL_KINDS
        }
        d_drivers = drivers.get(d_net, [])
        d_driver_inputs: set[int] = set()
        for endpoint in d_drivers:
            driver = by_id[endpoint.instance_id]
            if driver.symbol_kind not in SEQUENTIAL_KINDS:
                d_driver_inputs.update(driver.input_pins.values())

        reset_signature = tuple(
            sorted(
                (pin, net)
                for pin, net in cell.input_pins.items()
                if "RESET" in pin or "SET" in pin
            )
        )
        information[cell.instance_id] = FlipFlopInfo(
            cell=cell,
            clock=trace_clock(clock_net, elements, drivers),
            reset_signature=reset_signature,
            family=base_cell_name(cell),
            d_net=d_net,
            q_net=q_net,
            center_um=_center_um(cell, context.layout.dbu),
            fanin=recover_fanin(d_net, elements, drivers),
            immediate_q_loads=immediate_loads,
            forward_cells=recover_forward_cells(q_net, elements, loads),
            d_driver_inputs=d_driver_inputs,
        )

    return information


def score_pair(first: FlipFlopInfo, second: FlipFlopInfo) -> PairEvidence:
    score = 0.0
    reasons: list[str] = []

    if first.clock.root_net != second.clock.root_net:
        return PairEvidence(
            first.cell.instance_id,
            second.cell.instance_id,
            0.0,
            ("different normalized clock roots",),
        )
    score += 0.18
    reasons.append(f"same clock root net_{first.clock.root_net}")

    if first.clock.gate_control_nets == second.clock.gate_control_nets:
        score += 0.04
        if first.clock.gate_control_nets:
            reasons.append("same clock-gating controls")
    elif first.clock.gate_control_nets or second.clock.gate_control_nets:
        score -= 0.12

    if first.clock.local_net == second.clock.local_net:
        score += 0.08
        reasons.append(f"same CTS leaf net_{first.clock.local_net}")

    if first.reset_signature == second.reset_signature:
        score += 0.10
        reasons.append("same reset/set signature")
    else:
        score -= 0.10

    if first.family == second.family:
        score += 0.05
        reasons.append(f"same FF family {first.family}")

    distance = math.dist(first.center_um, second.center_um)
    if distance <= 12.0:
        score += 0.18
        reasons.append(f"very close placement ({distance:.1f} um)")
    elif distance <= 25.0:
        score += 0.12
        reasons.append(f"close placement ({distance:.1f} um)")
    elif distance <= 50.0:
        score += 0.05
        reasons.append(f"nearby placement ({distance:.1f} um)")

    shared_immediate = first.immediate_q_loads & second.immediate_q_loads
    if len(shared_immediate) >= 2:
        score += 0.18
        reasons.append(f"{len(shared_immediate)} shared immediate decoders")
    elif shared_immediate:
        score += 0.12
        reasons.append("shared immediate decoder")

    fanout_similarity = _jaccard(first.forward_cells, second.forward_cells)
    if fanout_similarity >= 0.50:
        score += 0.14
        reasons.append(f"similar Q fan-out ({fanout_similarity:.2f})")
    elif fanout_similarity >= 0.20:
        score += 0.08
        reasons.append(f"related Q fan-out ({fanout_similarity:.2f})")
    elif first.forward_cells & second.forward_cells:
        score += 0.03

    dependency_similarity = _jaccard(
        first.fanin.source_ffs,
        second.fanin.source_ffs,
    )
    if dependency_similarity >= 0.60:
        score += 0.15
        reasons.append(f"similar D dependencies ({dependency_similarity:.2f})")
    elif dependency_similarity >= 0.25:
        score += 0.09
        reasons.append(f"related D dependencies ({dependency_similarity:.2f})")
    elif dependency_similarity > 0:
        score += 0.03

    first_id = first.cell.instance_id
    second_id = second.cell.instance_id
    forward_dependency = first_id in second.fanin.source_ffs
    reverse_dependency = second_id in first.fanin.source_ffs
    if forward_dependency and reverse_dependency:
        score += 0.14
        reasons.append("mutual next-state dependency")
    elif forward_dependency or reverse_dependency:
        score += 0.08
        reasons.append("direct next-state dependency")

    cone_similarity = _jaccard(first.fanin.cell_types, second.fanin.cell_types)
    if cone_similarity >= 0.75:
        score += 0.08
        reasons.append(f"similar D-cone cells ({cone_similarity:.2f})")
    elif cone_similarity >= 0.40:
        score += 0.04

    common_driver_inputs = first.d_driver_inputs & second.d_driver_inputs
    common_driver_inputs.discard(first.q_net)
    common_driver_inputs.discard(second.q_net)
    if common_driver_inputs:
        score += 0.05
        reasons.append("shared immediate next-state control")

    return PairEvidence(
        first_id,
        second_id,
        round(max(0.0, min(score, 1.0)), 3),
        tuple(reasons),
    )


def all_pair_evidence(
    information: dict[int, FlipFlopInfo],
    excluded: set[int],
) -> dict[tuple[int, int], PairEvidence]:
    ids = sorted(set(information) - excluded)
    evidence: dict[tuple[int, int], PairEvidence] = {}
    for index, first_id in enumerate(ids):
        for second_id in ids[index + 1 :]:
            item = score_pair(information[first_id], information[second_id])
            evidence[(first_id, second_id)] = item
    return evidence


def _pair_key(first: int, second: int) -> tuple[int, int]:
    return (first, second) if first < second else (second, first)


def cluster_candidates(
    pair_evidence: dict[tuple[int, int], PairEvidence],
    information: dict[int, FlipFlopInfo],
) -> list[set[int]]:
    """Greedy average-link clustering over high-confidence FF pairs."""

    members = {
        endpoint
        for pair in pair_evidence
        for endpoint in pair
    }
    clusters: dict[int, set[int]] = {member: {member} for member in members}
    owner = {member: member for member in members}

    candidates = sorted(
        (
            item
            for item in pair_evidence.values()
            if item.score >= PAIR_THRESHOLD
        ),
        key=lambda item: -item.score,
    )

    for item in candidates:
        first_owner = owner[item.first]
        second_owner = owner[item.second]
        if first_owner == second_owner:
            continue
        first_cluster = clusters[first_owner]
        second_cluster = clusters[second_owner]
        combined = first_cluster | second_cluster
        if len(combined) > MAX_HEURISTIC_GROUP_SIZE:
            continue

        xs = [information[member].center_um[0] for member in combined]
        ys = [information[member].center_um[1] for member in combined]
        if (
            max(xs) - min(xs) > MAX_HEURISTIC_SPAN_UM
            or max(ys) - min(ys) > MAX_HEURISTIC_SPAN_UM
        ):
            continue

        cross_scores = [
            pair_evidence[_pair_key(first, second)].score
            for first in first_cluster
            for second in second_cluster
        ]
        if sum(cross_scores) / len(cross_scores) < 0.56:
            continue

        first_cluster.update(second_cluster)
        for member in second_cluster:
            owner[member] = first_owner
        del clusters[second_owner]

    return sorted(
        (cluster for cluster in clusters.values() if len(cluster) >= 2),
        key=lambda group: (-len(group), min(group)),
    )


def _group_confidence(
    members: set[int],
    pair_evidence: dict[tuple[int, int], PairEvidence],
) -> float:
    scores = [
        pair_evidence[_pair_key(first, second)].score
        for index, first in enumerate(sorted(members))
        for second in sorted(members)[index + 1 :]
    ]
    if not scores:
        return 0.0
    high_scores = [score for score in scores if score >= PAIR_THRESHOLD]
    high_average = sum(high_scores) / len(high_scores) if high_scores else 0.0
    total_average = sum(scores) / len(scores)
    return round(0.70 * high_average + 0.30 * total_average, 3)


def describe_candidate_group(
    members: set[int],
    information: dict[int, FlipFlopInfo],
    pair_evidence: dict[tuple[int, int], PairEvidence],
) -> RegisterGroup:
    ordered = sorted(members)
    roots = {information[member].clock.root_net for member in members}
    leaves = {information[member].clock.local_net for member in members}
    resets = {information[member].reset_signature for member in members}
    xs = [information[member].center_um[0] for member in members]
    ys = [information[member].center_um[1] for member in members]
    dependency_edges = sum(
        source in members
        for target in members
        for source in information[target].fanin.source_ffs
        if source != target
    )
    shared_decoders = Counter(
        load
        for member in members
        for load in information[member].immediate_q_loads
    )
    common_decoders = sorted(
        load for load, count in shared_decoders.items() if count >= 2
    )

    if dependency_edges >= len(members):
        kind = "state/counter register candidate"
    elif common_decoders:
        kind = "decoded state/register vector"
    else:
        kind = "register-bank candidate"

    evidence = [
        "clock roots: " + ", ".join(f"net_{net}" for net in sorted(roots)),
        "CTS leaves: " + ", ".join(f"net_{net}" for net in sorted(leaves)),
        f"reset/set signatures: {len(resets)}",
        f"physical span: {max(xs) - min(xs):.1f} x {max(ys) - min(ys):.1f} um",
        f"internal next-state dependency edges: {dependency_edges}",
        "shared immediate decoders: "
        + (", ".join(f"u_{cell}" for cell in common_decoders) or "none"),
    ]
    return RegisterGroup(
        kind=kind,
        # Reserve 1.0 for exact structural recognizers such as shift chains.
        # Heuristic evidence can be very strong, but is never a proof of the
        # original RTL grouping after synthesis removed hierarchy and names.
        confidence=min(0.95, _group_confidence(members, pair_evidence)),
        members=ordered,
        evidence=evidence,
    )


def recover_register_groups(
    context: RecoveryContext,
) -> tuple[
    dict[int, FlipFlopInfo],
    list[RegisterGroup],
    dict[tuple[int, int], PairEvidence],
]:
    information = build_ff_information(context)
    groups: list[RegisterGroup] = []
    known_members: set[int] = set()

    for register in find_shift_registers(context.elements):
        bit_order = [stage.dff.instance_id for stage in register.stages]
        known_members.update(bit_order)
        groups.append(
            RegisterGroup(
                kind="verified shift register",
                confidence=1.0,
                members=sorted(bit_order),
                bit_order=bit_order,
                evidence=[
                    "exact Q[i] -> MUX.A1 -> D[i+1] chain",
                    f"shared selector net_{register.selector_net}",
                    f"shared reset net_{register.reset_net}",
                    "clock roots: "
                    + ", ".join(
                        f"net_{net}"
                        for net in sorted(
                            {
                                information[member].clock.root_net
                                for member in bit_order
                            }
                        )
                    ),
                ],
            )
        )

    pair_evidence = all_pair_evidence(information, known_members)
    candidates = cluster_candidates(pair_evidence, information)
    groups.extend(
        describe_candidate_group(candidate, information, pair_evidence)
        for candidate in candidates
    )
    groups.sort(key=lambda group: (-group.confidence, -len(group.members)))
    return information, groups, pair_evidence


def _confidence_label(confidence: float) -> str:
    if confidence >= 0.80:
        return "high"
    if confidence >= 0.68:
        return "likely"
    return "possible"


def make_report(
    context: RecoveryContext,
    information: dict[int, FlipFlopInfo],
    groups: list[RegisterGroup],
    pair_evidence: dict[tuple[int, int], PairEvidence],
) -> dict:
    top_inputs = {pin.net: pin.name for pin in find_input_pins(context)}
    roots: dict[int, list[int]] = defaultdict(list)
    leaves: dict[tuple[int, int], list[int]] = defaultdict(list)
    for instance_id, info in information.items():
        roots[info.clock.root_net].append(instance_id)
        leaves[(info.clock.root_net, info.clock.local_net)].append(instance_id)

    grouped = {member for group in groups for member in group.members}
    return {
        "gds_top": context.top.name,
        "flip_flop_count": len(information),
        "method": (
            "clock normalization + D-fanin/Q-fanout + reset + placement "
            "+ structural-similarity heuristic"
        ),
        "clock_roots": [
            {
                "net": net,
                "name": top_inputs.get(net),
                "flip_flops": sorted(members),
            }
            for net, members in sorted(roots.items())
        ],
        "clock_leaves": [
            {
                "root_net": root,
                "local_net": local,
                "flip_flops": sorted(members),
                "paths": {
                    str(member): list(information[member].clock.path_nets)
                    for member in sorted(members)
                },
            }
            for (root, local), members in sorted(leaves.items())
        ],
        "register_groups": [
            {
                "kind": group.kind,
                "confidence": group.confidence,
                "confidence_label": _confidence_label(group.confidence),
                "flip_flops": group.members,
                "bit_order": group.bit_order,
                "q_nets": [information[member].q_net for member in group.members],
                "d_nets": [information[member].d_net for member in group.members],
                "evidence": group.evidence,
            }
            for group in groups
        ],
        "high_confidence_pairs": [
            {
                "flip_flops": [item.first, item.second],
                "score": item.score,
                "reasons": list(item.reasons),
            }
            for item in sorted(pair_evidence.values(), key=lambda item: -item.score)
            if item.score >= PAIR_THRESHOLD
        ],
        "ungrouped_flip_flops": sorted(set(information) - grouped),
    }


def print_summary(report: dict) -> None:
    print(f"Recovered flip-flops: {report['flip_flop_count']}")
    print("Clock roots:")
    for root in report["clock_roots"]:
        name = f" ({root['name']})" if root["name"] else ""
        print(f"  net_{root['net']}{name}: {len(root['flip_flops'])} FFs")

    print("\nCandidate register groups:")
    for index, group in enumerate(report["register_groups"], start=1):
        members = ", ".join(f"u_{member}" for member in group["flip_flops"])
        print(
            f"  group_{index}: {group['kind']}; "
            f"confidence={group['confidence']:.3f} "
            f"({group['confidence_label']}); {members}"
        )
        if group["bit_order"]:
            order = " -> ".join(f"u_{member}" for member in group["bit_order"])
            print(f"    bit/shift order: {order}")
        for evidence in group["evidence"]:
            print(f"    - {evidence}")

    print(
        f"\nUngrouped FFs: {len(report['ungrouped_flip_flops'])}; "
        "these remain one-bit registers or need weaker/manual grouping"
    )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Recover clock trees and likely multi-bit register groups"
    )
    parser.add_argument("gds", nargs="?", type=Path, default=DEFAULT_GDS)
    parser.add_argument("--output", type=Path, default=DEFAULT_REPORT)
    args = parser.parse_args()

    context = recover_schematic(args.gds)
    information, groups, pair_evidence = recover_register_groups(context)
    report = make_report(context, information, groups, pair_evidence)

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(report, indent=2) + "\n")
    print_summary(report)
    print(f"\nJSON report: {args.output}")


if __name__ == "__main__":
    main()
