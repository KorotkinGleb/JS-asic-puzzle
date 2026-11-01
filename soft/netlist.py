"""Generate structural standard-cell Verilog from the recovered GDS DAG.

The ordinary :mod:`soft.verilog` backend writes convenient behavioral RTL with
``assign`` expressions and ``always`` blocks.  This backend keeps those
behaviors inside reusable cell-model files and emits the recovered design as
wires plus named module instances.  It is therefore much closer to a mapped
gate-level netlist while remaining independent of the installed PDK during
simulation.
"""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Iterable, Mapping

from scripts.recover_schematic_elements import SchematicElement

from .context import NamedNet, find_named_nets
from .dag import CircuitDAG, TraceCone
from .registers import RegisterCatalog, RegisterDefinition
from .verilog import (
    GeneratedBlockDesign,
    GeneratedVerilog,
    Port,
    _SignalResolver,
    _async_control,
    _emit_module_header,
    _internal_wire_nets,
    _named_ports,
    _ordered_ports,
    _prepare_state_controls,
    sanitize_identifier,
)


STRUCTURAL_BUFFER = "soft_netlist_buf"


@dataclass(frozen=True)
class CellModel:
    """One PDK-free simulation model for a referenced standard cell."""

    module_name: str
    text: str


def _wire_register_port(register: RegisterDefinition) -> Port:
    return Port(
        "output",
        "wire",
        register.name,
        register.width,
        "recovered current state",
    )


def _emit_structural_combinational_logic(
    lines: list[str],
    dag: CircuitDAG,
    cone: TraceCone,
    resolver: _SignalResolver,
) -> None:
    """Emit only cell instances for the combinational part of a trace."""

    wires = _internal_wire_nets(dag, cone, resolver)
    if wires:
        lines.append("  // Extracted combinational nets.")
        lines.extend(f"  wire net_{net};" for net in wires)
        lines.append("")

    lines.append("  // Recovered standard-cell instances.")
    for cell in dag.topological_cells(cone):
        connections = [
            (pin, resolver.signal(net)) for pin, net in cell.input_pins.items()
        ]
        connections.extend(
            (pin, resolver.signal(net))
            for pin, net in cell.output_pins.items()
            if net in cone.all_nets
        )
        lines.append(f"  {cell.module} u_{cell.instance_id} (")
        lines.extend(
            f"      .{pin}({signal}){',' if index + 1 < len(connections) else ''}"
            for index, (pin, signal) in enumerate(connections)
        )
        lines.extend(["  );", ""])


def _emit_output_buffers(
    lines: list[str],
    outputs: Iterable[tuple[str, int]],
    resolver: _SignalResolver,
) -> None:
    """Connect recovered root nets to ports without behavioral assignments."""

    lines.append("  // Structural connections to module output ports.")
    emitted: set[tuple[str, int]] = set()
    for expression, net in outputs:
        marker = (expression, net)
        if marker in emitted:
            continue
        emitted.add(marker)
        instance = sanitize_identifier(f"output_{expression}_{net}")
        lines.extend(
            [
                f"  {STRUCTURAL_BUFFER} u_{instance} (",
                f"      .A({resolver.signal(net)}),",
                f"      .X({expression})",
                "  );",
            ]
        )
    lines.append("")


