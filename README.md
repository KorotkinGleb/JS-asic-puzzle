# ASIC Reverse-Engineering Puzzle

This repository provides the files for the Jane Street ASIC reverse-engineering puzzle! See the [blog post](https://blog.janestreet.com/can-you-reverse-engineer-an-asic/) for more details.

## Introduction

This is my solution of asic-puzzle by Jane Street. The solution was among favorite solutions, also there was a lot of help from my friend https://github.com/electron-svin . 
## Solution toolkit

The Python code recovers a digital circuit from its SKY130 layout: it extracts
standard cells and their connections, groups flip-flops into candidate registers,
and generates Verilog for analysis and simulation. Backward traces follow
combinational logic to register outputs or top-level inputs; merging the traces
of a register's D inputs recovers its update logic. Register grouping is heuristic
because the original RTL names and hierarchy are lost during synthesis.

```text
GDS + SKY130 PDK → cells and nets → combinational DAGs → register groups → Verilog
```

Start with the [solution write-up](short_solution_description.pdf) for the puzzle
explanation, or the [tool guide](soft/README.md) for commands and the Python API.

### Repository navigation

| Location | Contents |
| --- | --- |
| [soft/](soft/) | Main framework and CLI (`python3 -m soft`). |
| [scripts/](scripts/) | Physical extraction and register-analysis helpers used by `soft`, plus exploratory scripts and the [notebook](scripts/puzzle.ipynb). |
| [soft/output/](soft/output/) | Recovered RTL, JSON cell/register catalogs, and per-net traces with readable `tree.txt` files. |
| [soft/output/registers/](soft/output/registers/) | Individual register modules, wired together by [recovered_block_top.v](soft/output/recovered_block_top.v). |
| [soft/output_netlist/](soft/output_netlist/) | Structural Verilog using cell instances, with standalone functional models in `cells/`. |
| [soft/tests/](soft/tests/) and [soft/test_netlist/](soft/test_netlist/) | Python checks and Verilog testbenches for the recovered RTL and structural netlist. |
| [warmup/](warmup/) | Small reference design with source RTL, netlists, DEF, and GDS. |

Core modules: [context.py](soft/context.py) loads extracted cells,
[dag.py](soft/dag.py) handles connectivity and backtracing,
[registers.py](soft/registers.py) builds the register catalog,
[verilog.py](soft/verilog.py) and [netlist.py](soft/netlist.py) generate Verilog,
and [printing.py](soft/printing.py) formats traces and reports.

### Schematics

- [High-level overview](scripts/puzzle_schematic.svg): annotated input, shift-register, control, and output blocks.
- [Register dataflow](soft/output/schematics/recovered_block_top_dataflow.svg): recovered modules and state buses, with shared control wires hidden for readability.
- [Full block schematic](soft/output/schematics/recovered_block_top.svg): all top-level connections, including clock, reset, and enable.

Regenerate the block schematics with `sh soft/render_block_top_schematic.sh`
(requires Yosys and Graphviz).

### Regenerate and test

With the Python `klayout` package and SKY130A PDK installed, run from the
repository root:

```sh
python3 -m soft all puzzle.gds --pdk-root /path/to/sky130A --output-dir soft/output
```

The generated RTL can be simulated without the PDK using Icarus Verilog:

```sh
iverilog -g2012 -s tb_recovered_top -o soft/output/solution.vvp \
  soft/output/recovered_top.v soft/tests/tb_recovered_top.v
vvp soft/output/solution.vvp
```

The testbench replays a valid 121-bit input and checks that `success` goes high
and the output spells `(* TWO STARS *)`. See [soft/README.md](soft/README.md) for
focused net traces, structural-netlist generation, and additional tests.

### Puzzle GDS

The puzzle GDS is in this repository, in the file named `puzzle.gds`. You can preview it using [KLayout](https://www.klayout.de/) or the [TinyTapeout Online GDS Viewer](https://gds-viewer.tinytapeout.com/).

See `example_inputs.vcd` which shows some inputs being fed to the design (unfortunately, not the correct inputs to make `success` go high!). You can view it using [Surfer](https://surfer-project.org/) or a similar tool.

To help you get started, below is an image with some hints. The region labelled as "output generator" is safe to ignore during your initial reverse-engineering steps, but you'll need to simulate it to get your final answer!

![](layout.png)

### Warm-up Puzzle

To familiarize yourself with the flow and help develop your tools, we've put together a small example design and run it through a very similar flow to the one used for the real thing! The example design consists of two shift registers, an adder, and a comparator, outputting success if `A + B == 496`.

You'll find the following files related to the warm-up puzzle:

- `warmup/00_source.v`: The original Verilog source code of the example design
- `warmup/01_netlist.v`: Synthesized netlist comprising of a list of standard cells
  and connections
- `warmup/02_netlist_with_power_rails.v`: Netlist with VDD and GND rails added
- `warmup/03_post_place_and_route.def`: Physical layout of cells and routing
  connections, corresponding to cell and net names.
- `warmup/04_final.gds`: The final manufacturable layout file, with many internal names
  removed
