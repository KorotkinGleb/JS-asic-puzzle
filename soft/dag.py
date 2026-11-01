"""Canonical directed graph for extracted standard-cell connectivity.

Nets are graph vertices.  A combinational standard cell contributes an edge
from each of its input nets to each output net.  Sequential cells are explicit
cut points, so every backward combinational cone is a DAG even when the whole
state machine contains feedback.
"""

from __future__ import annotations

from collections import defaultdict, deque
from dataclasses import dataclass
import json
from pathlib import Path
from typing import Iterable, Iterator

from scripts.recover_schematic_elements import (
    PinReference,
    RecoveryContext,
    SchematicElement,
    build_driver_index,
    build_load_index,
)


SEQUENTIAL_KINDS = frozenset({"flip-flop", "latch"})
CONSTANT_KIND = "constant source"


@dataclass(frozen=True, order=True)
class DagEdge:
    """Pin-specific directed dependency through one cell."""

    input_net: int
    output_net: int
    instance_id: int
    input_pin: str
    output_pin: str


@dataclass(frozen=True)
class GraphValidation:
    multiple_driver_nets: tuple[int, ...]
    combinational_cycle_nets: tuple[int, ...]

    @property
    def valid(self) -> bool:
        return not self.multiple_driver_nets and not self.combinational_cycle_nets


@dataclass(frozen=True)
class TraceCone:
    """One or more backward traces, stopped at sequential and pure-input nets."""

    root_nets: tuple[int, ...]
    combinational_ids: tuple[int, ...]
    sequential_boundary_ids: tuple[int, ...]
    boundary_input_nets: tuple[int, ...]
    constant_nets: tuple[tuple[int, int], ...]
    edges: tuple[DagEdge, ...]
    net_levels: dict[int, int]
    cell_levels: dict[int, int]
    sequential_levels: dict[int, int]

    @property
    def constants(self) -> dict[int, int]:
        return dict(self.constant_nets)

    @property
    def all_nets(self) -> set[int]:
        result = set(self.root_nets) | set(self.boundary_input_nets)
        for edge in self.edges:
            result.add(edge.input_net)
            result.add(edge.output_net)
        result.update(net for net, _ in self.constant_nets)
        return result

    def merge(self, *others: "TraceCone") -> "TraceCone":
        """Return a deterministic union of compatible trace cones."""

        roots = set(self.root_nets)
        combinational = set(self.combinational_ids)
        sequential = set(self.sequential_boundary_ids)
        boundaries = set(self.boundary_input_nets)
        constants = dict(self.constant_nets)
        edges = set(self.edges)
        net_levels = dict(self.net_levels)
        cell_levels = dict(self.cell_levels)
        sequential_levels = dict(self.sequential_levels)
        for other in others:
            roots.update(other.root_nets)
            combinational.update(other.combinational_ids)
            sequential.update(other.sequential_boundary_ids)
            boundaries.update(other.boundary_input_nets)
            constants.update(other.constant_nets)
            edges.update(other.edges)
            for destination, source in (
                (net_levels, other.net_levels),
                (cell_levels, other.cell_levels),
                (sequential_levels, other.sequential_levels),
            ):
                for key, level in source.items():
                    destination[key] = min(destination.get(key, level), level)
        return TraceCone(
            root_nets=tuple(sorted(roots)),
            combinational_ids=tuple(sorted(combinational)),
            sequential_boundary_ids=tuple(sorted(sequential)),
            boundary_input_nets=tuple(sorted(boundaries)),
            constant_nets=tuple(sorted(constants.items())),
            edges=tuple(sorted(edges)),
            net_levels=net_levels,
            cell_levels=cell_levels,
            sequential_levels=sequential_levels,
        )