def _emit_structural_state(
    lines: list[str],
    dag: CircuitDAG,
    registers: Iterable[RegisterDefinition],
    resolver: _SignalResolver,
    clock_by_instance: Mapping[int, str],
    controls_by_instance: Mapping[int, list],
) -> None:
    """Instantiate the original FF masters instead of writing ``always``."""

    lines.append("  // Recovered sequential standard-cell instances.")
    for register in registers:
        lines.append(f"  // {register.name}: {register.kind}")
        for bit in register.bits:
            cell = dag.element(bit.instance_id)
            target = (
                register.name
                if register.width == 1
                else f"{register.name}[{bit.bit}]"
            )
            control_signals = {
                control.pin: control.signal
                for control in controls_by_instance[bit.instance_id]
            }
            connections: list[tuple[str, str]] = []
            for pin, net in cell.input_pins.items():
                if pin == bit.clock_pin:
                    signal = clock_by_instance[bit.instance_id]
                elif pin == "D":
                    signal = resolver.signal(bit.d_net)
                else:
                    signal = control_signals.get(pin, resolver.signal(net))
                connections.append((pin, signal))

            q_pin = next(
                (
                    pin
                    for pin, net in cell.output_pins.items()
                    if net == bit.q_net
                ),
                None,
            )
            if q_pin is None:
                raise ValueError(
                    f"u_{bit.instance_id} {cell.module}: no output drives "
                    f"Q net_{bit.q_net}"
                )
            connections.append((q_pin, target))
            lines.append(f"  {cell.module} u_{bit.instance_id}_state (")
            lines.extend(
                f"      .{pin}({signal}){',' if index + 1 < len(connections) else ''}"
                for index, (pin, signal) in enumerate(connections)
            )
            lines.extend(["  );", ""])


def generate_structural_combined_net_module(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    roots: Mapping[str, int],
    *,
    module_name: str = "recovered_logic_netlist",
) -> GeneratedVerilog:
    """Generate a structural module for one or more arbitrary root nets."""

    if not roots:
        raise ValueError("At least one named root net is required")
    normalized = {
        sanitize_identifier(name): net for name, net in roots.items()
    }
    cone = dag.backtrace(normalized.values())
    named_nets = find_named_nets(dag.context)
    resolver = _SignalResolver(
        dag,
        catalog,
        cone,
        internal_registers=set(),
        named_nets=named_nets,
    )
    output_ports = [Port("output", "wire", name) for name in normalized]
    ports = _ordered_ports(resolver.ports, output_ports)
    lines = [
        "// Structural netlist recovered from a GDS backward DAG trace.",
        "// Design logic contains wires and standard-cell instances only.",
    ]
    _emit_module_header(lines, module_name, ports)
    _emit_structural_combinational_logic(lines, dag, cone, resolver)
    _emit_output_buffers(lines, normalized.items(), resolver)
    lines.extend(["endmodule", ""])
    return GeneratedVerilog(
        module_name=module_name,
        text="\n".join(lines),
        trace=cone,
        input_ports=tuple(port.name for port in ports if port.direction == "input"),
        output_ports=tuple(normalized),
        combinational_cell_count=len(cone.combinational_ids),
    )


def generate_structural_net_module(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    start_net: int,
    *,
    module_name: str | None = None,
    output_name: str | None = None,
) -> GeneratedVerilog:
    labels = [
        item.name for item in find_named_nets(dag.context) if item.net == start_net
    ]
    raw_name = output_name or (labels[0] if labels else f"net_{start_net}_value")
    name = sanitize_identifier(raw_name)
    return generate_structural_combined_net_module(
        dag,
        catalog,
        {name: start_net},
        module_name=module_name or f"recovered_{name}_logic_netlist",
    )


def generate_structural_register_module(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    register_name: str | int,
    *,
    module_name: str | None = None,
) -> GeneratedVerilog:
    """Generate one register block from cells, wires, and FF instances."""

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
    output_port = _wire_register_port(register)
    ports = _ordered_ports(resolver.ports, (output_port,))
    name = module_name or f"recovered_{register.name}"
    lines = [
        "// Structural state block recovered from GDS connectivity.",
        f"// {register.name}: {register.width} bit(s), {register.kind}.",
    ]
    _emit_module_header(lines, name, ports)
    lines.append("  // Physical-bit mapping.")
    for bit in register.bits:
        lines.append(
            f"  // {register.name}[{bit.bit}] = u_{bit.instance_id}.Q / "
            f"net_{bit.q_net}; D=net_{bit.d_net}"
        )
    lines.append("")
    _emit_structural_combinational_logic(lines, dag, cone, resolver)
    _emit_structural_state(lines, dag, (register,), resolver, clocks, controls)
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


