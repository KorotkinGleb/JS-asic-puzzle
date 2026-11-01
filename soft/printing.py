"""Human-readable CLI presentation for recovery objects.

Core extraction/generation modules never print.  Notebook and CLI users can
choose these compact views without coupling analysis to presentation.
"""

from __future__ import annotations

from collections import Counter
from pathlib import Path
from typing import Iterable

from .context import find_named_nets
from .dag import CircuitDAG, TraceCone
from .registers import RegisterCatalog
from .verilog import GeneratedVerilog


def _net_name(
    dag: CircuitDAG,
    catalog: RegisterCatalog | None,
    net: int,
    labels: dict[int, str] | None = None,
) -> str:
    label = (labels or {}).get(net)
    if labels is None:
        label = next(
            (item.name for item in find_named_nets(dag.context) if item.net == net),
            None,
        )
    if label:
        return f"{label} (net_{net})"
    if catalog and net in catalog.by_q_net:
        register, bit = catalog.by_q_net[net]
        state = register.name if register.width == 1 else f"{register.name}[{bit.bit}]"
        return f"{state} (net_{net})"
    return f"net_{net}"


def print_context_summary(dag: CircuitDAG) -> None:
    counts = Counter(element.symbol_kind for element in dag.elements)
    print(f"GDS top: {dag.context.top.name}")
    print(f"Logical elements: {len(dag.elements)}")
    for kind, count in sorted(counts.items()):
        print(f"  {kind}: {count}")
    print("Named top nets:")
    for item in find_named_nets(dag.context):
        print(f"  {item.direction:6s} {item.name:10s} net_{item.net} ({item.conductor})")


def print_dag_summary(dag: CircuitDAG) -> None:
    validation = dag.validate()
    edge_count = sum(len(edges) for edges in dag._outgoing.values())
    print(
        f"DAG: {len(dag.drivers)} driven nets, {len(dag.loads)} loaded nets, "
        f"{edge_count} pin edges"
    )
    print(f"Multiple-driver nets: {len(validation.multiple_driver_nets)}")
    print(f"Combinational cycle candidates: {len(validation.combinational_cycle_nets)}")


def print_register_catalog(catalog: RegisterCatalog, *, show_bits: bool = False) -> None:
    print(
        f"Registers: {len(catalog.registers)}; physical flip-flops: "
        f"{catalog.flip_flop_count}"
    )
    for register in catalog.registers:
        print(
            f"  {register.name:16s} width={register.width:2d} "
            f"confidence={register.confidence_label:8s} {register.kind}"
        )
        if show_bits:
            for bit in register.bits:
                print(
                    f"    [{bit.bit:2d}] u_{bit.instance_id}: "
                    f"Q=net_{bit.q_net}, D=net_{bit.d_net}, "
                    f"clock=net_{bit.clock_root_net}"
                )


def print_trace_levels(
    dag: CircuitDAG,
    trace: TraceCone,
    catalog: RegisterCatalog | None = None,
    *,
    max_levels: int | None = None,
    max_items_per_level: int = 40,
) -> None:
    """Print canonical depth levels; shared cells are printed only once."""

    maximum = max(
        [0] + list(trace.cell_levels.values()) + list(trace.sequential_levels.values())
    )
    if max_levels is not None:
        maximum = min(maximum, max_levels)
    for level in range(maximum + 1):
        cells = sorted(
            instance_id
            for instance_id, item_level in trace.cell_levels.items()
            if item_level == level
        )
        sequential = sorted(
            instance_id
            for instance_id, item_level in trace.sequential_levels.items()
            if item_level == level
        )
        if not cells and not sequential:
            continue
        print(f"Level {level}")
        shown = 0
        for instance_id in cells:
            if shown >= max_items_per_level:
                break
            element = dag.element(instance_id)
            print(
                f"  u_{instance_id} {element.module}: "
                f"{element.input_pins} -> {element.output_pins} "
                f"{element.output_functions}"
            )
            shown += 1
        for instance_id in sequential:
            if shown >= max_items_per_level:
                break
            element = dag.element(instance_id)
            if catalog and instance_id in catalog.by_instance:
                register, bit = catalog.by_instance[instance_id]
                name = (
                    register.name
                    if register.width == 1
                    else f"{register.name}[{bit.bit}]"
                )
            else:
                name = f"u_{instance_id}"
            q_nets = ", ".join(f"net_{net}" for net in element.output_pins.values())
            print(f"  state boundary {name}: {element.module}; Q={q_nets}")
            shown += 1
        omitted = len(cells) + len(sequential) - shown
        if omitted:
            print(f"  ... {omitted} more item(s)")