class CircuitDAG:
    """Queryable net/cell connectivity graph built from ``context.elements``."""

    def __init__(self, context: RecoveryContext):
        self.context = context
        self.elements = tuple(context.elements)
        self.by_id = {element.instance_id: element for element in self.elements}
        self.drivers = build_driver_index(context.elements)
        self.loads = build_load_index(context.elements)
        self._outgoing: dict[int, list[DagEdge]] = defaultdict(list)
        self._incoming: dict[int, list[DagEdge]] = defaultdict(list)
        for element in self.elements:
            if element.symbol_kind in SEQUENTIAL_KINDS:
                continue
            for input_pin, input_net in element.input_pins.items():
                for output_pin, output_net in element.output_pins.items():
                    edge = DagEdge(
                        input_net=input_net,
                        output_net=output_net,
                        instance_id=element.instance_id,
                        input_pin=input_pin,
                        output_pin=output_pin,
                    )
                    self._outgoing[input_net].append(edge)
                    self._incoming[output_net].append(edge)
        for edge_list in (*self._outgoing.values(), *self._incoming.values()):
            edge_list.sort()

    def element(self, instance_id: int) -> SchematicElement:
        return self.by_id[instance_id]

    def driver_cells(self, net: int) -> list[SchematicElement]:
        return [self.by_id[item.instance_id] for item in self.drivers.get(net, [])]

    def load_cells(self, net: int) -> list[SchematicElement]:
        return [self.by_id[item.instance_id] for item in self.loads.get(net, [])]

    def incoming_edges(self, net: int) -> tuple[DagEdge, ...]:
        return tuple(self._incoming.get(net, ()))

    def outgoing_edges(self, net: int) -> tuple[DagEdge, ...]:
        return tuple(self._outgoing.get(net, ()))

    def fanin_nets(self, net: int) -> tuple[int, ...]:
        return tuple(sorted({edge.input_net for edge in self.incoming_edges(net)}))

    def fanout_nets(self, net: int) -> tuple[int, ...]:
        return tuple(sorted({edge.output_net for edge in self.outgoing_edges(net)}))

    def backtrace(self, roots: int | Iterable[int]) -> TraceCone:
        """Trace drivers backward and stop every branch at sequential state."""

        root_nets = (roots,) if isinstance(roots, int) else tuple(sorted(set(roots)))
        queue = deque((net, 0) for net in root_nets)
        best_level: dict[int, int] = {}
        combinational_ids: set[int] = set()
        sequential_ids: set[int] = set()
        boundary_nets: set[int] = set()
        constants: dict[int, int] = {}
        edges: set[DagEdge] = set()
        cell_levels: dict[int, int] = {}
        sequential_levels: dict[int, int] = {}

        while queue:
            net, level = queue.popleft()
            old_level = best_level.get(net)
            if old_level is not None and old_level <= level:
                continue
            best_level[net] = level
            endpoints = self.drivers.get(net, ())
            if not endpoints:
                boundary_nets.add(net)
                continue

            found_real_driver = False
            for endpoint in endpoints:
                cell = self.by_id[endpoint.instance_id]
                found_real_driver = True
                if cell.symbol_kind in SEQUENTIAL_KINDS:
                    sequential_ids.add(cell.instance_id)
                    sequential_levels[cell.instance_id] = min(
                        sequential_levels.get(cell.instance_id, level), level
                    )
                    continue
                if cell.symbol_kind == CONSTANT_KIND:
                    function = cell.output_functions.get(endpoint.pin, "0").strip()
                    constants[net] = 1 if function in {"1", "1'b1"} else 0
                    continue

                combinational_ids.add(cell.instance_id)
                cell_levels[cell.instance_id] = min(
                    cell_levels.get(cell.instance_id, level), level
                )
                for input_pin, input_net in cell.input_pins.items():
                    edges.add(
                        DagEdge(
                            input_net=input_net,
                            output_net=net,
                            instance_id=cell.instance_id,
                            input_pin=input_pin,
                            output_pin=endpoint.pin,
                        )
                    )
                    queue.append((input_net, level + 1))
            if not found_real_driver:
                boundary_nets.add(net)

        return TraceCone(
            root_nets=root_nets,
            combinational_ids=tuple(sorted(combinational_ids)),
            sequential_boundary_ids=tuple(sorted(sequential_ids)),
            boundary_input_nets=tuple(sorted(boundary_nets)),
            constant_nets=tuple(sorted(constants.items())),
            edges=tuple(sorted(edges)),
            net_levels=best_level,
            cell_levels=cell_levels,
            sequential_levels=sequential_levels,
        )

    def topological_cells(self, cone: TraceCone) -> list[SchematicElement]:
        """Return cone cells from boundary inputs toward the requested roots."""

        selected = set(cone.combinational_ids)
        dependency_count: dict[int, int] = {instance_id: 0 for instance_id in selected}
        consumers: dict[int, set[int]] = defaultdict(set)
        output_driver: dict[int, int] = {}
        for instance_id in selected:
            cell = self.by_id[instance_id]
            for output_net in cell.output_pins.values():
                output_driver[output_net] = instance_id
        for instance_id in selected:
            cell = self.by_id[instance_id]
            dependencies = {
                output_driver[input_net]
                for input_net in cell.input_pins.values()
                if input_net in output_driver
                and output_driver[input_net] != instance_id
            }
            dependency_count[instance_id] = len(dependencies)
            for dependency in dependencies:
                consumers[dependency].add(instance_id)

        ready = deque(sorted(key for key, value in dependency_count.items() if value == 0))
        ordered: list[int] = []
        while ready:
            instance_id = ready.popleft()
            ordered.append(instance_id)
            for consumer in sorted(consumers.get(instance_id, ())):
                dependency_count[consumer] -= 1
                if dependency_count[consumer] == 0:
                    ready.append(consumer)
        if len(ordered) != len(selected):
            cyclic = sorted(selected - set(ordered))
            raise ValueError(
                "Combinational cycle or unresolved multiple driver among cells: "
                + ", ".join(f"u_{item}" for item in cyclic[:20])
            )
        return [self.by_id[instance_id] for instance_id in ordered]

    def validate(self) -> GraphValidation:
        multiple = tuple(
            sorted(net for net, endpoints in self.drivers.items() if len(endpoints) > 1)
        )
        all_comb_ids = tuple(
            element.instance_id
            for element in self.elements
            if element.symbol_kind not in SEQUENTIAL_KINDS
            and element.symbol_kind != CONSTANT_KIND
        )
        synthetic = TraceCone(
            root_nets=(),
            combinational_ids=all_comb_ids,
            sequential_boundary_ids=(),
            boundary_input_nets=(),
            constant_nets=(),
            edges=(),
            net_levels={},
            cell_levels={},
            sequential_levels={},
        )
        cyclic_nets: tuple[int, ...] = ()
        try:
            self.topological_cells(synthetic)
        except ValueError:
            # Report nets participating in combinational strongly connected
            # residue without making validation itself fatal.
            cyclic_nets = tuple(
                sorted(
                    net
                    for net, incoming in self._incoming.items()
                    if incoming and self._outgoing.get(net)
                )
            )
        return GraphValidation(multiple, cyclic_nets)

    def to_dict(self) -> dict:
        """Return a JSON-ready connectivity graph independent of KLayout."""

        edges = sorted(
            {edge for edge_list in self._outgoing.values() for edge in edge_list}
        )
        validation = self.validate()
        return {
            "schema_version": 1,
            "gds_top": self.context.top.name,
            "net_count": len(set(self.drivers) | set(self.loads)),
            "element_count": len(self.elements),
            "combinational_edges": [
                {
                    "input_net": edge.input_net,
                    "output_net": edge.output_net,
                    "instance_id": edge.instance_id,
                    "input_pin": edge.input_pin,
                    "output_pin": edge.output_pin,
                }
                for edge in edges
            ],
            "sequential_cells": [
                {
                    "instance_id": element.instance_id,
                    "module": element.module,
                    "input_pins": element.input_pins,
                    "output_pins": element.output_pins,
                }
                for element in self.elements
                if element.symbol_kind in SEQUENTIAL_KINDS
            ],
            "validation": {
                "multiple_driver_nets": list(validation.multiple_driver_nets),
                "combinational_cycle_nets": list(validation.combinational_cycle_nets),
            },
        }


