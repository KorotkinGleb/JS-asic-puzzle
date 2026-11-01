"""Generate synthesizable, PDK-free Verilog from recovered DAG cones."""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
import re
from typing import Iterable, Mapping

from scripts.recover_schematic_elements import SchematicElement

from .context import NamedNet, find_named_nets
from .dag import CircuitDAG, TraceCone
from .registers import RegisterCatalog, RegisterDefinition


IDENTIFIER_RE = re.compile(r"\b[A-Za-z_$][A-Za-z0-9_$]*\b")
BUS_NAME_RE = re.compile(r"^(?P<base>[A-Za-z_$][A-Za-z0-9_$]*)\[(?P<bit>\d+)\]$")
PLAIN_NAME_RE = re.compile(r"^[A-Za-z_$][A-Za-z0-9_$]*$")


@dataclass(frozen=True)
class Port:
    direction: str
    kind: str
    name: str
    width: int = 1
    comment: str = ""

    def declaration(self, comma: bool) -> str:
        width = f"[{self.width - 1}:0] " if self.width > 1 else ""
        suffix = "," if comma else ""
        comment = f"  // {self.comment}" if self.comment else ""
        return f"    {self.direction} {self.kind} {width}{self.name}{suffix}{comment}"


@dataclass(frozen=True)
class GeneratedVerilog:
    module_name: str
    text: str
    trace: TraceCone
    input_ports: tuple[str, ...]
    output_ports: tuple[str, ...]
    combinational_cell_count: int
    registers: tuple[str, ...] = ()


@dataclass(frozen=True)
class GeneratedBlockDesign:
    """A modular top, its output decoder, and all state-block modules."""

    top: GeneratedVerilog
    output_logic: GeneratedVerilog
    register_modules: tuple[GeneratedVerilog, ...]


@dataclass(frozen=True)
class AsyncControl:
    pin: str
    signal: str
    edge: str
    condition: str
    value: str


def sanitize_identifier(value: str) -> str:
    """Return a legal plain Verilog identifier without semantic renaming."""

    result = re.sub(r"[^A-Za-z0-9_$]", "_", value)
    if not result or not re.match(r"[A-Za-z_$]", result):
        result = "n_" + result
    return result


def _named_ports(
    selected_nets: Iterable[int],
    named_nets: Iterable[NamedNet],
    *,
    direction: str,
    kind: str = "wire",
) -> tuple[dict[str, Port], dict[int, str]]:
    """Aggregate labels such as O[0]..O[7] into native packed buses."""

    selected = set(selected_nets)
    labels = [item for item in named_nets if item.net in selected]
    bus_groups: dict[str, list[tuple[int, int]]] = {}
    scalars: list[tuple[str, int]] = []
    for item in labels:
        match = BUS_NAME_RE.fullmatch(item.name)
        if match:
            bus_groups.setdefault(match.group("base"), []).append(
                (int(match.group("bit")), item.net)
            )
        else:
            name = item.name if PLAIN_NAME_RE.fullmatch(item.name) else sanitize_identifier(item.name)
            scalars.append((name, item.net))

    ports: dict[str, Port] = {}
    expressions: dict[int, str] = {}
    for name, net in scalars:
        ports[name] = Port(direction, kind, name)
        expressions[net] = name
    for base, items in bus_groups.items():
        width = max(bit for bit, _ in items) + 1
        ports[base] = Port(direction, kind, base, width)
        for bit, net in items:
            expressions[net] = f"{base}[{bit}]"
    return ports, expressions


def _state_expression(catalog: RegisterCatalog, instance_id: int) -> str:
    return catalog.state_expression(instance_id)


def _sequential_boundary_expression(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    net: int,
) -> tuple[str, RegisterDefinition] | None:
    for endpoint in dag.drivers.get(net, ()):
        mapping = catalog.by_instance.get(endpoint.instance_id)
        if mapping is None:
            continue
        register, _ = mapping
        state = _state_expression(catalog, endpoint.instance_id)
        cell = dag.element(endpoint.instance_id)
        if net == mapping[1].q_net:
            return state, register
        function = cell.output_functions.get(endpoint.pin, "IQ")
        # SKY130 sequential output functions use IQ/!IQ.  The stored register
        # represents IQ, so preserve a complementary output when one exists.
        expression = f"~({state})" if "!" in function else state
        return expression, register
    return None


