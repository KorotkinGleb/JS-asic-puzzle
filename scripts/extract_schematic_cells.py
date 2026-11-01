"""Extract schematic-level SKY130 standard-cell instances from a GDS file.

This task intentionally excludes physical-only cells such as fillers, taps,
decaps, and end caps. Connectivity is recovered from the GDS conductor stack,
while the installed PDK Liberty file decides which masters are functional.
"""

from __future__ import annotations

import argparse
from collections import Counter
from pathlib import Path

import klayout.db as kdb

try:
    # Import style used by: from scripts.extract_schematic_cells import ...
    from .klayoutexmp import (
        GDS_PATH,
        LIBERTY_PATH,
        REFERENCE_GDS,
        RecognizedCell,
        extract_conductor_nets,
        load_liberty_logic,
        load_pdk_cell_names,
        recognize_schematic_cells,
    )
except ImportError:
    # Import style used when this file is executed directly.
    from klayoutexmp import (
        GDS_PATH,
        LIBERTY_PATH,
        REFERENCE_GDS,
        RecognizedCell,
        extract_conductor_nets,
        load_liberty_logic,
        load_pdk_cell_names,
        recognize_schematic_cells,
    )


def extract_schematic_cells(
    gds_path: Path = GDS_PATH,
) -> tuple[kdb.Layout, list[RecognizedCell]]:
    """Read GDS and return its layout plus functional placed-cell instances."""
    if not gds_path.is_file():
        raise FileNotFoundError(f"GDS not found: {gds_path}")
    if not REFERENCE_GDS.is_file():
        raise FileNotFoundError(f"PDK reference GDS not found: {REFERENCE_GDS}")
    if not LIBERTY_PATH.is_file():
        raise FileNotFoundError(f"PDK Liberty file not found: {LIBERTY_PATH}")

    layout = kdb.Layout()
    layout.read(str(gds_path))
    top = layout.top_cell()

    pdk_cell_names = load_pdk_cell_names()
    logic = load_liberty_logic(pdk_cell_names)
    extracted_nets = extract_conductor_nets(layout, top)
    recognized = recognize_schematic_cells(
        layout,
        top,
        extracted_nets,
        logic,
    )
    return layout, recognized


def format_pin_nets(cell: RecognizedCell) -> str:
    """Format pin-to-extracted-net connections for terminal output."""
    connections: list[str] = []

    for pin, nets in sorted(cell.pin_nets.items()):
        net_names = "/".join(f"net_{net}" for net in sorted(nets))
        connections.append(f"{pin}={net_names}")

    return ", ".join(connections) if connections else "no signal pins resolved"


def print_recognized(
    layout: kdb.Layout,
    recognized: list[RecognizedCell],
) -> None:
    """Print a summary followed by every schematic instance and its pins."""
    print(f"Recognized schematic instances: {len(recognized)}")

    counts = Counter(cell.symbol_kind for cell in recognized)
    for symbol_kind, count in sorted(counts.items()):
        print(f"  {symbol_kind}: {count}")

    print("\nInstances:")
    for cell in recognized:
        position = cell.transform.disp
        short_name = cell.cell_type.removeprefix("sky130_fd_sc_hd__")
        print(
            f"  u_{cell.instance_id}: {short_name} [{cell.symbol_kind}] "
            f"at ({position.x * layout.dbu:.3f}, "
            f"{position.y * layout.dbu:.3f}) um; "
            f"{format_pin_nets(cell)}"
        )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Extract schematic-level SKY130 cells from GDS",
    )
    parser.add_argument(
        "gds",
        nargs="?",
        type=Path,
        default=GDS_PATH,
        help=f"input GDS (default: {GDS_PATH})",
    )
    args = parser.parse_args()

    layout, recognized = extract_schematic_cells(args.gds)
    print(f"GDS: {args.gds}")
    print(f"Top cell: {layout.top_cell().name}")
    print_recognized(layout, recognized)


if __name__ == "__main__":
    main()