def generate_structural_output_logic_module(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    *,
    module_name: str = "recovered_output_logic",
) -> GeneratedVerilog:
    """Generate the native output decoder as a structural cell netlist."""

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
    outputs_by_name, output_expressions = _named_ports(
        (item.net for item in output_labels), output_labels, direction="output"
    )
    outputs = list(outputs_by_name.values())
    ports = _ordered_ports(resolver.ports, outputs)
    lines = [
        "// Structural output decoder recovered from labeled GDS nets.",
        "// Compile with cells/*.v from the same output directory.",
    ]
    _emit_module_header(lines, module_name, ports)
    _emit_structural_combinational_logic(lines, dag, cone, resolver)
    _emit_output_buffers(
        lines,
        ((output_expressions[item.net], item.net) for item in output_labels),
        resolver,
    )
    lines.extend(["endmodule", ""])
    return GeneratedVerilog(
        module_name=module_name,
        text="\n".join(lines),
        trace=cone,
        input_ports=tuple(port.name for port in ports if port.direction == "input"),
        output_ports=tuple(port.name for port in outputs),
        combinational_cell_count=len(cone.combinational_ids),
    )


def generate_structural_complete_top(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    *,
    module_name: str = "recovered_top",
    expose_registers: bool = True,
) -> GeneratedVerilog:
    """Generate a flat complete top containing no behavioral design logic."""

    named_nets = find_named_nets(dag.context)
    output_labels = [item for item in named_nets if item.direction == "output"]
    roots = [
        bit.d_net for register in catalog.registers for bit in register.bits
    ] + [item.net for item in output_labels]
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
        [_wire_register_port(register) for register in catalog.registers]
        if expose_registers
        else []
    )
    outputs = list(output_ports_by_name.values()) + register_ports
    ports = _ordered_ports(resolver.ports, outputs)
    lines = [
        "// Complete flat structural netlist recovered from the GDS.",
        "// The design body contains only wires and module instances.",
    ]
    _emit_module_header(lines, module_name, ports)
    if not expose_registers:
        lines.append("  // Internal recovered state vectors.")
        for register in catalog.registers:
            width = f"[{register.width - 1}:0] " if register.width > 1 else ""
            lines.append(f"  wire {width}{register.name};")
        lines.append("")
    _emit_structural_combinational_logic(lines, dag, cone, resolver)
    _emit_output_buffers(
        lines,
        ((output_expressions[item.net], item.net) for item in output_labels),
        resolver,
    )
    _emit_structural_state(
        lines, dag, catalog.registers, resolver, clocks, controls
    )
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


def generate_structural_block_design(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    *,
    top_module_name: str = "recovered_block_top",
    output_module_name: str = "recovered_output_logic",
) -> GeneratedBlockDesign:
    """Generate a hierarchical top wired from structural register blocks."""

    register_modules = tuple(
        generate_structural_register_module(dag, catalog, register.name)
        for register in catalog.registers
    )
    output_logic = generate_structural_output_logic_module(
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
        "// Hierarchical structural top assembled from recovered blocks.",
        "// Compile with recovered_output_logic.v, registers/*.v, and cells/*.v.",
    ]
    _emit_module_header(lines, top_module_name, ports)
    lines.append("  // Recovered register-state interconnect.")
    for register in catalog.registers:
        width = f"[{register.width - 1}:0] " if register.width > 1 else ""
        lines.append(f"  wire {width}{register.name};")
    lines.append("")

    for generated in register_modules:
        register_name = generated.output_ports[0]
        connections = [
            *(f".{name}({name})" for name in generated.input_ports),
            f".{register_name}({register_name})",
        ]
        lines.append(f"  {generated.module_name} u_{register_name} (")
        lines.extend(
            f"      {connection}{',' if index + 1 < len(connections) else ''}"
            for index, connection in enumerate(connections)
        )
        lines.extend(["  );", ""])

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

    roots = [
        bit.d_net for register in catalog.registers for bit in register.bits
    ] + [item.net for item in native_outputs]
    trace = dag.backtrace(roots)
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