def trace_to_dict(trace: TraceCone) -> dict:
    return {
        "schema_version": 1,
        "root_nets": list(trace.root_nets),
        "combinational_ids": list(trace.combinational_ids),
        "sequential_boundary_ids": list(trace.sequential_boundary_ids),
        "boundary_input_nets": list(trace.boundary_input_nets),
        "constant_nets": [
            {"net": net, "value": value} for net, value in trace.constant_nets
        ],
        "edges": [
            {
                "input_net": edge.input_net,
                "output_net": edge.output_net,
                "instance_id": edge.instance_id,
                "input_pin": edge.input_pin,
                "output_pin": edge.output_pin,
            }
            for edge in trace.edges
        ],
        "net_levels": {str(key): value for key, value in trace.net_levels.items()},
        "cell_levels": {str(key): value for key, value in trace.cell_levels.items()},
        "sequential_levels": {
            str(key): value for key, value in trace.sequential_levels.items()
        },
    }


def write_dag_json(dag: CircuitDAG, output_path: str | Path) -> Path:
    path = Path(output_path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(dag.to_dict(), indent=2) + "\n")
    return path


def write_trace_json(trace: TraceCone, output_path: str | Path) -> Path:
    path = Path(output_path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(trace_to_dict(trace), indent=2) + "\n")
    return path
