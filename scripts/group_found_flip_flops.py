"""Group flip-flops found by a backward net trace into recovered registers.

Register membership is taken from ``recovered_register_groups.json``.  The
report was inferred independently using clock-root, reset signature, physical
proximity, D/Q dependencies and structural similarity.  This script does not
assume that equal BFS depth means equal register membership: synthesis can give
different bits of the same register different combinational path depths.
"""

from __future__ import annotations

import argparse
from collections import defaultdict, deque
from dataclasses import dataclass
import json
from pathlib import Path

try:
    from .recover_schematic_elements import SchematicElement, recover_schematic
except ImportError:
    from recover_schematic_elements import SchematicElement, recover_schematic


DEFAULT_GDS = Path("puzzle.gds")
DEFAULT_GROUP_REPORT = Path("scripts/recovered_register_groups.json")
SEQUENTIAL_KINDS = {"flip-flop", "latch"}


@dataclass(frozen=True)
class FoundRegisterBit:
    bit: int
    instance_id: int
    bfs_level: int
    q_net: int


@dataclass(frozen=True)
class FoundRegisterGroup:
    group_index: int
    kind: str
    confidence: float
    width: int
    found_bits: tuple[FoundRegisterBit, ...]
    missing_instance_ids: tuple[int, ...]

    @property
    def complete(self) -> bool:
        return not self.missing_instance_ids


@dataclass(frozen=True)
class UngroupedFlipFlop:
    instance_id: int
    bfs_level: int
    q_net: int


@dataclass
class GroupedBacktrace:
    flip_flops_by_level: dict[int, list[SchematicElement]]
    register_groups: list[FoundRegisterGroup]
    ungrouped_flip_flops: list[UngroupedFlipFlop]


def backtrace_flip_flops_by_level(
    elements: list[SchematicElement],
    start_net: int,
) -> dict[int, list[SchematicElement]]:
    """Walk backward through combinational cells and stop at every FF/latch."""

    drivers_by_net: dict[int, list[SchematicElement]] = defaultdict(list)
    for element in elements:
        for output_net in element.output_pins.values():
            drivers_by_net[output_net].append(element)

    queue = deque([(start_net, 0)])
    visited_nets: set[int] = set()
    visited_combinational_cells: set[int] = set()
    ff_level_by_id: dict[int, int] = {}
    by_id = {element.instance_id: element for element in elements}

    while queue:
        net, level = queue.popleft()
        if net in visited_nets:
            continue
        visited_nets.add(net)

        for driver in drivers_by_net.get(net, []):
            if driver.symbol_kind in SEQUENTIAL_KINDS:
                previous_level = ff_level_by_id.get(driver.instance_id)
                if previous_level is None or level < previous_level:
                    ff_level_by_id[driver.instance_id] = level
                # Sequential boundary: never continue through D/CLK/reset.
                continue

            if driver.symbol_kind == "constant source":
                continue
            if driver.instance_id in visited_combinational_cells:
                continue

            visited_combinational_cells.add(driver.instance_id)
            for input_net in driver.input_pins.values():
                queue.append((input_net, level + 1))

    result: dict[int, list[SchematicElement]] = defaultdict(list)
    for instance_id, level in ff_level_by_id.items():
        result[level].append(by_id[instance_id])

    return {
        level: sorted(cells, key=lambda cell: cell.instance_id)
        for level, cells in sorted(result.items())
    }


def load_register_groups(report_path: Path) -> list[dict]:
    with report_path.open() as report_file:
        report = json.load(report_file)
    return report["register_groups"]


