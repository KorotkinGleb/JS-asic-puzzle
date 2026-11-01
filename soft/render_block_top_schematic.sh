#!/bin/sh
set -eu

script_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
project_dir=$(dirname -- "$script_dir")
cd "$project_dir"

output_dir="soft/output/schematics"
mkdir -p "$output_dir"

# Exact hierarchical schematic, including shared input/control nets.
yosys -Q -s soft/render_block_top_schematic.ys

# Readable state-dataflow version.  It contains the same module instances and
# internal state buses but suppresses I/clk/enable/rst_n/net_806 fanout.
awk -f soft/filter_yosys_control_wires.awk \
    "$output_dir/recovered_block_top.dot" \
    > "$output_dir/recovered_block_top_dataflow.dot"

dot -Tsvg \
    "$output_dir/recovered_block_top_dataflow.dot" \
    -o "$output_dir/recovered_block_top_dataflow.svg"
dot -Tpng \
    "$output_dir/recovered_block_top_dataflow.dot" \
    -o "$output_dir/recovered_block_top_dataflow.png"

printf '%s\n' \
    "Generated full and dataflow schematics in $output_dir"
