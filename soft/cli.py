"""Command-line entry point for the complete GDS reversing workflow."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from .context import (
    context_to_dict,
    find_named_nets,
    load_context,
    write_context_json,
)
from .dag import CircuitDAG, write_dag_json, write_trace_json
from .net_recovery import net_artifact_directory_name, write_net_recovery_bundle
from .netlist import (
    generate_cell_models,
    generate_structural_block_design,
    generate_structural_complete_top,
    generate_structural_net_module,
    write_cell_models,
    write_output_logic_testbench,
)
from .printing import (
    print_context_summary,
    print_dag_summary,
    print_register_catalog,
    print_trace_levels,
    print_trace_summary,
    print_verilog_summary,
    print_written_files,
    write_trace_tree,
)
from .registers import (
    RegisterCatalog,
    discover_registers,
    load_register_catalog,
    write_register_json,
)
from .verilog import (
    generate_block_design,
    generate_complete_top,
    generate_register_module,
    write_verilog,
)


PROJECT_ROOT = Path(__file__).resolve().parent.parent
DEFAULT_GDS = PROJECT_ROOT / "puzzle.gds"
DEFAULT_OUTPUT = Path(__file__).resolve().parent / "output"
DEFAULT_NETLIST_OUTPUT = Path(__file__).resolve().parent / "output_netlist"
DEFAULT_NETLIST_TEST = Path(__file__).resolve().parent / "test_netlist"


def _add_gds(parser: argparse.ArgumentParser) -> None:
    parser.add_argument("gds", nargs="?", type=Path, default=DEFAULT_GDS)
    parser.add_argument(
        "--pdk-root",
        type=Path,
        help="sky130A directory (otherwise use PDK_ROOT or extractor default)",
    )


def _catalog(context, path: Path | None) -> RegisterCatalog:
    return load_register_catalog(path) if path else discover_registers(context)


def _resolve_net(value: str, context) -> int:
    try:
        return int(value.removeprefix("net_"))
    except ValueError:
        matches = [item.net for item in find_named_nets(context) if item.name == value]
        if not matches:
            raise ValueError(f"No top label or integer net matches {value!r}")
        if len(set(matches)) > 1:
            raise ValueError(f"Top label {value!r} refers to multiple nets: {matches}")
        return matches[0]


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        prog="python -m soft",
        description="Recover a register-level Verilog model from a SKY130 GDS",
    )
    subparsers = parser.add_subparsers(dest="command", required=True)

    extract = subparsers.add_parser("extract", help="extract context and build DAG")
    _add_gds(extract)
    extract.add_argument("--output", type=Path, default=DEFAULT_OUTPUT / "context.json")
    extract.add_argument("--dag-output", type=Path, default=DEFAULT_OUTPUT / "dag.json")

    registers = subparsers.add_parser("registers", help="discover register vectors")
    _add_gds(registers)
    registers.add_argument("--output", type=Path, default=DEFAULT_OUTPUT / "registers.json")
    registers.add_argument("--bits", action="store_true", help="print every physical bit")

    trace = subparsers.add_parser("trace", help="backtrace one net and write Verilog")
    trace.add_argument("net", help="integer/net_N or native label such as success")
    _add_gds(trace)
    trace.add_argument("--registers", type=Path)
    trace.add_argument(
        "--output-dir",
        type=Path,
        default=DEFAULT_OUTPUT / "net_traces",
        help="root directory; each net gets its own subdirectory",
    )
    trace.add_argument("--module")
    trace.add_argument("--output-name")
    trace.add_argument(
        "--tree",
        action="store_true",
        help="deprecated: tree.txt is now always generated and never printed",
    )
    trace.add_argument("--max-tree-depth", type=int, default=30)
    trace.add_argument("--levels", action="store_true")

    register = subparsers.add_parser(
        "register-verilog", help="merge every D cone for one register"
    )
    register.add_argument("register", help="shift_register, register_10, or 10")
    _add_gds(register)
    register.add_argument("--registers", type=Path)
    register.add_argument("--output", type=Path)
    register.add_argument("--module")

    top = subparsers.add_parser("top", help="generate complete recovered top RTL")
    _add_gds(top)
    top.add_argument("--registers", type=Path)
    top.add_argument("--output", type=Path, default=DEFAULT_OUTPUT / "recovered_top.v")
    top.add_argument("--module", default="recovered_top")
    top.add_argument("--hide-registers", action="store_true")

    block_top = subparsers.add_parser(
        "block-top", help="generate a top wired from recovered register modules"
    )
    _add_gds(block_top)
    block_top.add_argument("--registers", type=Path)
    block_top.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT)
    block_top.add_argument("--module", default="recovered_block_top")
    block_top.add_argument("--output-module", default="recovered_output_logic")

    all_command = subparsers.add_parser("all", help="run the complete recovery pipeline")
    _add_gds(all_command)
    all_command.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT)
    all_command.add_argument(
        "--trace-net", default="success", help="also generate a focused trace module"
    )

    netlist_all = subparsers.add_parser(
        "netlist-all",
        help="generate wires/cell-instance netlists and functional cell models",
    )
    _add_gds(netlist_all)
    netlist_all.add_argument("--output-dir", type=Path, default=DEFAULT_NETLIST_OUTPUT)
    netlist_all.add_argument("--test-dir", type=Path, default=DEFAULT_NETLIST_TEST)
    netlist_all.add_argument(
        "--trace-net", default="success", help="also generate a structural trace"
    )
    return parser


def _command_extract(args) -> None:
    context = load_context(args.gds, pdk_root=args.pdk_root)
    dag = CircuitDAG(context)
    path = write_context_json(context, args.output)
    dag_path = write_dag_json(dag, args.dag_output)
    print_context_summary(dag)
    print_dag_summary(dag)
    print_written_files((path, dag_path))


def _command_registers(args) -> None:
    context = load_context(args.gds, pdk_root=args.pdk_root)
    path, catalog = write_register_json(context, args.output)
    print_register_catalog(catalog, show_bits=args.bits)
    print_written_files((path,))


def _command_trace(args) -> None:
    context = load_context(args.gds, pdk_root=args.pdk_root)
    dag = CircuitDAG(context)
    catalog = _catalog(context, args.registers)
    net = _resolve_net(args.net, context)
    bundle = write_net_recovery_bundle(
        dag,
        catalog,
        net,
        args.output_dir,
        module_name=args.module,
        output_name=args.output_name,
        max_tree_depth=args.max_tree_depth,
    )
    print_trace_summary(bundle.generated.trace)
    if args.levels:
        print_trace_levels(dag, bundle.generated.trace, catalog)
    print_verilog_summary(bundle.generated, bundle.verilog_path)
    print_written_files(bundle.paths)


def _register_key(value: str) -> str | int:
    return int(value) if value.isdigit() else value


def _command_register_verilog(args) -> None:
    context = load_context(args.gds, pdk_root=args.pdk_root)
    dag = CircuitDAG(context)
    catalog = _catalog(context, args.registers)
    generated = generate_register_module(
        dag,
        catalog,
        _register_key(args.register),
        module_name=args.module,
    )
    output = args.output or DEFAULT_OUTPUT / "registers" / f"{generated.module_name}.v"
    path = write_verilog(generated, output)
    print_trace_summary(generated.trace)
    print_verilog_summary(generated, path)


def _command_top(args) -> None:
    context = load_context(args.gds, pdk_root=args.pdk_root)
    dag = CircuitDAG(context)
    catalog = _catalog(context, args.registers)
    generated = generate_complete_top(
        dag,
        catalog,
        module_name=args.module,
        expose_registers=not args.hide_registers,
    )
    path = write_verilog(generated, args.output)
    print_verilog_summary(generated, path)


def _command_block_top(args) -> None:
    context = load_context(args.gds, pdk_root=args.pdk_root)
    dag = CircuitDAG(context)
    catalog = _catalog(context, args.registers)
    design = generate_block_design(
        dag,
        catalog,
        top_module_name=args.module,
        output_module_name=args.output_module,
    )
    written: list[Path] = []
    for generated in design.register_modules:
        written.append(
            write_verilog(
                generated,
                args.output_dir / "registers" / f"{generated.module_name}.v",
            )
        )
    written.append(
        write_verilog(
            design.output_logic,
            args.output_dir / f"{design.output_logic.module_name}.v",
        )
    )
    top_path = write_verilog(
        design.top, args.output_dir / f"{design.top.module_name}.v"
    )
    written.append(top_path)
    print_verilog_summary(design.top, top_path)
    print_written_files(written)


def _command_all(args) -> None:
    output_dir: Path = args.output_dir
    context = load_context(args.gds, pdk_root=args.pdk_root)
    dag = CircuitDAG(context)
    context_path = write_context_json(context, output_dir / "context.json")
    dag_path = write_dag_json(dag, output_dir / "dag.json")
    register_path, catalog = write_register_json(context, output_dir / "registers.json")
    written = [context_path, dag_path, register_path]

    trace_net = _resolve_net(args.trace_net, context)
    trace_bundle = write_net_recovery_bundle(
        dag,
        catalog,
        trace_net,
        output_dir / "net_traces",
    )
    written.extend(trace_bundle.paths)

    register_manifests: list[dict] = []
    for register in catalog.registers:
        generated = generate_register_module(dag, catalog, register.name)
        path = write_verilog(
            generated, output_dir / "registers" / f"{generated.module_name}.v"
        )
        written.append(path)
        register_manifests.append(
            {
                "register": register.name,
                "module": generated.module_name,
                "path": str(path),
                "inputs": list(generated.input_ports),
                "combinational_cells": generated.combinational_cell_count,
            }
        )

    top = generate_complete_top(dag, catalog)
    top_path = write_verilog(top, output_dir / "recovered_top.v")
    written.append(top_path)
    block_design = generate_block_design(dag, catalog)
    output_logic_path = write_verilog(
        block_design.output_logic, output_dir / "recovered_output_logic.v"
    )
    block_top_path = write_verilog(
        block_design.top, output_dir / "recovered_block_top.v"
    )
    written.extend((output_logic_path, block_top_path))
    manifest_path = output_dir / "manifest.json"
    manifest_path.parent.mkdir(parents=True, exist_ok=True)
    manifest_path.write_text(
        json.dumps(
            {
                "schema_version": 1,
                "gds": str(Path(args.gds).resolve()),
                "gds_top": context.top.name,
                "context": str(context_path),
                "dag": str(dag_path),
                "register_catalog": str(register_path),
                "focused_trace": {
                    "net": trace_net,
                    "module": trace_bundle.generated.module_name,
                    "directory": str(trace_bundle.directory),
                    "path": str(trace_bundle.verilog_path),
                    "trace_json": str(trace_bundle.trace_json_path),
                    "tree": str(trace_bundle.tree_path),
                },
                "register_modules": register_manifests,
                "top": {"module": top.module_name, "path": str(top_path)},
                "block_top": {
                    "module": block_design.top.module_name,
                    "path": str(block_top_path),
                    "output_logic": str(output_logic_path),
                    "register_module_directory": str(output_dir / "registers"),
                },
            },
            indent=2,
        )
        + "\n"
    )
    written.append(manifest_path)

    print_context_summary(dag)
    print_register_catalog(catalog)
    print_verilog_summary(top, top_path)
    print_written_files(written)


def _command_netlist_all(args) -> None:
    """Write the complete structural backend and its output-decoder test."""

    output_dir: Path = args.output_dir
    test_dir: Path = args.test_dir
    context = load_context(args.gds, pdk_root=args.pdk_root)
    dag = CircuitDAG(context)
    context_path = write_context_json(context, output_dir / "context.json")
    dag_path = write_dag_json(dag, output_dir / "dag.json")
    register_path, catalog = write_register_json(
        context, output_dir / "registers.json"
    )
    written: list[Path] = [context_path, dag_path, register_path]

    trace_net = _resolve_net(args.trace_net, context)
    trace_generated = generate_structural_net_module(dag, catalog, trace_net)
    trace_directory = (
        output_dir
        / "net_traces"
        / net_artifact_directory_name(dag, trace_net)
    )
    trace_verilog_path = write_verilog(
        trace_generated,
        trace_directory / f"{trace_generated.module_name}.v",
    )
    trace_json_path = write_trace_json(
        trace_generated.trace, trace_directory / "trace.json"
    )
    trace_tree_path = write_trace_tree(
        dag,
        trace_generated.trace,
        trace_directory / "tree.txt",
        catalog,
    )
    written.extend((trace_verilog_path, trace_json_path, trace_tree_path))

    design = generate_structural_block_design(dag, catalog)
    register_manifests: list[dict] = []
    for generated in design.register_modules:
        path = write_verilog(
            generated,
            output_dir / "registers" / f"{generated.module_name}.v",
        )
        written.append(path)
        register_manifests.append(
            {
                "register": generated.registers[0],
                "module": generated.module_name,
                "path": str(path),
                "inputs": list(generated.input_ports),
                "combinational_cells": generated.combinational_cell_count,
            }
        )

    output_logic_path = write_verilog(
        design.output_logic, output_dir / "recovered_output_logic.v"
    )
    block_top_path = write_verilog(
        design.top, output_dir / "recovered_block_top.v"
    )
    flat_top = generate_structural_complete_top(dag, catalog)
    flat_top_path = write_verilog(flat_top, output_dir / "recovered_top.v")
    written.extend((output_logic_path, block_top_path, flat_top_path))

    cell_paths = write_cell_models(
        generate_cell_models(dag), output_dir / "cells"
    )
    written.extend(cell_paths)

    testbench_path = write_output_logic_testbench(
        test_dir / "tb_recovered_output_logic.v"
    )
    written.append(testbench_path)

    manifest_path = output_dir / "manifest.json"
    manifest_path.write_text(
        json.dumps(
            {
                "schema_version": 1,
                "backend": "structural-standard-cell-netlist",
                "gds": str(Path(args.gds).resolve()),
                "gds_top": context.top.name,
                "context": str(context_path),
                "dag": str(dag_path),
                "register_catalog": str(register_path),
                "cell_model_directory": str(output_dir / "cells"),
                "cell_model_count": len(cell_paths),
                "register_modules": register_manifests,
                "top": {"module": flat_top.module_name, "path": str(flat_top_path)},
                "block_top": {
                    "module": design.top.module_name,
                    "path": str(block_top_path),
                    "output_logic": str(output_logic_path),
                    "register_module_directory": str(output_dir / "registers"),
                },
                "focused_trace": {
                    "net": trace_net,
                    "module": trace_generated.module_name,
                    "path": str(trace_verilog_path),
                    "trace_json": str(trace_json_path),
                    "tree": str(trace_tree_path),
                },
                "output_logic_testbench": str(testbench_path),
            },
            indent=2,
        )
        + "\n"
    )
    written.append(manifest_path)

    print_context_summary(dag)
    print_register_catalog(catalog)
    print_verilog_summary(flat_top, flat_top_path)
    print_written_files(written)


def main(argv: list[str] | None = None) -> None:
    parser = build_parser()
    args = parser.parse_args(argv)
    commands = {
        "extract": _command_extract,
        "registers": _command_registers,
        "trace": _command_trace,
        "register-verilog": _command_register_verilog,
        "top": _command_top,
        "block-top": _command_block_top,
        "all": _command_all,
        "netlist-all": _command_netlist_all,
    }
    try:
        commands[args.command](args)
    except (FileNotFoundError, KeyError, ValueError) as error:
        parser.error(str(error))