def _replace_function_pins(
    function: str,
    cell: SchematicElement,
    signal,
) -> str:
    pin_signals = {pin: signal(net) for pin, net in cell.input_pins.items()}
    unknown = {
        token for token in IDENTIFIER_RE.findall(function) if token not in pin_signals
    }
    if unknown:
        raise ValueError(
            f"u_{cell.instance_id} {cell.module}: unresolved Liberty tokens "
            + ", ".join(sorted(unknown))
        )
    return IDENTIFIER_RE.sub(lambda match: pin_signals[match.group(0)], function)


def _async_control(pin: str, signal: str) -> AsyncControl:
    normalized = pin.upper()
    if normalized in {"RESET_B", "RESET_N", "RESETB", "RN"}:
        return AsyncControl(pin, signal, "negedge", f"!{signal}", "1'b0")
    if normalized in {"RESET", "R"}:
        return AsyncControl(pin, signal, "posedge", signal, "1'b0")
    if normalized in {"SET_B", "SET_N", "SETB", "SN"}:
        return AsyncControl(pin, signal, "negedge", f"!{signal}", "1'b1")
    if normalized in {"SET", "S"}:
        return AsyncControl(pin, signal, "posedge", signal, "1'b1")
    raise ValueError(f"Unsupported asynchronous sequential control pin {pin!r}")


class _SignalResolver:
    def __init__(
        self,
        dag: CircuitDAG,
        catalog: RegisterCatalog,
        cone: TraceCone,
        *,
        internal_registers: set[str],
        named_nets: list[NamedNet],
    ):
        self.dag = dag
        self.catalog = catalog
        self.cone = cone
        self.internal_registers = internal_registers
        self.ports: dict[str, Port] = {}
        self.expressions: dict[int, str] = {
            net: f"1'b{value}" for net, value in cone.constant_nets
        }

        named_input_ports, named_expressions = _named_ports(
            cone.boundary_input_nets, named_nets, direction="input"
        )
        self.ports.update(named_input_ports)
        self.expressions.update(named_expressions)

        # Sequential boundary nets are expressed as bits of complete recovered
        # register vectors.  The current target/top state is not made an input.
        sequential_nets = {
            net
            for net in cone.all_nets
            if any(
                endpoint.instance_id in cone.sequential_boundary_ids
                for endpoint in dag.drivers.get(net, ())
            )
        }
        for net in sorted(sequential_nets):
            resolved = _sequential_boundary_expression(dag, catalog, net)
            if resolved is None:
                continue
            expression, register = resolved
            self.expressions[net] = expression
            if register.name not in internal_registers:
                self.ports[register.name] = Port(
                    "input",
                    "wire",
                    register.name,
                    register.width,
                    "recovered register boundary",
                )

        for net in cone.boundary_input_nets:
            if net in self.expressions:
                continue
            name = f"net_{net}"
            self.expressions[net] = name
            self.ports[name] = Port(
                "input", "wire", name, comment="unlabeled extracted input"
            )

    def add_native_input(self, net: int, named_nets: list[NamedNet], comment: str) -> str:
        if net in self.expressions:
            return self.expressions[net]
        ports, expressions = _named_ports((net,), named_nets, direction="input")
        if net in expressions:
            self.ports.update(ports)
            self.expressions.update(expressions)
            return expressions[net]
        name = f"net_{net}"
        self.expressions[net] = name
        self.ports[name] = Port("input", "wire", name, comment=comment)
        return name

    def signal(self, net: int) -> str:
        if net in self.expressions:
            return self.expressions[net]
        sequential = _sequential_boundary_expression(self.dag, self.catalog, net)
        if sequential is not None:
            expression, register = sequential
            self.expressions[net] = expression
            if register.name not in self.internal_registers:
                self.ports[register.name] = Port(
                    "input", "wire", register.name, register.width
                )
            return expression
        return f"net_{net}"