def group_found_flip_flops(
    flip_flops_by_level: dict[int, list[SchematicElement]],
    register_group_report: list[dict],
) -> tuple[list[FoundRegisterGroup], list[UngroupedFlipFlop]]:
    """Assign found FFs to known register groups, independent of BFS level."""

    found_by_id = {
        cell.instance_id: (level, cell)
        for level, cells in flip_flops_by_level.items()
        for cell in cells
    }

    membership: dict[int, tuple[int, dict, int]] = {}
    for group_index, group in enumerate(register_group_report, start=1):
        # Shift-register order is proven.  Candidate groups otherwise use the
        # stable instance ordering used by the generated vector modules.
        bit_order = group.get("bit_order") or group["flip_flops"]
        for bit, instance_id in enumerate(bit_order):
            if instance_id in membership:
                old_group = membership[instance_id][0]
                raise ValueError(
                    f"u_{instance_id} belongs to groups {old_group} and "
                    f"{group_index}"
                )
            membership[instance_id] = (group_index, group, bit)

    matched_by_group: dict[int, list[FoundRegisterBit]] = defaultdict(list)
    ungrouped: list[UngroupedFlipFlop] = []

    for instance_id, (level, cell) in sorted(found_by_id.items()):
        q_net = cell.output_pins.get("Q")
        if q_net is None:
            continue

        match = membership.get(instance_id)
        if match is None:
            ungrouped.append(UngroupedFlipFlop(instance_id, level, q_net))
            continue

        group_index, _group, bit = match
        matched_by_group[group_index].append(
            FoundRegisterBit(bit, instance_id, level, q_net)
        )

    grouped: list[FoundRegisterGroup] = []
    for group_index in sorted(matched_by_group):
        group = register_group_report[group_index - 1]
        bit_order = group.get("bit_order") or group["flip_flops"]
        found_ids = {
            item.instance_id for item in matched_by_group[group_index]
        }
        grouped.append(
            FoundRegisterGroup(
                group_index=group_index,
                kind=group["kind"],
                confidence=group["confidence"],
                width=len(bit_order),
                found_bits=tuple(
                    sorted(
                        matched_by_group[group_index],
                        key=lambda item: item.bit,
                    )
                ),
                missing_instance_ids=tuple(
                    instance_id
                    for instance_id in bit_order
                    if instance_id not in found_ids
                ),
            )
        )

    return grouped, sorted(ungrouped, key=lambda item: item.instance_id)


def find_same_registers_in_trace(
    trace,
    report_path: Path = DEFAULT_GROUP_REPORT,
) -> tuple[list[FoundRegisterGroup], list[UngroupedFlipFlop]]:
    """Group the FF boundaries contained in a ``BacktraceResult``.

    The expected object is the result returned by ``backtrace_to_flip_flops``
    and therefore has a ``flip_flop_levels`` attribute.  The alternative
    ``flip_flops_by_level`` spelling is accepted for results produced directly
    by this module.
    """

    flip_flop_levels = getattr(trace, "flip_flop_levels", None)
    if flip_flop_levels is None:
        flip_flop_levels = getattr(trace, "flip_flops_by_level", None)
    if flip_flop_levels is None:
        raise TypeError(
            "trace must have flip_flop_levels or flip_flops_by_level"
        )

    register_group_report = load_register_groups(report_path)
    return group_found_flip_flops(
        flip_flop_levels,
        register_group_report,
    )


def analyze_found_flip_flops(
    elements: list[SchematicElement],
    start_net: int,
    register_group_report: list[dict],
) -> GroupedBacktrace:
    flip_flops_by_level = backtrace_flip_flops_by_level(elements, start_net)
    groups, ungrouped = group_found_flip_flops(
        flip_flops_by_level,
        register_group_report,
    )
    return GroupedBacktrace(flip_flops_by_level, groups, ungrouped)


def print_grouped_backtrace(result: GroupedBacktrace, start_net: int) -> None:
    found_count = sum(len(cells) for cells in result.flip_flops_by_level.values())
    print(f"Backtrace from net_{start_net}: {found_count} FF boundaries")

    print("\nFFs by combinational BFS level:")
    for level, cells in result.flip_flops_by_level.items():
        names = ", ".join(f"u_{cell.instance_id}" for cell in cells)
        print(f"  level {level}: {names}")

    print("\nRecovered register membership:")
    for group in result.register_groups:
        completeness = "complete" if group.complete else "partial"
        print(
            f"  register_group_{group.group_index:02d}: "
            f"{len(group.found_bits)}/{group.width} bits, {completeness}; "
            f"{group.kind}; confidence={group.confidence:.3f}"
        )
        for bit in group.found_bits:
            print(
                f"    bit {bit.bit}: u_{bit.instance_id}.Q / "
                f"net_{bit.q_net}; BFS level {bit.bfs_level}"
            )
        if group.missing_instance_ids:
            print(
                "    group bits not reached: "
                + ", ".join(
                    f"u_{instance_id}"
                    for instance_id in group.missing_instance_ids
                )
            )

    if result.ungrouped_flip_flops:
        print("\nFound FFs not assigned to a recovered register group:")
        for item in result.ungrouped_flip_flops:
            print(
                f"  u_{item.instance_id}.Q / net_{item.q_net}; "
                f"BFS level {item.bfs_level}"
            )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Backtrace a net and group reached FFs into registers"
    )
    parser.add_argument("start_net", type=int, help="net ID to trace backward")
    parser.add_argument("--gds", type=Path, default=DEFAULT_GDS)
    parser.add_argument(
        "--groups",
        type=Path,
        default=DEFAULT_GROUP_REPORT,
    )
    args = parser.parse_args()

    context = recover_schematic(args.gds)
    groups = load_register_groups(args.groups)
    result = analyze_found_flip_flops(context.elements, args.start_net, groups)
    print_grouped_backtrace(result, args.start_net)


if __name__ == "__main__":
    main()