def print_trace_tree(
    dag: CircuitDAG,
    trace: TraceCone,
    catalog: RegisterCatalog | None = None,
    *,
    max_depth: int = 30,
) -> None:
    """Print a compact backward tree while marking shared DAG subgraphs."""

    print(format_trace_tree(dag, trace, catalog, max_depth=max_depth))


def format_trace_tree(
    dag: CircuitDAG,
    trace: TraceCone,
    catalog: RegisterCatalog | None = None,
    *,
    max_depth: int = 30,
) -> str:
    """Return a backward-tree view suitable for a notebook or text file."""

    allowed = set(trace.combinational_ids)
    seen: set[int] = set()
    labels = {item.net: item.name for item in find_named_nets(dag.context)}
    lines: list[str] = []

    def visit(net: int, prefix: str, depth: int, path: set[int]) -> None:
        lines.append(prefix + _net_name(dag, catalog, net, labels))
        if depth >= max_depth:
            lines.append(prefix + "  ... depth limit")
            return
        if net in path:
            lines.append(prefix + "  <cycle cut>")
            return
        if net in seen:
            lines.append(prefix + "  <shared DAG node>")
            return
        seen.add(net)
        endpoints = dag.drivers.get(net, ())
        if not endpoints:
            lines.append(prefix + "  <pure input>")
            return
        next_path = set(path)
        next_path.add(net)
        for endpoint in endpoints:
            cell = dag.element(endpoint.instance_id)
            if cell.symbol_kind in {"flip-flop", "latch"}:
                if catalog and cell.instance_id in catalog.by_instance:
                    register, bit = catalog.by_instance[cell.instance_id]
                    state = (
                        register.name
                        if register.width == 1
                        else f"{register.name}[{bit.bit}]"
                    )
                    lines.append(
                        prefix + f"  <- {state} / u_{cell.instance_id}.{endpoint.pin}"
                    )
                else:
                    lines.append(
                        prefix + f"  <- sequential u_{cell.instance_id}.{endpoint.pin}"
                    )
                continue
            if cell.symbol_kind == "constant source":
                value = cell.output_functions.get(endpoint.pin, "?")
                lines.append(
                    prefix
                    + f"  <- constant {value} / u_{cell.instance_id}.{endpoint.pin}"
                )
                continue
            if cell.instance_id not in allowed:
                continue
            lines.append(
                prefix + f"  <- u_{cell.instance_id}.{endpoint.pin} {cell.module}"
            )
            for pin, input_net in sorted(cell.input_pins.items()):
                lines.append(prefix + f"     {pin}:")
                visit(input_net, prefix + "       ", depth + 1, next_path)

    for root in trace.root_nets:
        visit(root, "", 0, set())
    return "\n".join(lines) + "\n"


def write_trace_tree(
    dag: CircuitDAG,
    trace: TraceCone,
    output_path: str | Path,
    catalog: RegisterCatalog | None = None,
    *,
    max_depth: int = 30,
) -> Path:
    """Write the human-readable backward tree without printing it."""

    path = Path(output_path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(format_trace_tree(dag, trace, catalog, max_depth=max_depth))
    return path


def print_net_trace(
    dag: CircuitDAG,
    start_net: int,
    catalog: RegisterCatalog | None = None,
    *,
    view: str = "tree",
    max_depth: int = 30,
) -> TraceCone:
    """Convenient notebook API: trace one net, print it, and return the cone."""

    trace = dag.backtrace(start_net)
    print_trace_summary(trace)
    if view == "tree":
        print_trace_tree(dag, trace, catalog, max_depth=max_depth)
    elif view == "levels":
        print_trace_levels(dag, trace, catalog, max_levels=max_depth)
    elif view != "summary":
        raise ValueError("view must be 'tree', 'levels', or 'summary'")
    return trace


def print_trace_summary(trace: TraceCone) -> None:
    print("Trace roots: " + ", ".join(f"net_{net}" for net in trace.root_nets))
    print(f"Combinational cells: {len(trace.combinational_ids)}")
    print(f"Sequential boundaries: {len(trace.sequential_boundary_ids)}")
    print(f"Pure input boundaries: {len(trace.boundary_input_nets)}")
    print(f"Canonical pin edges: {len(trace.edges)}")


def print_verilog_summary(generated: GeneratedVerilog, path: Path | None = None) -> None:
    target = f" -> {path}" if path else ""
    print(f"Verilog {generated.module_name}{target}")
    print(f"  inputs: {', '.join(generated.input_ports) or 'none'}")
    print(f"  outputs: {', '.join(generated.output_ports) or 'none'}")
    print(f"  combinational cells: {generated.combinational_cell_count}")
    if generated.registers:
        print(f"  registers: {', '.join(generated.registers)}")


def print_written_files(paths: Iterable[Path]) -> None:
    print("Written files:")
    for path in paths:
        print(f"  {path}")
