"""Find top-level input candidates from the recovered SchematicElement array.

The electrical rule is simple: a candidate input net is consumed by at least
one element input pin but is not driven by any element output pin.  Because an
unlabeled floating conductor satisfies the same rule, GDS labels are used as a
second, independent check to distinguish confirmed top-level ports from
unlabeled undriven nets.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path

try:
    from .recover_schematic_elements import (
        LABEL_CONDUCTORS,
        LABEL_DATATYPE,
        POWER_PIN_NAMES,
        PinReference,
        RecoveryContext,
        SchematicElement,
        build_driver_index,
        build_load_index,
        recover_schematic,
        short_module,
    )
except ImportError:
    from recover_schematic_elements import (
        LABEL_CONDUCTORS,
        LABEL_DATATYPE,
        POWER_PIN_NAMES,
        PinReference,
        RecoveryContext,
        SchematicElement,
        build_driver_index,
        build_load_index,
        recover_schematic,
        short_module,
    )


DEFAULT_GDS = Path("puzzle.gds")


@dataclass(frozen=True)
class ElementArrayInput:
    """One undriven net consumed by functional elements."""

    net: int
    names: tuple[str, ...]
    loads: tuple[PinReference, ...]

    @property
    def confirmed_top_port(self) -> bool:
        return bool(self.names)


def find_undriven_input_nets(
    elements: list[SchematicElement],
) -> dict[int, tuple[PinReference, ...]]:
    """Return loaded nets that have no driver in the element array."""

    loads = build_load_index(elements)
    drivers = build_driver_index(elements)
    return {
        net: tuple(loads[net])
        for net in sorted(set(loads) - set(drivers))
    }


def find_top_label_names(context: RecoveryContext) -> dict[int, set[str]]:
    """Map extracted net IDs to top-level GDS text labels."""

    labels_by_net: dict[int, set[str]] = {}

    for gds_layer, conductor in LABEL_CONDUCTORS.items():
        label_layer = context.layout.layer(gds_layer, LABEL_DATATYPE)
        conductor_region = context.l2n.polygons_by_name(conductor)

        for shape in context.top.shapes(label_layer).each():
            if not shape.is_text():
                continue

            text = shape.text
            if text.string in POWER_PIN_NAMES:
                continue

            extracted_net = context.l2n.probe_net(
                conductor_region,
                text.trans.disp,
            )
            if extracted_net is None:
                continue

            labels_by_net.setdefault(extracted_net.cluster_id, set()).add(
                text.string
            )

    return labels_by_net


def find_element_array_inputs(
    elements: list[SchematicElement],
    labels_by_net: dict[int, set[str]] | None = None,
) -> list[ElementArrayInput]:
    """Classify all undriven, loaded nets in ``elements``.

    This function can operate on the element array alone.  In that case every
    result has an empty ``names`` tuple.  Supplying ``labels_by_net`` confirms
    which candidates correspond to named top-level GDS ports.
    """

    labels_by_net = labels_by_net or {}
    candidates = find_undriven_input_nets(elements)
    return [
        ElementArrayInput(
            net=net,
            names=tuple(sorted(labels_by_net.get(net, set()))),
            loads=loads,
        )
        for net, loads in candidates.items()
    ]


def load_text(load: PinReference) -> str:
    return f"u_{load.instance_id}.{load.pin}({short_module(load.module)})"


def print_inputs(inputs: list[ElementArrayInput], show_loads: bool) -> None:
    confirmed = [item for item in inputs if item.confirmed_top_port]
    unlabeled = [item for item in inputs if not item.confirmed_top_port]

    print(f"Confirmed top-level inputs: {len(confirmed)}")
    for item in confirmed:
        print(
            f"  {', '.join(item.names)}: net_{item.net}; "
            f"loads={len(item.loads)}"
        )
        if show_loads:
            for load in item.loads:
                print(f"    -> {load_text(load)}")

    print(f"\nUnlabeled undriven input candidates: {len(unlabeled)}")
    for item in unlabeled:
        print(f"  net_{item.net}; loads={len(item.loads)}")
        if show_loads:
            for load in item.loads:
                print(f"    -> {load_text(load)}")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Find input nets from the recovered SchematicElement array"
    )
    parser.add_argument("gds", nargs="?", type=Path, default=DEFAULT_GDS)
    parser.add_argument(
        "--show-loads",
        action="store_true",
        help="print every standard-cell input pin loaded by each net",
    )
    args = parser.parse_args()

    context = recover_schematic(args.gds)
    labels_by_net = find_top_label_names(context)
    inputs = find_element_array_inputs(context.elements, labels_by_net)
    print_inputs(inputs, args.show_loads)


if __name__ == "__main__":
    main()