def _internal_wire_nets(
    dag: CircuitDAG,
    cone: TraceCone,
    resolver: _SignalResolver,
) -> list[int]:
    nets: set[int] = set()
    for instance_id in cone.combinational_ids:
        cell = dag.element(instance_id)
        for net in cell.output_pins.values():
            if resolver.signal(net) == f"net_{net}":
                nets.add(net)
    return sorted(nets)


def _emit_module_header(lines: list[str], name: str, ports: list[Port]) -> None:
    lines.append(f"module {name} (")
    lines.extend(
        port.declaration(index + 1 < len(ports))
        for index, port in enumerate(ports)
    )
    lines.extend([");", ""])


def _emit_combinational_logic(
    lines: list[str],
    dag: CircuitDAG,
    cone: TraceCone,
    resolver: _SignalResolver,
) -> None:
    wires = _internal_wire_nets(dag, cone, resolver)
    if wires:
        lines.append("  // Extracted combinational nets.")
        lines.extend(f"  wire net_{net};" for net in wires)
        lines.append("")
    lines.append("  // Liberty Boolean functions recovered from standard cells.")
    for cell in dag.topological_cells(cone):
        lines.append(f"  // u_{cell.instance_id}: {cell.module}")
        for output_pin, output_net in cell.output_pins.items():
            if output_net not in cone.all_nets:
                continue
            function = cell.output_functions.get(output_pin)
            if function is None:
                raise ValueError(f"u_{cell.instance_id}.{output_pin}: missing function")
            expression = _replace_function_pins(function, cell, resolver.signal)
            lines.append(f"  assign {resolver.signal(output_net)} = {expression};")
    lines.append("")


def _ordered_ports(ports: Mapping[str, Port], outputs: Iterable[Port]) -> list[Port]:
    inputs = sorted(
        ports.values(),
        key=lambda port: (
            port.name not in {"clk", "rst_n", "reset", "enable", "I"},
            port.name,
        ),
    )
    return inputs + list(outputs)


def generate_combined_net_module(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    roots: Mapping[str, int],
    *,
    module_name: str = "recovered_logic",
) -> GeneratedVerilog:
    """Combine arbitrary output-net backtraces into one combinational module."""

    if not roots:
        raise ValueError("At least one named root net is required")
    normalized_roots = {
        (name if PLAIN_NAME_RE.fullmatch(name) else sanitize_identifier(name)): net
        for name, net in roots.items()
    }
    cone = dag.backtrace(normalized_roots.values())
    named_nets = find_named_nets(dag.context)
    resolver = _SignalResolver(
        dag,
        catalog,
        cone,
        internal_registers=set(),
        named_nets=named_nets,
    )
    output_ports = [Port("output", "wire", name) for name in normalized_roots]
    ports = _ordered_ports(resolver.ports, output_ports)
    lines = [
        "// Combinational RTL recovered from a GDS backward DAG trace.",
        "// Inputs stop only at recovered register Q pins or pure top inputs.",
    ]
    _emit_module_header(lines, module_name, ports)
    _emit_combinational_logic(lines, dag, cone, resolver)
    for name, net in normalized_roots.items():
        lines.append(f"  assign {name} = {resolver.signal(net)};  // net_{net}")
    lines.extend(["endmodule", ""])
    return GeneratedVerilog(
        module_name=module_name,
        text="\n".join(lines),
        trace=cone,
        input_ports=tuple(port.name for port in ports if port.direction == "input"),
        output_ports=tuple(normalized_roots),
        combinational_cell_count=len(cone.combinational_ids),
    )


def generate_net_module(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    start_net: int,
    *,
    module_name: str | None = None,
    output_name: str | None = None,
) -> GeneratedVerilog:
    """Backtrace one net, using its native GDS label when available."""

    labels = [item.name for item in find_named_nets(dag.context) if item.net == start_net]
    raw_name = output_name or (labels[0] if labels else f"net_{start_net}_value")
    name = raw_name if PLAIN_NAME_RE.fullmatch(raw_name) else sanitize_identifier(raw_name)
    return generate_combined_net_module(
        dag,
        catalog,
        {name: start_net},
        module_name=module_name or f"recovered_{name}_logic",
    )


