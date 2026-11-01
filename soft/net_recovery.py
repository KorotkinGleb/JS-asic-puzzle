"""Create a self-contained artifact directory for one recovered net."""

from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path

from .context import find_named_nets
from .dag import CircuitDAG, write_trace_json
from .printing import write_trace_tree
from .registers import RegisterCatalog
from .verilog import GeneratedVerilog, generate_net_module, sanitize_identifier, write_verilog


@dataclass(frozen=True)
class NetRecoveryBundle:
    start_net: int
    directory: Path
    verilog_path: Path
    trace_json_path: Path
    tree_path: Path
    generated: GeneratedVerilog

    @property
    def paths(self) -> tuple[Path, ...]:
        return self.verilog_path, self.trace_json_path, self.tree_path


def net_artifact_directory_name(dag: CircuitDAG, start_net: int) -> str:
    """Return a unique readable directory name such as net_2380_success."""

    label = next(
        (item.name for item in find_named_nets(dag.context) if item.net == start_net),
        None,
    )
    if label is None:
        return f"net_{start_net}"
    return f"net_{start_net}_{sanitize_identifier(label)}"


def write_net_recovery_bundle(
    dag: CircuitDAG,
    catalog: RegisterCatalog,
    start_net: int,
    output_root: str | Path,
    *,
    module_name: str | None = None,
    output_name: str | None = None,
    max_tree_depth: int = 30,
) -> NetRecoveryBundle:
    """Generate Verilog, canonical JSON, and a CLI-style tree for one net."""

    generated = generate_net_module(
        dag,
        catalog,
        start_net,
        module_name=module_name,
        output_name=output_name,
    )
    directory = Path(output_root) / net_artifact_directory_name(dag, start_net)
    directory.mkdir(parents=True, exist_ok=True)
    verilog_path = write_verilog(
        generated, directory / f"{generated.module_name}.v"
    )
    trace_json_path = write_trace_json(generated.trace, directory / "trace.json")
    tree_path = write_trace_tree(
        dag,
        generated.trace,
        directory / "tree.txt",
        catalog,
        max_depth=max_tree_depth,
    )
    return NetRecoveryBundle(
        start_net=start_net,
        directory=directory,
        verilog_path=verilog_path,
        trace_json_path=trace_json_path,
        tree_path=tree_path,
        generated=generated,
    )