def _cell_specs(dag: CircuitDAG) -> dict[str, tuple[str, tuple[str, ...], dict[str, str]]]:
    """Collect stable pin/function definitions for every recognized master."""

    kinds: dict[str, str] = {}
    inputs: dict[str, list[str]] = {}
    outputs: dict[str, dict[str, str]] = {}
    for cell in dag.elements:
        kinds.setdefault(cell.module, cell.symbol_kind)
        input_list = inputs.setdefault(cell.module, [])
        for pin in cell.input_pins:
            if pin not in input_list:
                input_list.append(pin)
        output_map = outputs.setdefault(cell.module, {})
        output_map.update(cell.output_functions)
    return {
        module: (kinds[module], tuple(inputs[module]), outputs[module])
        for module in sorted(kinds)
    }


def _generate_cell_model(
    module_name: str,
    symbol_kind: str,
    input_pins: tuple[str, ...],
    output_functions: Mapping[str, str],
) -> CellModel:
    outputs = tuple(output_functions)
    ports = [
        *(Port("input", "wire", pin) for pin in input_pins),
        *(Port("output", "wire", pin) for pin in outputs),
    ]
    lines = [
        "// PDK-free functional simulation model generated from Liberty.",
        f"// Original master: {module_name}",
    ]
    _emit_module_header(lines, module_name, ports)

    if symbol_kind == "flip-flop":
        clock_pin = next(
            (pin for pin in input_pins if "CLK" in pin.upper()), "CLK"
        )
        if "D" not in input_pins or clock_pin not in input_pins:
            raise ValueError(f"Unsupported FF pinout for {module_name}")
        controls = [
            _async_control(pin, pin)
            for pin in input_pins
            if pin not in {"D", clock_pin}
        ]
        sensitivity = [f"posedge {clock_pin}"] + [
            f"{control.edge} {control.signal}" for control in controls
        ]
        lines.extend(["  reg IQ;", "", f"  always @({' or '.join(sensitivity)}) begin"])
        for index, control in enumerate(controls):
            keyword = "if" if index == 0 else "else if"
            lines.append(
                f"    {keyword} ({control.condition}) IQ <= {control.value};"
            )
        prefix = "else " if controls else ""
        lines.extend([f"    {prefix}IQ <= D;", "  end", ""])
        for output_pin, function in output_functions.items():
            lines.append(f"  assign {output_pin} = {function};")
    elif symbol_kind == "latch":
        raise ValueError(f"Latch simulation model is not implemented: {module_name}")
    else:
        for output_pin, function in output_functions.items():
            lines.append(f"  assign {output_pin} = {function};")

    lines.extend(["endmodule", ""])
    return CellModel(module_name, "\n".join(lines))


def generate_cell_models(dag: CircuitDAG) -> tuple[CellModel, ...]:
    """Return one functional model for every recovered standard-cell master."""

    models = [
        _generate_cell_model(module, kind, inputs, outputs)
        for module, (kind, inputs, outputs) in _cell_specs(dag).items()
    ]
    buffer_lines = [
        "// Structural boundary buffer used by the recovery generator.",
        f"module {STRUCTURAL_BUFFER} (",
        "    input wire A,",
        "    output wire X",
        ");",
        "  assign X = A;",
        "endmodule",
        "",
    ]
    models.append(CellModel(STRUCTURAL_BUFFER, "\n".join(buffer_lines)))
    return tuple(models)


