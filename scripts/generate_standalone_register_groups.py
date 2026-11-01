"""Generate fully inlined RTL for every recovered register group.

The generated Verilog has no includes, PDK cell instances, or helper-module
instantiations.  Each module contains:

* Boolean ``assign`` statements translated from recovered Liberty functions;
* a packed next-state D vector;
* the recovered flip-flops as clocked ``always`` blocks;
* the actual per-bit asynchronous reset/set behavior.

Clock-tree buffers are normalized back to their top-level clock source.  This
preserves functional RTL behavior while intentionally omitting physical clock
insertion delay.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import json
from pathlib import Path
import re

try:
    from .group_flip_flop_ports import (
        GroupDefinition,
        build_identifier_map,
        load_groups,
    )
    from .recover_register_groups import trace_clock
    from .recover_schematic_elements import (
        SchematicElement,
        build_driver_index,
        find_input_pins,
        recover_schematic,
    )
    from .recover_shift_output_trees import (
        boundary_input_names,
        flip_flop_input_trace_root,
        sanitize_identifier,
        trace_combinational_block,
    )
except ImportError:
    from group_flip_flop_ports import (
        GroupDefinition,
        build_identifier_map,
        load_groups,
    )
    from recover_register_groups import trace_clock
    from recover_schematic_elements import (
        SchematicElement,
        build_driver_index,
        find_input_pins,
        recover_schematic,
    )
    from recover_shift_output_trees import (
        boundary_input_names,
        flip_flop_input_trace_root,
        sanitize_identifier,
        trace_combinational_block,
    )


SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent
DEFAULT_GDS = PROJECT_ROOT / "puzzle.gds"
DEFAULT_GROUP_REPORT = SCRIPT_DIR / "recovered_register_groups.json"
DEFAULT_OUTPUT_DIR = SCRIPT_DIR / "register_groups" / "standalone"
IDENTIFIER_RE = re.compile(r"\b[A-Za-z_$][A-Za-z0-9_$]*\b")


@dataclass(frozen=True)
class Port:
    direction: str
    kind: str
    width: int
    name: str
    comment: str = ""

    def declaration(self, comma: bool) -> str:
        width_text = f"[{self.width - 1}:0] " if self.width > 1 else ""
        comma_text = "," if comma else ""
        comment_text = f"  // {self.comment}" if self.comment else ""
        return (
            f"    {self.direction} {self.kind} {width_text}{self.name}"
            f"{comma_text}{comment_text}"
        )


@dataclass(frozen=True)
class AsyncControl:
    pin: str
    signal: str
    edge: str
    condition: str
    value: str


@dataclass(frozen=True)
class CommonRegister:
    """One register vector owned by a common-style recovered RTL module."""

    name: str
    report_index: int | None
    kind: str
    bit_order: tuple[int, ...]

    @property
    def width(self) -> int:
        return len(self.bit_order)

    def bit_for_instance(self, instance_id: int) -> int:
        return self.bit_order.index(instance_id)


def group_stem(group: GroupDefinition) -> str:
    return group.name.removesuffix("_q")


def module_name(group: GroupDefinition) -> str:
    return f"recovered_{group_stem(group)}_standalone"


def _mapped_boundary(
    scalar_name: str,
    identifier_map,
) -> tuple[str, str, GroupDefinition | None]:
    """Return port name, bit expression, and optional register group."""

    mapping = identifier_map.get(scalar_name)
    if mapping is None:
        return scalar_name, scalar_name, None
    port_name = mapping.group.name
    return port_name, f"{port_name}[{mapping.bit}]", mapping.group


def _replace_function_pins(
    function: str,
    cell: SchematicElement,
    signal,
) -> str:
    """Translate one Liberty expression from pin names to recovered nets."""

    pin_signals = {
        pin: signal(net) for pin, net in cell.input_pins.items()
    }
    unknown = {
        token
        for token in IDENTIFIER_RE.findall(function)
        if token not in pin_signals
    }
    if unknown:
        raise ValueError(
            f"u_{cell.instance_id} {cell.module}: unresolved function tokens "
            + ", ".join(sorted(unknown))
        )
    return IDENTIFIER_RE.sub(lambda match: pin_signals[match.group(0)], function)


def _async_control(
    pin: str,
    signal: str,
) -> AsyncControl:
    normalized = pin.upper()
    if normalized in {"RESET_B", "RESET_N", "RESETB", "RN"}:
        return AsyncControl(pin, signal, "negedge", f"!{signal}", "1'b0")
    if normalized in {"RESET", "R"}:
        return AsyncControl(pin, signal, "posedge", signal, "1'b0")
    if normalized in {"SET_B", "SET_N", "SETB", "SN"}:
        return AsyncControl(pin, signal, "negedge", f"!{signal}", "1'b1")
    if normalized in {"SET", "S"}:
        return AsyncControl(pin, signal, "posedge", signal, "1'b1")
    raise ValueError(f"Unsupported sequential control pin {pin}")


def _resolve_group_report(group_report_path: Path | None) -> Path:
    """Resolve notebook-, script-, and repository-relative report paths."""

    requested_report = Path(group_report_path or DEFAULT_GROUP_REPORT)
    report_candidates = [
        requested_report,
        PROJECT_ROOT / requested_report,
        SCRIPT_DIR / requested_report,
        SCRIPT_DIR / requested_report.name,
    ]
    resolved_report = next(
        (candidate for candidate in report_candidates if candidate.is_file()),
        None,
    )
    if resolved_report is None:
        attempted = "\n  ".join(str(path) for path in report_candidates)
        raise FileNotFoundError(
            "Cannot find the recovered register-group report. Tried:\n  "
            + attempted
        )
    return resolved_report


def _common_group(group: GroupDefinition) -> CommonRegister:
    name = (
        "shift_register"
        if group.kind == "verified shift register"
        else f"register_{group.report_index:02d}"
    )
    return CommonRegister(
        name=name,
        report_index=group.report_index,
        kind=group.kind,
        bit_order=group.bit_order,
    )


def _common_register_closure(
    target_group: GroupDefinition,
    groups: list[GroupDefinition],
    context,
) -> tuple[list[CommonRegister], object]:
    """Include every complete source register required by ``target_group``."""

    by_id = {element.instance_id: element for element in context.elements}
    grouped_instances = {
        instance_id: group
        for group in groups
        for instance_id in group.bit_order
    }
    ungrouped_sequential = sorted(
        element.instance_id
        for element in context.elements
        if element.symbol_kind in {"flip-flop", "latch"}
        and element.instance_id not in grouped_instances
    )
    singleton_number = {
        instance_id: len(groups) + offset
        for offset, instance_id in enumerate(ungrouped_sequential, start=1)
    }
    included_groups: dict[int, CommonRegister] = {
        target_group.report_index: _common_group(target_group)
    }
    included_singletons: dict[int, CommonRegister] = {}

    while True:
        registers = list(included_groups.values()) + list(
            included_singletons.values()
        )
        included_instances = {
            instance_id
            for register in registers
            for instance_id in register.bit_order
        }
        roots = [
            flip_flop_input_trace_root(instance_id, context.elements)
            for instance_id in sorted(included_instances)
        ]
        block = trace_combinational_block(roots, context.elements)

        changed = False
        for source in block.source_pins:
            source_cell = by_id[source.instance_id]
            if source_cell.symbol_kind not in {"flip-flop", "latch"}:
                continue
            if source.instance_id in included_instances:
                continue

            source_group = grouped_instances.get(source.instance_id)
            if source_group is not None:
                if source_group.report_index not in included_groups:
                    included_groups[source_group.report_index] = _common_group(
                        source_group
                    )
                    changed = True
                continue

            # A sequential element that was not confidently grouped is still
            # real state.  Keep it as a scalar internal register.
            included_singletons[source.instance_id] = CommonRegister(
                name=f"register_{singleton_number[source.instance_id]:02d}",
                report_index=None,
                kind="ungrouped sequential boundary",
                bit_order=(source.instance_id,),
            )
            changed = True

        if not changed:
            registers = sorted(
                included_groups.values(),
                key=lambda register: register.report_index or 0,
            ) + sorted(
                included_singletons.values(),
                key=lambda register: register.bit_order,
            )
            return registers, block


def generate_group_module(
    group: GroupDefinition,
    groups: list[GroupDefinition],
    context,
) -> tuple[str, dict]:
    by_id = {element.instance_id: element for element in context.elements}
    drivers = build_driver_index(context.elements)
    top_names = {
        pin.net: sanitize_identifier(pin.name) for pin in find_input_pins(context)
    }
    identifier_map = build_identifier_map(groups)
    roots = [
        flip_flop_input_trace_root(instance_id, context.elements)
        for instance_id in group.bit_order
    ]
    block = trace_combinational_block(roots, context.elements)
    raw_boundary_names = boundary_input_names(block, context)

    q_name = group.name
    d_name = f"{group_stem(group)}_d"
    input_ports: dict[str, Port] = {}
    boundary_signals: dict[int, str] = {}
    source_groups: dict[int, GroupDefinition] = {}

    for net in sorted(block.boundary_input_nets):
        scalar_name = raw_boundary_names[net]
        port_name, expression, source_group = _mapped_boundary(
            scalar_name, identifier_map
        )
        boundary_signals[net] = expression
        if source_group is not None:
            if source_group.name == q_name:
                continue
            source_groups[source_group.report_index] = source_group
            input_ports[port_name] = Port(
                "input",
                "wire",
                source_group.width,
                port_name,
                (
                    "verified shift order"
                    if source_group.kind == "verified shift register"
                    else "inferred register vector"
                ),
            )
        else:
            input_ports[port_name] = Port(
                "input", "wire", 1, port_name, f"extracted net_{net}"
            )

    # Normalize every physical clock-tree leaf to its named top-level root.
    clock_traces = {
        instance_id: trace_clock(
            by_id[instance_id].input_pins["CLK"], context.elements, drivers
        )
        for instance_id in group.bit_order
    }
    clock_roots = {trace.root_net for trace in clock_traces.values()}
    if len(clock_roots) != 1:
        raise ValueError(
            f"group_{group.report_index:02d} has multiple clock roots: "
            f"{sorted(clock_roots)}"
        )
    clock_root = next(iter(clock_roots))
    clock_name = top_names.get(clock_root, f"clock_net_{clock_root}")
    input_ports[clock_name] = Port(
        "input", "wire", 1, clock_name, f"clock root net_{clock_root}"
    )

    control_by_instance: dict[int, list[AsyncControl]] = {}
    for instance_id in group.bit_order:
        flip_flop = by_id[instance_id]
        controls: list[AsyncControl] = []
        for pin, net in flip_flop.input_pins.items():
            if pin in {"CLK", "D"}:
                continue
            signal_name = top_names.get(net, f"input_net_{net}")
            input_ports[signal_name] = Port(
                "input", "wire", 1, signal_name, f"{pin} / net_{net}"
            )
            controls.append(_async_control(pin, signal_name))
        control_by_instance[instance_id] = controls

    # Stable, readable port order: clock, asynchronous controls, top/scalar
    # dependencies, grouped-register dependencies, then this group's Q and D.
    async_names = {
        control.signal
        for controls in control_by_instance.values()
        for control in controls
    }
    ordered_inputs: list[Port] = [input_ports[clock_name]]
    ordered_inputs.extend(
        input_ports[name]
        for name in sorted(async_names)
        if name != clock_name
    )
    ordinary_names = sorted(
        set(input_ports) - {clock_name} - async_names - {
            source_group.name for source_group in source_groups.values()
        }
    )
    ordered_inputs.extend(input_ports[name] for name in ordinary_names)
    ordered_inputs.extend(
        input_ports[source_groups[index].name]
        for index in sorted(source_groups)
    )
    ports = ordered_inputs + [
        Port("output", "reg", group.width, q_name, "current register state"),
        Port("output", "wire", group.width, d_name, "recovered next state"),
    ]

    constants = {
        net: f"1'b{value}" for net, value in block.constant_nets.items()
    }
    referenced_nets = {
        net
        for cell in block.combinational_cells
        for net in (
            list(cell.input_pins.values()) + list(cell.output_pins.values())
        )
    }
    internal_nets = sorted(
        referenced_nets - set(boundary_signals) - set(constants)
    )

    def signal(net: int) -> str:
        if net in boundary_signals:
            return boundary_signals[net]
        if net in constants:
            return constants[net]
        return f"net_{net}"

    ordering_note = (
        "verified shift order"
        if group.kind == "verified shift register"
        else "heuristic bit order: sorted physical instance IDs"
    )
    lines = [
        "// Fully inlined RTL recovered from puzzle.gds.",
        "// No includes, PDK cells, or helper modules are required.",
        f"// group_{group.report_index:02d}: {group.kind}; {ordering_note}.",
        f"module {module_name(group)} (",
    ]
    lines.extend(
        port.declaration(index + 1 < len(ports))
        for index, port in enumerate(ports)
    )
    lines.extend([");", ""])

    lines.append("  // Recovered register-bit mapping.")
    for instance_id in group.bit_order:
        bit = group.bit_for_instance(instance_id)
        flip_flop = by_id[instance_id]
        lines.append(
            f"  // {q_name}[{bit}] = u_{instance_id}.Q "
            f"({flip_flop.module})"
        )
    lines.append("")

    if internal_nets:
        lines.append("  // Recovered combinational nets.")
        lines.extend(f"  wire net_{net};" for net in internal_nets)
        lines.append("")

    lines.append("  // Inlined Boolean functions of the recovered standard cells.")
    for cell in block.combinational_cells:
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

    lines.append("  // Destination D-pin vector.")
    destination_bits: list[dict] = []
    for instance_id in group.bit_order:
        bit = group.bit_for_instance(instance_id)
        d_net = by_id[instance_id].input_pins["D"]
        lines.append(
            f"  assign {d_name}[{bit}] = {signal(d_net)};  "
            f"// u_{instance_id}.D / net_{d_net}"
        )
        destination_bits.append(
            {"bit": bit, "instance_id": instance_id, "d_net": d_net}
        )
    lines.append("")

    lines.append("  // Recovered sequential behavior.")
    sequential_bits: list[dict] = []
    for instance_id in group.bit_order:
        bit = group.bit_for_instance(instance_id)
        controls = control_by_instance[instance_id]
        sensitivity = [f"posedge {clock_name}"] + [
            f"{control.edge} {control.signal}" for control in controls
        ]
        lines.append(f"  always @({' or '.join(sensitivity)}) begin")
        for index, control in enumerate(controls):
            keyword = "if" if index == 0 else "else if"
            lines.append(
                f"    {keyword} ({control.condition}) "
                f"{q_name}[{bit}] <= {control.value};"
            )
        if controls:
            lines.append(f"    else {q_name}[{bit}] <= {d_name}[{bit}];")
        else:
            lines.append(f"    {q_name}[{bit}] <= {d_name}[{bit}];")
        lines.append("  end")
        sequential_bits.append(
            {
                "bit": bit,
                "instance_id": instance_id,
                "module": by_id[instance_id].module,
                "local_clock_net": clock_traces[instance_id].local_net,
                "clock_path": list(clock_traces[instance_id].path_nets),
                "controls": [
                    {
                        "pin": control.pin,
                        "signal": control.signal,
                        "edge": control.edge,
                        "value": control.value,
                    }
                    for control in controls
                ],
            }
        )
    lines.extend(["endmodule", ""])

    manifest = {
        "group_index": group.report_index,
        "module": module_name(group),
        "kind": group.kind,
        "confidence": group.confidence,
        "width": group.width,
        "bit_order": list(group.bit_order),
        "bit_order_note": ordering_note,
        "clock": {"name": clock_name, "root_net": clock_root},
        "source_group_ports": [
            source_groups[index].name for index in sorted(source_groups)
        ],
        "input_ports": [port.name for port in ordered_inputs],
        "q_port": q_name,
        "d_port": d_name,
        "combinational_cell_count": len(block.combinational_cells),
        "destination_bits": destination_bits,
        "sequential_bits": sequential_bits,
    }
    return "\n".join(lines), manifest


def generate_common_register_module(
    target_group: GroupDefinition,
    groups: list[GroupDefinition],
    context,
    port_renames: dict[str, str] | None = None,
    include_source_registers: bool = False,
) -> tuple[str, dict]:
    """Generate ordinary stateful RTL while preserving the traced boundary.

    The analytical generator exposes source Q vectors and a destination D
    vector as ports.  This generator gives source-register ports plain names
    such as ``register_04`` and updates the destination register directly,
    without exposing a separate D vector.

    With ``include_source_registers=True``, source registers and their D cones
    are recursively included as internal state.  The default is false because
    a backtrace normally treats the first flip-flop layer as its input boundary.
    """

    renames = {"I": "serial_in"}
    renames.update(port_renames or {})
    for old_name, new_name in renames.items():
        if not re.fullmatch(r"[A-Za-z_$][A-Za-z0-9_$]*", old_name):
            raise ValueError(f"Invalid original port identifier {old_name!r}")
        if not re.fullmatch(r"[A-Za-z_$][A-Za-z0-9_$]*", new_name):
            raise ValueError(f"Invalid replacement port identifier {new_name!r}")

    if include_source_registers:
        registers, block = _common_register_closure(
            target_group, groups, context
        )
    else:
        registers = [_common_group(target_group)]
        roots = [
            flip_flop_input_trace_root(instance_id, context.elements)
            for instance_id in target_group.bit_order
        ]
        block = trace_combinational_block(roots, context.elements)
    target = next(
        register
        for register in registers
        if register.report_index == target_group.report_index
    )
    by_id = {element.instance_id: element for element in context.elements}
    drivers = build_driver_index(context.elements)
    grouped_instances = {
        instance_id: group
        for group in groups
        for instance_id in group.bit_order
    }
    ungrouped_sequential = sorted(
        element.instance_id
        for element in context.elements
        if element.symbol_kind in {"flip-flop", "latch"}
        and element.instance_id not in grouped_instances
    )
    singleton_names = {
        instance_id: f"register_{len(groups) + offset:02d}"
        for offset, instance_id in enumerate(ungrouped_sequential, start=1)
    }
    top_names = {
        pin.net: renames.get(
            sanitize_identifier(pin.name), sanitize_identifier(pin.name)
        )
        for pin in find_input_pins(context)
    }

    state_by_instance: dict[int, tuple[CommonRegister, int]] = {}
    q_signals: dict[int, str] = {}
    for register in registers:
        for instance_id in register.bit_order:
            bit = register.bit_for_instance(instance_id)
            state_by_instance[instance_id] = (register, bit)
            flip_flop = by_id[instance_id]
            for net in flip_flop.output_pins.values():
                q_signals[net] = (
                    register.name
                    if register.width == 1
                    else f"{register.name}[{bit}]"
                )

    boundary_signals: dict[int, str] = {}
    input_ports: dict[str, Port] = {}
    for net in sorted(block.boundary_input_nets):
        if net in q_signals or net in block.constant_nets:
            continue

        sequential_sources = [
            endpoint
            for endpoint in drivers.get(net, [])
            if by_id[endpoint.instance_id].symbol_kind
            in {"flip-flop", "latch"}
        ]
        if len(sequential_sources) == 1:
            source_id = sequential_sources[0].instance_id
            source_group = grouped_instances.get(source_id)
            if source_group is not None:
                source_register = _common_group(source_group)
                bit = source_register.bit_for_instance(source_id)
                boundary_signals[net] = (
                    source_register.name
                    if source_register.width == 1
                    else f"{source_register.name}[{bit}]"
                )
                input_ports[source_register.name] = Port(
                    "input",
                    "wire",
                    source_register.width,
                    source_register.name,
                    "source register at backtrace boundary",
                )
                continue

            singleton_name = singleton_names[source_id]
            boundary_signals[net] = singleton_name
            input_ports[singleton_name] = Port(
                "input",
                "wire",
                1,
                singleton_name,
                f"u_{source_id}.Q at backtrace boundary",
            )
            continue

        default_name = top_names.get(net, f"input_net_{net}")
        input_name = renames.get(default_name, default_name)
        boundary_signals[net] = input_name
        input_ports[input_name] = Port("input", "wire", 1, input_name)

    clock_by_instance: dict[int, tuple[str, object]] = {}
    control_by_instance: dict[int, list[AsyncControl]] = {}
    for instance_id in sorted(state_by_instance):
        flip_flop = by_id[instance_id]
        clock_trace = trace_clock(
            flip_flop.input_pins["CLK"], context.elements, drivers
        )
        raw_clock_name = top_names.get(
            clock_trace.root_net, f"clock_net_{clock_trace.root_net}"
        )
        clock_name = renames.get(raw_clock_name, raw_clock_name)
        boundary_signals[clock_trace.root_net] = clock_name
        input_ports[clock_name] = Port("input", "wire", 1, clock_name)
        clock_by_instance[instance_id] = (clock_name, clock_trace)

        controls: list[AsyncControl] = []
        for pin, net in flip_flop.input_pins.items():
            if pin in {"CLK", "D"}:
                continue
            raw_signal = top_names.get(net, f"input_net_{net}")
            signal_name = renames.get(raw_signal, raw_signal)
            boundary_signals[net] = signal_name
            input_ports[signal_name] = Port(
                "input", "wire", 1, signal_name
            )
            controls.append(_async_control(pin, signal_name))
        control_by_instance[instance_id] = controls

    constants = {
        net: f"1'b{value}" for net, value in block.constant_nets.items()
    }

    def signal(net: int) -> str:
        if net in q_signals:
            return q_signals[net]
        if net in boundary_signals:
            return boundary_signals[net]
        if net in constants:
            return constants[net]
        return f"net_{net}"

    referenced_nets = {
        net
        for cell in block.combinational_cells
        for net in (
            list(cell.input_pins.values()) + list(cell.output_pins.values())
        )
    }
    internal_nets = sorted(
        referenced_nets
        - set(q_signals)
        - set(boundary_signals)
        - set(constants)
    )

    clock_names = {
        clock_name for clock_name, _trace in clock_by_instance.values()
    }
    async_names = {
        control.signal
        for controls in control_by_instance.values()
        for control in controls
    }
    ordered_input_names = sorted(
        input_ports,
        key=lambda name: (
            0 if name in clock_names else 1 if name in async_names else 2,
            name,
        ),
    )
    ports = [input_ports[name] for name in ordered_input_names]
    ports.append(
        Port(
            "output",
            "reg",
            target.width,
            target.name,
            "recovered register state",
        )
    )

    module = f"recovered_{target.name}"
    lines = [
        "// Stateful RTL recovered from puzzle.gds.",
        (
            "// Source registers and their next-state logic are internal state."
            if include_source_registers
            else "// The first source-register layer is the module boundary."
        ),
        f"module {module} (",
    ]
    lines.extend(
        port.declaration(index + 1 < len(ports))
        for index, port in enumerate(ports)
    )
    lines.extend([");", ""])

    internal_registers = [
        register for register in registers if register.name != target.name
    ]
    if internal_registers:
        lines.append("  // Internal recovered state.")
        for register in internal_registers:
            width = (
                f"[{register.width - 1}:0] " if register.width > 1 else ""
            )
            lines.append(f"  reg {width}{register.name};")
        lines.append("")

    lines.append("  // Physical flip-flop to RTL-bit mapping.")
    for register in registers:
        for instance_id in register.bit_order:
            bit = register.bit_for_instance(instance_id)
            suffix = f"[{bit}]" if register.width > 1 else ""
            lines.append(
                f"  // {register.name}{suffix} = u_{instance_id}.Q"
            )
    lines.append("")

    if internal_nets:
        lines.append("  // Recovered combinational nets.")
        lines.extend(f"  wire net_{net};" for net in internal_nets)
        lines.append("")

    lines.append("  // Recovered combinational next-state logic.")
    for cell in block.combinational_cells:
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

    lines.append("  // Recovered registers; D logic is used directly.")
    sequential_bits: list[dict] = []
    for register in registers:
        signatures = {
            (
                clock_by_instance[instance_id][0],
                tuple(
                    (
                        control.edge,
                        control.signal,
                        control.condition,
                        control.value,
                    )
                    for control in control_by_instance[instance_id]
                ),
            )
            for instance_id in register.bit_order
        }

        # A recovered vector normally shares one clock/reset signature.  Emit
        # one conventional vector-level always block in that case.
        if len(signatures) == 1:
            clock_name = clock_by_instance[register.bit_order[0]][0]
            controls = control_by_instance[register.bit_order[0]]
            sensitivity = [f"posedge {clock_name}"] + [
                f"{control.edge} {control.signal}" for control in controls
            ]
            lines.append(f"  always @({' or '.join(sensitivity)}) begin")
            for index, control in enumerate(controls):
                keyword = "if" if index == 0 else "else if"
                reset_value = (
                    control.value
                    if register.width == 1
                    else f"{register.width}'b{control.value[-1] * register.width}"
                )
                lines.append(
                    f"    {keyword} ({control.condition}) "
                    f"{register.name} <= {reset_value};"
                )
            if controls and register.width > 1:
                lines.append("    else begin")
                update_indent = "      "
            elif controls:
                update_indent = "    else "
            else:
                update_indent = "    "
            for instance_id in register.bit_order:
                bit = register.bit_for_instance(instance_id)
                state = (
                    register.name
                    if register.width == 1
                    else f"{register.name}[{bit}]"
                )
                d_net = by_id[instance_id].input_pins["D"]
                lines.append(
                    f"{update_indent}{state} <= {signal(d_net)};"
                )
            if controls and register.width > 1:
                lines.append("    end")
            lines.append("  end")
        else:
            # Rare mixed-control groups cannot safely share a vector-level
            # reset assignment, so preserve their physical per-bit behavior.
            for instance_id in register.bit_order:
                bit = register.bit_for_instance(instance_id)
                state = (
                    register.name
                    if register.width == 1
                    else f"{register.name}[{bit}]"
                )
                d_net = by_id[instance_id].input_pins["D"]
                clock_name = clock_by_instance[instance_id][0]
                controls = control_by_instance[instance_id]
                sensitivity = [f"posedge {clock_name}"] + [
                    f"{control.edge} {control.signal}" for control in controls
                ]
                lines.append(f"  always @({' or '.join(sensitivity)}) begin")
                for index, control in enumerate(controls):
                    keyword = "if" if index == 0 else "else if"
                    lines.append(
                        f"    {keyword} ({control.condition}) "
                        f"{state} <= {control.value};"
                    )
                update = f"{state} <= {signal(d_net)};"
                lines.append(
                    f"    else {update}" if controls else f"    {update}"
                )
                lines.append("  end")

        for instance_id in register.bit_order:
            bit = register.bit_for_instance(instance_id)
            d_net = by_id[instance_id].input_pins["D"]
            _clock_name, clock_trace = clock_by_instance[instance_id]
            sequential_bits.append(
                {
                    "register": register.name,
                    "bit": bit,
                    "instance_id": instance_id,
                    "d_net": d_net,
                    "clock_root_net": clock_trace.root_net,
                }
            )
    lines.extend(["endmodule", ""])

    manifest = {
        "style": "common stateful RTL",
        "source_register_policy": (
            "recursively included as internal state"
            if include_source_registers
            else "kept as backtrace input boundary"
        ),
        "module": module,
        "target_register": target.name,
        "target_width": target.width,
        "input_ports": ordered_input_names,
        "internal_registers": [
            {
                "name": register.name,
                "width": register.width,
                "kind": register.kind,
                "bit_order": list(register.bit_order),
            }
            for register in internal_registers
        ],
        "combinational_cell_count": len(block.combinational_cells),
        "sequential_bits": sequential_bits,
        "port_renames": renames,
    }
    return "\n".join(lines), manifest


def generate_full_register_from_backtrace(
    context,
    register_group_index: int,
    group_report_path: Path | None = None,
    port_renames: dict[str, str] | None = None,
    style: str = "common",
) -> tuple[str, dict]:
    """Recover one complete register and return standalone RTL.

    Unlike tracing a single D net, this function starts from the D pin of
    every flip-flop in the selected recovered register.  The individual
    backward cones are merged, so shared decoder logic is emitted only once.

    The default ``style="common"`` preserves the first flip-flop layer as the
    backtrace input boundary.  Register ports have plain names and the selected
    register is updated directly, with no analytical ``*_q`` or ``*_d`` ports.

    Use ``style="closed"`` to recursively include those source registers and
    their next-state logic as internal state.

    Use ``style="analytical"`` to retain the older interface where source Q
    vectors and the destination D vector are module ports.

    ``port_renames`` can replace physical top-level names with semantic names,
    for example ``I`` -> ``serial_in``.  In analytical mode it can also rename
    exposed boundary-register ports.
    """

    resolved_report = _resolve_group_report(group_report_path)

    groups = load_groups(resolved_report)
    group = next(
        (
            candidate
            for candidate in groups
            if candidate.report_index == register_group_index
        ),
        None,
    )
    if group is None:
        available = ", ".join(
            f"{candidate.report_index:02d}" for candidate in groups
        )
        raise ValueError(
            f"Unknown register group {register_group_index}; "
            f"available groups: {available}"
        )

    if style in {"common", "closed"}:
        return generate_common_register_module(
            group,
            groups,
            context,
            port_renames=port_renames,
            include_source_registers=(style == "closed"),
        )
    if style != "analytical":
        raise ValueError("style must be 'common', 'closed', or 'analytical'")

    text, manifest = generate_group_module(group, groups, context)

    renames = dict(port_renames or {})
    for old_name, new_name in renames.items():
        if not re.fullmatch(r"[A-Za-z_$][A-Za-z0-9_$]*", old_name):
            raise ValueError(f"Invalid original port identifier {old_name!r}")
        if not re.fullmatch(r"[A-Za-z_$][A-Za-z0-9_$]*", new_name):
            raise ValueError(f"Invalid replacement port identifier {new_name!r}")

    if len(set(renames.values())) != len(renames):
        raise ValueError("Two port names cannot be renamed to the same identifier")

    if renames:
        text = IDENTIFIER_RE.sub(
            lambda match: renames.get(match.group(0), match.group(0)),
            text,
        )
        manifest = dict(manifest)
        manifest["input_ports"] = [
            renames.get(name, name) for name in manifest["input_ports"]
        ]
        manifest["clock"] = dict(manifest["clock"])
        manifest["clock"]["name"] = renames.get(
            manifest["clock"]["name"], manifest["clock"]["name"]
        )
        manifest["port_renames"] = renames

    return text, manifest


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Generate no-dependency standalone RTL for all register groups"
    )
    parser.add_argument("gds", nargs="?", type=Path, default=DEFAULT_GDS)
    parser.add_argument("--groups", type=Path, default=DEFAULT_GROUP_REPORT)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT_DIR)
    args = parser.parse_args()

    context = recover_schematic(args.gds)
    groups = load_groups(args.groups)
    args.output_dir.mkdir(parents=True, exist_ok=True)

    generated: list[dict] = []
    combined = [
        "// All recovered standalone register groups from puzzle.gds.",
        "// Generated by scripts/generate_standalone_register_groups.py.",
        "",
    ]
    for group in groups:
        text, item = generate_group_module(group, groups, context)
        output = args.output_dir / f"{module_name(group)}.v"
        output.write_text(text)
        item["output"] = str(output)
        generated.append(item)
        combined.append(text.rstrip())
        combined.append("")
        print(
            f"group_{group.report_index:02d}: {group.width} bits, "
            f"{item['combinational_cell_count']} cells -> {output}"
        )

    combined_path = args.output_dir / "recovered_all_register_groups_standalone.v"
    combined_path.write_text("\n".join(combined).rstrip() + "\n")
    manifest = {
        "gds": str(args.gds),
        "group_report": str(args.groups),
        "combined_verilog": str(combined_path),
        "dependency_policy": "no includes, PDK cells, or helper modules",
        "groups": generated,
    }
    manifest_path = args.output_dir / "standalone_manifest.json"
    manifest_path.write_text(json.dumps(manifest, indent=2) + "\n")
    print(f"Combined Verilog: {combined_path}")
    print(f"Manifest: {manifest_path}")


if __name__ == "__main__":
    main()