def _register_output_port(register: RegisterDefinition) -> Port:
    return Port(
        "output",
        "reg",
        register.name,
        register.width,
        "recovered current state",
    )


def _prepare_state_controls(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    registers: Iterable[RegisterDefinition],
    resolver: _SignalResolver,
    named_nets: list[NamedNet],
) -> tuple[dict[int, str], dict[int, list[AsyncControl]]]:
    clock_by_instance: dict[int, str] = {}
    controls_by_instance: dict[int, list[AsyncControl]] = {}
    for register in registers:
        for bit in register.bits:
            clock_by_instance[bit.instance_id] = resolver.add_native_input(
                bit.clock_root_net, named_nets, "normalized clock-tree root"
            )
            controls: list[AsyncControl] = []
            for pin, net in bit.controls:
                signal = resolver.add_native_input(net, named_nets, f"{pin} control")
                controls.append(_async_control(pin, signal))
            controls_by_instance[bit.instance_id] = controls
    return clock_by_instance, controls_by_instance


def _emit_sequential_logic(
    lines: list[str],
    registers: Iterable[RegisterDefinition],
    resolver: _SignalResolver,
    clock_by_instance: Mapping[int, str],
    controls_by_instance: Mapping[int, list[AsyncControl]],
) -> None:
    lines.append("  // Recovered state updates; physical CTS buffers are normalized away.")
    for register in registers:
        lines.append(f"  // {register.name}: {register.kind}")
        for bit in register.bits:
            target = register.name if register.width == 1 else f"{register.name}[{bit.bit}]"
            clock = clock_by_instance[bit.instance_id]
            controls = controls_by_instance[bit.instance_id]
            sensitivity = [f"posedge {clock}"] + [
                f"{control.edge} {control.signal}" for control in controls
            ]
            lines.append(f"  always @({' or '.join(sensitivity)}) begin")
            for index, control in enumerate(controls):
                keyword = "if" if index == 0 else "else if"
                lines.append(
                    f"    {keyword} ({control.condition}) {target} <= {control.value};"
                )
            prefix = "else " if controls else ""
            lines.append(f"    {prefix}{target} <= {resolver.signal(bit.d_net)};")
            lines.append("  end")
        lines.append("")


def generate_register_module(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    register_name: str | int,
    *,
    module_name: str | None = None,
) -> GeneratedVerilog:
    """Merge every D-bit cone and emit one ordinary stateful register module."""

    register = catalog.get(register_name)
    cone = dag.backtrace(register.d_nets)
    named_nets = find_named_nets(dag.context)
    resolver = _SignalResolver(
        dag,
        catalog,
        cone,
        internal_registers={register.name},
        named_nets=named_nets,
    )
    clocks, controls = _prepare_state_controls(
        dag, catalog, (register,), resolver, named_nets
    )
    output_port = _register_output_port(register)
    ports = _ordered_ports(resolver.ports, (output_port,))
    name = module_name or f"recovered_{register.name}"
    lines = [
        "// Stateful RTL recovered by merging every FF.D backward cone.",
        f"// {register.name}: {register.width} bit(s), {register.kind}.",
    ]
    _emit_module_header(lines, name, ports)
    lines.append("  // Physical-bit mapping.")
    for bit in register.bits:
        lines.append(
            f"  // {register.name}[{bit.bit}] = u_{bit.instance_id}.Q / net_{bit.q_net}; "
            f"D=net_{bit.d_net}"
        )
    lines.append("")
    _emit_combinational_logic(lines, dag, cone, resolver)
    _emit_sequential_logic(lines, (register,), resolver, clocks, controls)
    lines.extend(["endmodule", ""])
    return GeneratedVerilog(
        module_name=name,
        text="\n".join(lines),
        trace=cone,
        input_ports=tuple(port.name for port in ports if port.direction == "input"),
        output_ports=(register.name,),
        combinational_cell_count=len(cone.combinational_ids),
        registers=(register.name,),
    )