def write_cell_models(
    models: Iterable[CellModel], output_directory: str | Path
) -> tuple[Path, ...]:
    """Write one Verilog source file per functional cell module."""

    directory = Path(output_directory)
    directory.mkdir(parents=True, exist_ok=True)
    paths: list[Path] = []
    for model in models:
        path = directory / f"{sanitize_identifier(model.module_name)}.v"
        path.write_text(model.text)
        paths.append(path)
    return tuple(paths)


def generate_output_logic_testbench() -> str:
    """Return a self-checking testbench for this puzzle's output decoder."""

    return """`timescale 1ns/1ps

module tb_recovered_output_logic_netlist;
  reg  [3:0] register_02;
  reg  [7:0] register_07;
  reg  [2:0] register_09;
  reg  [7:0] register_12;
  wire       net_806;
  wire       success;
  wire [7:0] O;
  integer i;
  integer errors;

  // Inferred missing connection in the physical output-index decoder.
  assign net_806 = ~register_02[3];

  recovered_output_logic dut (
      .net_806(net_806),
      .register_02(register_02),
      .register_07(register_07),
      .register_09(register_09),
      .register_12(register_12),
      .success(success),
      .O(O)
  );

  function [3:0] physical_index;
    input [3:0] logical_index;
    begin
      physical_index[3] = logical_index[3];
      physical_index[0] = logical_index[2];
      physical_index[2] = logical_index[1];
      physical_index[1] = logical_index[0];
    end
  endfunction

  function [7:0] register_12_state;
    input integer index;
    begin
      case (index)
         0: register_12_state = 8'h74;
         1: register_12_state = 8'hd1;
         2: register_12_state = 8'hcf;
         3: register_12_state = 8'hdd;
         4: register_12_state = 8'h14;
         5: register_12_state = 8'h39;
         6: register_12_state = 8'h3a;
         7: register_12_state = 8'hb5;
         8: register_12_state = 8'h72;
         9: register_12_state = 8'h21;
        10: register_12_state = 8'hd8;
        11: register_12_state = 8'h6b;
        12: register_12_state = 8'he9;
        13: register_12_state = 8'hdf;
        14: register_12_state = 8'hb1;
        default: register_12_state = 8'h27;
      endcase
    end
  endfunction

  function [7:0] expected_output;
    input integer index;
    begin
      case (index)
         0: expected_output = 8'h28;
         1: expected_output = 8'h2a;
         2: expected_output = 8'h20;
         3: expected_output = 8'h54;
         4: expected_output = 8'h57;
         5: expected_output = 8'h4f;
         6: expected_output = 8'h20;
         7: expected_output = 8'h53;
         8: expected_output = 8'h54;
         9: expected_output = 8'h41;
        10: expected_output = 8'h52;
        11: expected_output = 8'h53;
        12: expected_output = 8'h20;
        13: expected_output = 8'h2a;
        14: expected_output = 8'h29;
        default: expected_output = 8'h00;
      endcase
    end
  endfunction

  initial begin
    register_07 = 8'h46;
    register_09 = 3'b101;
    errors = 0;
    $dumpfile("./test_netlist/recovered_output_logic.vcd");
    $dumpvars(0, tb_recovered_output_logic_netlist);

    $write("Decoded text: \\\"");
    for (i = 0; i < 16; i = i + 1) begin
      register_02 = physical_index(i[3:0]);
      register_12 = register_12_state(i);
      #1;
      if (success !== 1'b1 || O !== expected_output(i)) begin
        $display("\\nERROR index=%0d success=%b expected=%02x actual=%02x",
                 i, success, expected_output(i), O);
        errors = errors + 1;
      end
      if (i < 15)
        $write("%c", O);
    end
    $display("\\\"");

    if (errors == 0)
      $display("PASS: structural output logic emitted '(* TWO STARS *)'");
    else
      $fatal(1, "FAIL: %0d output mismatch(es)", errors);
    $finish;
  end
endmodule
"""


def write_output_logic_testbench(output_path: str | Path) -> Path:
    path = Path(output_path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(generate_output_logic_testbench())
    return path
