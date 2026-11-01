# GDS reversing pipeline

`soft` turns the SKY130 standard-cell layout in `puzzle.gds` into a reusable
net/cell DAG, a register catalog, focused backward traces, stateful register
modules, and a complete PDK-free Verilog model.

The connectivity recovered from GDS geometry and Liberty pin functions is
structural. Register *membership* is partly heuristic because synthesis removes
the original RTL hierarchy and bus names. The exact 12-bit MUX+DFF shift chain
is marked verified; other vector groups carry confidence and evidence in JSON.

## Run the complete pipeline

From the repository root:

```sh
.venv/bin/python -m soft all puzzle.gds --output-dir soft/output
```

If the PDK is not in the extractor's current default location, either pass it
directly or set `PDK_ROOT`:

```sh
.venv/bin/python -m soft all puzzle.gds \
  --pdk-root /path/to/sky130A \
  --output-dir soft/output
```

The result contains:

- `context.json`: every recognized logical cell, its pins, nets, placement,
  and native top labels;
- `dag.json`: canonical combinational pin edges plus explicit sequential cells;
- `registers.json`: all register vectors and every bit's instance, Q, D,
  normalized clock root, clock path, and asynchronous controls;
- `net_traces/net_<id>_<label>/`: one directory per requested net containing
  recovered Verilog, `trace.json`, and a readable `tree.txt`;
- `registers/recovered_*.v`: one merged stateful module per register;
- `recovered_top.v`: all recovered state and output logic in one module;
- `recovered_block_top.v`: a small hierarchical top wired from the recovered
  register modules;
- `recovered_output_logic.v`: native `O`/`success` decoding used by the block
  top;
- `manifest.json`: paths and module metadata.

All generated RTL uses Boolean `assign` expressions and ordinary `always`
blocks. It contains no SKY130 instances and no Verilog includes. Native top
names such as `I`, `enable`, `clk`, `rst_n`, `success`, and `O[7:0]` are kept.

## Structural netlist backend

Generate a second representation made from wires and standard-cell module
instances:

```sh
.venv/bin/python -m soft netlist-all puzzle.gds \
  --output-dir soft/output_netlist \
  --test-dir soft/test_netlist
```

This writes:

- `output_netlist/recovered_top.v`: flat structural top;
- `output_netlist/recovered_block_top.v`: hierarchical structural top;
- `output_netlist/recovered_output_logic.v`: structural output decoder;
- `output_netlist/registers/*.v`: structural register blocks;
- `output_netlist/cells/*.v`: one PDK-free functional model per SKY130 master;
- `output_netlist/net_traces/`: structural focused traces with JSON and trees;
- `test_netlist/tb_recovered_output_logic.v`: self-checking output-decoder test.

The recovered design files contain no behavioral `assign` or `always` logic;
they contain ports, wires, and module instances. `assign` and `always` appear
only inside `cells/*.v`, where they define the behavior of reusable gates and
flip-flops for simulation.

Run the output-decoder test from `soft/`:

```sh
iverilog -g2012 \
  -o test_netlist/tb_recovered_output_logic.out \
  test_netlist/tb_recovered_output_logic.v \
  output_netlist/recovered_output_logic.v \
  output_netlist/cells/*.v
vvp test_netlist/tb_recovered_output_logic.out
```

Expected result:

```text
Decoded text: "(* TWO STARS *)"
PASS: structural output logic emitted '(* TWO STARS *)'
```

## Focused commands

```sh
# Save context.json and dag.json.
.venv/bin/python -m soft extract puzzle.gds

# Discover registers and write registers.json.
.venv/bin/python -m soft registers puzzle.gds --bits

# Trace a label or numeric net. Verilog, JSON, and tree.txt are written into a
# dedicated directory; the tree is not dumped into the shell.
.venv/bin/python -m soft trace success puzzle.gds
.venv/bin/python -m soft trace 1131 puzzle.gds --levels

# Merge the D cones of all bits in one register and add its always blocks.
.venv/bin/python -m soft register-verilog register_10 puzzle.gds

# Generate only the complete top. Registers are exposed as debug outputs.
.venv/bin/python -m soft top puzzle.gds

# Generate a modular top, output decoder, and all register block files.
.venv/bin/python -m soft block-top puzzle.gds --output-dir soft/output
```

Use `--registers soft/output/registers.json` with `trace`, `register-verilog`, or
`top` to reuse an existing catalog instead of discovering groups again.

## Python/notebook API

