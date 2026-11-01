"""Load the GDS recovery context and expose named top-level nets."""

from __future__ import annotations

from dataclasses import asdict, dataclass
import json
import os
from pathlib import Path
from typing import Iterable

from scripts import klayoutexmp as extractor_config
from scripts.recover_schematic_elements import (
    LABEL_CONDUCTORS,
    LABEL_DATATYPE,
    POWER_PIN_NAMES,
    RecoveryContext,
    SchematicElement,
    build_driver_index,
    build_load_index,
    recover_schematic,
)


@dataclass(frozen=True)
class NamedNet:
    """One text-labeled top-level net found on a conducting GDS layer."""

    name: str
    net: int
    conductor: str
    x: int
    y: int
    direction: str


def configure_pdk(pdk_root: str | Path | None = None) -> Path:
    """Configure the SKY130A root used by the existing physical extractor.

    Priority is an explicit path, then ``PDK_ROOT``, then the path already
    configured by ``scripts.klayoutexmp``.  ``PDK_ROOT`` may point either to
    the ``sky130A`` directory itself or its parent.
    """

    requested = pdk_root or os.environ.get("PDK_ROOT") or extractor_config.PDK_PATH
    root = Path(requested).expanduser().resolve()
    if not (root / "libs.ref").is_dir() and (root / "sky130A" / "libs.ref").is_dir():
        root = root / "sky130A"
    reference_gds = (
        root / "libs.ref" / "sky130_fd_sc_hd" / "gds" / "sky130_fd_sc_hd.gds"
    )
    liberty = (
        root
        / "libs.ref"
        / "sky130_fd_sc_hd"
        / "lib"
        / "sky130_fd_sc_hd__tt_025C_1v80.lib"
    )
    if not reference_gds.is_file() or not liberty.is_file():
        raise FileNotFoundError(
            f"SKY130A PDK is incomplete at {root}; expected {reference_gds} and {liberty}"
        )
    extractor_config.PDK_PATH = root
    extractor_config.REFERENCE_GDS = reference_gds
    extractor_config.LIBERTY_PATH = liberty
    return root


def load_context(
    gds_path: str | Path,
    *,
    pdk_root: str | Path | None = None,
) -> RecoveryContext:
    """Read a GDS and return the extracted logical recovery context."""

    configure_pdk(pdk_root)
    return recover_schematic(Path(gds_path).expanduser().resolve())


def find_named_nets(
    context: RecoveryContext,
    *,
    include_power: bool = False,
) -> list[NamedNet]:
    """Return every top-level text label attached to an extracted net.

    Direction is inferred from standard-cell connectivity.  A label on a net
    with loads but no standard-cell driver is an input; a driven net is an
    output.  Power labels are omitted by default.
    """

    loads = build_load_index(context.elements)
    drivers = build_driver_index(context.elements)
    found: dict[tuple[str, int], NamedNet] = {}

    for gds_layer, conductor in LABEL_CONDUCTORS.items():
        label_layer = context.layout.layer(gds_layer, LABEL_DATATYPE)
        conductor_region = context.l2n.polygons_by_name(conductor)
        for shape in context.top.shapes(label_layer).each():
            if not shape.is_text():
                continue
            text = shape.text
            name = text.string
            if not include_power and name in POWER_PIN_NAMES:
                continue
            point = text.trans.disp
            extracted_net = context.l2n.probe_net(conductor_region, point)
            if extracted_net is None:
                continue
            net = extracted_net.cluster_id
            if net in drivers:
                direction = "output"
            elif net in loads:
                direction = "input"
            else:
                direction = "label"
            found[(name, net)] = NamedNet(
                name=name,
                net=net,
                conductor=conductor,
                x=point.x,
                y=point.y,
                direction=direction,
            )

    return sorted(found.values(), key=lambda item: (item.name, item.net))


def named_net_maps(
    named_nets: Iterable[NamedNet],
) -> tuple[dict[int, str], dict[str, int]]:
    """Build net-to-name and name-to-net maps from top labels."""

    by_net: dict[int, str] = {}
    by_name: dict[str, int] = {}
    for item in named_nets:
        by_net.setdefault(item.net, item.name)
        by_name[item.name] = item.net
    return by_net, by_name


def element_to_dict(element: SchematicElement) -> dict:
    bbox = element.bbox
    transform = element.transform
    return {
        "instance_id": element.instance_id,
        "module": element.module,
        "symbol_kind": element.symbol_kind,
        "transform": str(transform),
        "bbox": {
            "left": bbox.left,
            "bottom": bbox.bottom,
            "right": bbox.right,
            "top": bbox.top,
        },
        "input_pins": element.input_pins,
        "output_pins": element.output_pins,
        "output_functions": element.output_functions,
    }


def context_to_dict(context: RecoveryContext) -> dict:
    named = find_named_nets(context)
    return {
        "schema_version": 1,
        "gds_top": context.top.name,
        "database_unit_um": context.layout.dbu,
        "element_count": len(context.elements),
        "named_nets": [asdict(item) for item in named],
        "elements": [
            element_to_dict(element)
            for element in sorted(context.elements, key=lambda item: item.instance_id)
        ],
    }


def write_context_json(context: RecoveryContext, output_path: str | Path) -> Path:
    path = Path(output_path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(context_to_dict(context), indent=2) + "\n")
    return path