def generate_output_logic_module(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    *,
    module_name: str = "recovered_output_logic",
) -> GeneratedVerilog:
    """Recover the combinational logic driving native GDS output ports."""

    named_nets = find_named_nets(dag.context)
    output_labels = [item for item in named_nets if item.direction == "output"]
    if not output_labels:
        raise ValueError("The GDS has no driven, labeled top-level outputs")
    cone = dag.backtrace(item.net for item in output_labels)
    resolver = _SignalResolver(
        dag,
        catalog,
        cone,
        internal_registers=set(),
        named_nets=named_nets,
    )
    output_ports_by_name, output_expressions = _named_ports(
        (item.net for item in output_labels), output_labels, direction="output"
    )
    outputs = list(output_ports_by_name.values())
    ports = _ordered_ports(resolver.ports, outputs)
    lines = [
        "// Native output decoder recovered from labeled GDS output nets.",
        "// Register vectors form its sequential boundary.",
    ]
    _emit_module_header(lines, module_name, ports)
    _emit_combinational_logic(lines, dag, cone, resolver)
    emitted: set[tuple[str, int]] = set()
    for item in output_labels:
        expression = output_expressions[item.net]
        marker = (expression, item.net)
        if marker in emitted:
            continue
        emitted.add(marker)
        lines.append(f"  assign {expression} = {resolver.signal(item.net)};  // net_{item.net}")
    lines.extend(["endmodule", ""])
    return GeneratedVerilog(
        module_name=module_name,
        text="\n".join(lines),
        trace=cone,
        input_ports=tuple(port.name for port in ports if port.direction == "input"),
        output_ports=tuple(port.name for port in outputs),
        combinational_cell_count=len(cone.combinational_ids),
    )


def generate_block_design(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    *,
    top_module_name: str = "recovered_block_top",
    output_module_name: str = "recovered_output_logic",
) -> GeneratedBlockDesign:
    """Create a hierarchical top wired from all recovered register modules.

    Each register module owns its merged next-state cone and FF state.  The top
    contains only ports, register-vector wires, and module instances.  Shared
    combinational logic may be duplicated between independently recovered
    register blocks, which is functionally harmless and can be resynthesized.
    """

    register_modules = tuple(
        generate_register_module(dag, catalog, register.name)
        for register in catalog.registers
    )
    output_logic = generate_output_logic_module(
        dag, catalog, module_name=output_module_name
    )
    register_names = set(catalog.by_name)
    external_names = {
        name
        for generated in (*register_modules, output_logic)
        for name in generated.input_ports
        if name not in register_names
    }

    named_nets = find_named_nets(dag.context)
    native_inputs = [item for item in named_nets if item.direction == "input"]
    native_input_ports, _ = _named_ports(
        (item.net for item in native_inputs), native_inputs, direction="input"
    )
    input_ports = {
        name: native_input_ports.get(
            name,
            Port("input", "wire", name, comment="unlabeled extracted input"),
        )
        for name in external_names
    }
    native_outputs = [item for item in named_nets if item.direction == "output"]
    output_ports_by_name, _ = _named_ports(
        (item.net for item in native_outputs), native_outputs, direction="output"
    )
    output_ports = list(output_ports_by_name.values())
    ports = _ordered_ports(input_ports, output_ports)

    lines = [
        "// Hierarchical RTL assembled from recovered register blocks.",
        "// Compile this file with recovered_output_logic.v and registers/*.v.",
    ]
    _emit_module_header(lines, top_module_name, ports)
    lines.append("  // Recovered register-state interconnect.")
    for register in catalog.registers:
        width = f"[{register.width - 1}:0] " if register.width > 1 else ""
        lines.append(f"  wire {width}{register.name};")
    lines.append("")

    lines.append("  // Each block contains one register and all of its D-input cones.")
    for generated in register_modules:
        register_name = generated.output_ports[0]
        connections = [
            *(f".{name}({name})" for name in generated.input_ports),
            f".{register_name}({register_name})",
        ]
        lines.append(
            f"  {generated.module_name} u_{register_name} ("
        )
        lines.extend(
            f"      {connection}{',' if index + 1 < len(connections) else ''}"
            for index, connection in enumerate(connections)
        )
        lines.append("  );")
        lines.append("")

    lines.append("  // Labeled GDS outputs are decoded from recovered state.")
    output_connections = [
        *(f".{name}({name})" for name in output_logic.input_ports),
        *(f".{name}({name})" for name in output_logic.output_ports),
    ]
    lines.append(f"  {output_logic.module_name} u_output_logic (")
    lines.extend(
        f"      {connection}{',' if index + 1 < len(output_connections) else ''}"
        for index, connection in enumerate(output_connections)
    )
    lines.extend(["  );", "endmodule", ""])

    all_roots = [
        bit.d_net for register in catalog.registers for bit in register.bits
    ] + [item.net for item in native_outputs]
    trace = dag.backtrace(all_roots)
    top = GeneratedVerilog(
        module_name=top_module_name,
        text="\n".join(lines),
        trace=trace,
        input_ports=tuple(port.name for port in ports if port.direction == "input"),
        output_ports=tuple(port.name for port in output_ports),
        combinational_cell_count=len(trace.combinational_ids),
        registers=tuple(register.name for register in catalog.registers),
    )
    return GeneratedBlockDesign(top, output_logic, register_modules)