```python
from soft.context import load_context
from soft.dag import CircuitDAG
from soft.printing import print_net_trace, print_register_catalog
from soft.registers import discover_registers
from soft.netlist import (
    generate_cell_models,
    generate_structural_block_design,
    generate_structural_complete_top,
    generate_structural_output_logic_module,
    generate_structural_register_module,
    write_cell_models,
)
from soft.verilog import (
    generate_combined_net_module,
    generate_block_design,
    generate_net_module,
    generate_register_module,
    generate_complete_top,
    write_verilog,
)

context = load_context("puzzle.gds")
dag = CircuitDAG(context)
registers = discover_registers(context)

# Direct connectivity queries.
dag.driver_cells(1131)
dag.load_cells(1131)
dag.fanin_nets(1131)
dag.fanout_nets(1131)

# A branch stops at a FF/latch Q, a constant, or a pure input.
trace = dag.backtrace(1131)
print_net_trace(dag, 1131, registers, view="tree")

# One or several arbitrary net cones.
success = generate_net_module(dag, registers, 2380)
combined = generate_combined_net_module(
    dag,
    registers,
    {"condition_a": 1131, "condition_b": 2543},
    module_name="recovered_conditions",
)

# One full register and the whole recovered circuit.
register_10 = generate_register_module(dag, registers, "register_10")
top = generate_complete_top(dag, registers)
block_design = generate_block_design(dag, registers)
write_verilog(top, "soft/output/recovered_top.v")

# Structural alternative: cell instances in the design, functional models in
# separate files.
netlist_top = generate_structural_complete_top(dag, registers)
netlist_blocks = generate_structural_block_design(dag, registers)
cell_models = generate_cell_models(dag)
write_verilog(netlist_top, "soft/output_netlist/recovered_top.v")
write_cell_models(cell_models, "soft/output_netlist/cells")
```

`TraceCone.edges` is the canonical DAG representation. `cell_levels` and
`sequential_levels` are only presentation metadata; shared logic appears once
in `edges`, even when it is reached by many paths. `dag.topological_cells(trace)`
returns combinational cells in source-to-destination order.

## Current extraction facts and limitations

- This GDS produces 728 logical standard-cell elements and 92 flip-flops.
- The catalog currently contains 15 vector candidates plus two certain
  singleton FF registers, for 17 state objects total.
- `success` is directly `register_09[2]` (`net_2380`), so its focused trace has
  no combinational gates. Backtrace the D net of that bit to recover the logic
  deciding its next value.
- `net_806` has two loads but no recognized driver or top label in this GDS. It
  is deliberately exposed as an unlabeled input in the complete top. Guessing
  that it is 0, 1, or another signal would silently invent circuit behavior.
- The generated model is a structural recovery, not proof of original source
  variable names or hierarchy. Validate behavior with simulation, SAT, or
  bounded model checking before treating semantic interpretations as proven.

## Verification

Compile all generated modules independently:

```sh
for f in soft/output/net_traces/*/*.v \
         soft/output/registers/*.v \
         soft/output/recovered_top.v; do
  iverilog -g2012 -tnull "$f" || exit 1
done
```

Run the smoke test:

```sh
PYTHONPYCACHEPREFIX=/tmp/asic_puzzle_soft_pycache \
  .venv/bin/python -m unittest soft.tests.test_pipeline
```

## Render the recovered block schematic

Yosys can preserve the recovered module hierarchy and pass its graph to
Graphviz:

```sh
sh soft/render_block_top_schematic.sh
```

This writes two SVG/PNG pairs under `soft/output/schematics/`:

- `recovered_block_top.*` is the exact top-level schematic, including the
  high-fanout `I`, `clk`, `enable`, `rst_n`, and `net_806` wires;
- `recovered_block_top_dataflow.*` keeps all recovered register modules and
  state-bus connections but hides those repeated global-input wires.

The SVG is preferable for inspection because it remains sharp while zooming.
Do not add `flatten` to the Yosys script unless a gate-level drawing is wanted;
flattening these recovered modules produces a much larger schematic.

Replay the satisfying serial stream against the generated complete top:

```sh
iverilog -g2012 -o soft/output/recovered_top_test.out \
  soft/output/recovered_top.v soft/tests/tb_recovered_top.v
vvp soft/output/recovered_top_test.out
```

Compile and replay the same test against the modular block top:

```sh
iverilog -g2012 -DDUT_MODULE=recovered_block_top \
  -o soft/output/recovered_block_top_test.out \
  soft/output/recovered_block_top.v \
  soft/output/recovered_output_logic.v \
  soft/output/registers/*.v \
  soft/tests/tb_recovered_top.v
vvp soft/output/recovered_block_top_test.out
```

Replay the full satisfying stream against the flat structural top:

```sh
iverilog -g2012 -o soft/test_netlist/recovered_top.out \
  soft/output_netlist/recovered_top.v \
  soft/output_netlist/cells/*.v \
  soft/tests/tb_recovered_top.v
vvp soft/test_netlist/recovered_top.out
```