def generate_complete_top(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    *,
    module_name: str = "recovered_top",
    expose_registers: bool = True,
) -> GeneratedVerilog:
    """Recover all D cones, all labeled outputs, and all sequential state."""

    named_nets = find_named_nets(dag.context)
    output_labels = [item for item in named_nets if item.direction == "output"]
    d_roots = [bit.d_net for register in catalog.registers for bit in register.bits]
    roots = d_roots + [item.net for item in output_labels]
    cone = dag.backtrace(roots)
    internal_names = {register.name for register in catalog.registers}
    resolver = _SignalResolver(
        dag,
        catalog,
        cone,
        internal_registers=internal_names,
        named_nets=named_nets,
    )
    clocks, controls = _prepare_state_controls(
        dag, catalog, catalog.registers, resolver, named_nets
    )
    output_ports_by_name, output_expressions = _named_ports(
        (item.net for item in output_labels), output_labels, direction="output"
    )
    register_ports = (
        [_register_output_port(register) for register in catalog.registers]
        if expose_registers
        else []
    )
    if not expose_registers:
        # State still needs declarations when it is not exposed as debug output.
        register_declarations = [
            Port("", "reg", register.name, register.width) for register in catalog.registers
        ]
    else:
        register_declarations = []
    outputs = list(output_ports_by_name.values()) + register_ports
    ports = _ordered_ports(resolver.ports, outputs)
    lines = [
        "// Complete PDK-free RTL structurally recovered from the GDS netlist.",
        "// Register grouping is heuristic; standard-cell connectivity is exact.",
    ]
    _emit_module_header(lines, module_name, ports)
    if register_declarations:
        for declaration in register_declarations:
            width = f"[{declaration.width - 1}:0] " if declaration.width > 1 else ""
            lines.append(f"  reg {width}{declaration.name};")
        lines.append("")
    _emit_combinational_logic(lines, dag, cone, resolver)
    lines.append("  // Native top-level GDS outputs.")
    emitted: set[tuple[str, int]] = set()
    for item in output_labels:
        expression = output_expressions[item.net]
        marker = (expression, item.net)
        if marker in emitted:
            continue
        emitted.add(marker)
        lines.append(f"  assign {expression} = {resolver.signal(item.net)};  // net_{item.net}")
    lines.append("")
    _emit_sequential_logic(lines, catalog.registers, resolver, clocks, controls)
    lines.extend(["endmodule", ""])
    return GeneratedVerilog(
        module_name=module_name,
        text="\n".join(lines),
        trace=cone,
        input_ports=tuple(port.name for port in ports if port.direction == "input"),
        output_ports=tuple(port.name for port in outputs),
        combinational_cell_count=len(cone.combinational_ids),
        registers=tuple(register.name for register in catalog.registers),
    )


def write_verilog(generated: GeneratedVerilog, output_path: str | Path) -> Path:
    path = Path(output_path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(generated.text)
    return path
