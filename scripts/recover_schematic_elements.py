"""Recover schematic-only elements, pins, and shift registers from GDS.

The ``elements`` array contains only functional cells declared by the installed
SKY130 Liberty library. Physical-only fillers, taps, decaps, end caps, and raw
transistor geometry are excluded.
"""

from __future__ import annotations

import argparse
from collections import Counter
from dataclasses import dataclass
from pathlib import Path

import klayout.db as kdb

try:
    from .klayoutexmp import (
        DFFR,
        MUX2,
        LogicDefinition,
        RecognizedCell,
        extract_conductor_nets,
        load_liberty_logic,
        load_pdk_cell_names,
        recognize_schematic_cells,
        single_pin_net,
    )
except ImportError:
    from klayoutexmp import (
        DFFR,
        MUX2,
        LogicDefinition,
        RecognizedCell,
        extract_conductor_nets,
        load_liberty_logic,
        load_pdk_cell_names,
        recognize_schematic_cells,
        single_pin_net,
    )


DEFAULT_GDS = Path("puzzle.gds")
LABEL_DATATYPE = 5
LABEL_CONDUCTORS = {
    67: "li",
    68: "met1",
    69: "met2",
    70: "met3",
    71: "met4",
    72: "met5",
}
POWER_PIN_NAMES = {"VGND", "VPWR", "VNB", "VPB"}


@dataclass
class SchematicElement:
    """One placed standard-cell instance needed by a logical schematic."""

    instance_id: int
    module: str
    symbol_kind: str
    transform: kdb.Trans
    bbox: kdb.Box
    input_pins: dict[str, int]
    output_pins: dict[str, int]
    output_functions: dict[str, str]

    def pin_net(self, pin: str) -> int | None:
        if pin in self.input_pins:
            return self.input_pins[pin]
        return self.output_pins.get(pin)


@dataclass(frozen=True)
class PinReference:
    instance_id: int
    module: str
    pin: str


@dataclass(frozen=True)
class TopInputPin:
    name: str
    net: int
    conductor: str
    point: kdb.Point
    loads: tuple[PinReference, ...]


@dataclass
class RegisterStage:
    mux: SchematicElement
    dff: SchematicElement


@dataclass
class ShiftRegister:
    stages: list[RegisterStage]
    serial_input_net: int
    selector_net: int
    reset_net: int | None
    clock_nets: set[int]

    @property
    def width(self) -> int:
        return len(self.stages)

    @property
    def q_nets(self) -> list[int]:
        return [stage.dff.output_pins["Q"] for stage in self.stages]


@dataclass(frozen=True)
class ShiftRegisterInputPins:
    serial_input: int
    selector: int
    reset: int | None
    clocks: tuple[int, ...]


@dataclass(frozen=True)
class ShiftRegisterOutput:
    bit: int
    net: int
    source: PinReference
    destinations: tuple[PinReference, ...]


@dataclass
class RecoveryContext:
    layout: kdb.Layout
    top: kdb.Cell
    l2n: kdb.LayoutToNetlist
    logic: dict[str, LogicDefinition]
    elements: list[SchematicElement]


def _resolved_pin_net(cell: RecognizedCell, pin: str) -> int | None:
    """Resolve exactly one extracted net for a physical standard-cell pin."""
    return single_pin_net(cell, pin)


def build_schematic_element_array(
    recognized: list[RecognizedCell],
    logic: dict[str, LogicDefinition],
) -> list[SchematicElement]:
    """Convert recognized PDK instances into directed schematic elements."""
    elements: list[SchematicElement] = []

    for cell in recognized:
        definition = logic.get(cell.cell_type)
        if definition is None:
            continue

        input_pins = {
            pin: net
            for pin in definition.input_pins
            if pin not in POWER_PIN_NAMES
            if (net := _resolved_pin_net(cell, pin)) is not None
        }
        output_pins = {
            pin: net
            for pin in definition.output_functions
            if pin not in POWER_PIN_NAMES
            if (net := _resolved_pin_net(cell, pin)) is not None
        }

        # A Liberty function is the criterion for being useful on the logical
        # schematic. It automatically excludes filler/tap/decap masters.
        if not output_pins:
            continue

        elements.append(
            SchematicElement(
                instance_id=cell.instance_id,
                module=cell.cell_type,
                symbol_kind=cell.symbol_kind,
                transform=cell.transform,
                bbox=cell.bbox,
                input_pins=input_pins,
                output_pins=output_pins,
                output_functions=dict(definition.output_functions),
            )
        )

    return elements


def recover_schematic(gds_path: Path = DEFAULT_GDS) -> RecoveryContext:
    """Read GDS and construct the schematic-only functional element array."""
    if not gds_path.is_file():
        raise FileNotFoundError(f"GDS not found: {gds_path}")

    layout = kdb.Layout()
    layout.read(str(gds_path))
    top = layout.top_cell()
    logic = load_liberty_logic(load_pdk_cell_names())
    l2n = extract_conductor_nets(layout, top)
    recognized = recognize_schematic_cells(layout, top, l2n, logic)
    elements = build_schematic_element_array(recognized, logic)
    return RecoveryContext(layout, top, l2n, logic, elements)


def build_load_index(
    elements: list[SchematicElement],
) -> dict[int, list[PinReference]]:
    loads: dict[int, list[PinReference]] = {}
    for element in elements:
        for pin, net in element.input_pins.items():
            loads.setdefault(net, []).append(
                PinReference(element.instance_id, element.module, pin)
            )
    return loads


def build_driver_index(
    elements: list[SchematicElement],
) -> dict[int, list[PinReference]]:
    drivers: dict[int, list[PinReference]] = {}
    for element in elements:
        for pin, net in element.output_pins.items():
            drivers.setdefault(net, []).append(
                PinReference(element.instance_id, element.module, pin)
            )
    return drivers


def find_input_pins(context: RecoveryContext) -> list[TopInputPin]:
    """Find named top-level inputs: labeled nets with loads and no cell driver."""
    loads = build_load_index(context.elements)
    drivers = build_driver_index(context.elements)
    found: dict[tuple[str, int], TopInputPin] = {}

    for gds_layer, conductor in LABEL_CONDUCTORS.items():
        label_layer = context.layout.layer(gds_layer, LABEL_DATATYPE)
        conductor_region = context.l2n.polygons_by_name(conductor)

        for shape in context.top.shapes(label_layer).each():
            if not shape.is_text():
                continue

            text = shape.text
            name = text.string
            if name in POWER_PIN_NAMES:
                continue

            point = text.trans.disp
            extracted_net = context.l2n.probe_net(conductor_region, point)
            if extracted_net is None:
                continue

            net = extracted_net.cluster_id
            if net not in loads or net in drivers:
                continue

            found[(name, net)] = TopInputPin(
                name=name,
                net=net,
                conductor=conductor,
                point=point,
                loads=tuple(loads[net]),
            )

    return sorted(found.values(), key=lambda pin: pin.name)


def _is_register_stage(
    mux: SchematicElement,
    dff: SchematicElement,
) -> bool:
    """Recognize hold/shift MUX feedback connected to one D flip-flop."""
    return (
        mux.module == MUX2
        and dff.module == DFFR
        and mux.output_pins.get("X") == dff.input_pins.get("D")
        and mux.input_pins.get("A0") == dff.output_pins.get("Q")
    )


def find_shift_registers(
    elements: list[SchematicElement],
) -> list[ShiftRegister]:
    """Find ordered MUX+DFF chains, allowing locally buffered clock nets."""
    muxes = [element for element in elements if element.module == MUX2]
    dffs = [element for element in elements if element.module == DFFR]
    stages = [
        RegisterStage(mux, dff)
        for mux in muxes
        for dff in dffs
        if _is_register_stage(mux, dff)
    ]

    successors: dict[int, list[int]] = {
        index: [] for index in range(len(stages))
    }
    predecessors: dict[int, list[int]] = {
        index: [] for index in range(len(stages))
    }

    for previous_index, previous in enumerate(stages):
        previous_q = previous.dff.output_pins.get("Q")
        for following_index, following in enumerate(stages):
            if previous_index == following_index:
                continue
            if previous_q == following.mux.input_pins.get("A1"):
                successors[previous_index].append(following_index)
                predecessors[following_index].append(previous_index)

    registers: list[ShiftRegister] = []
    for root in (index for index in predecessors if not predecessors[index]):
        indexes: list[int] = []
        current = root
        while current not in indexes:
            indexes.append(current)
            if len(successors[current]) != 1:
                break
            current = successors[current][0]

        chain = [stages[index] for index in indexes]
        if len(chain) < 2:
            continue

        selector_nets = {
            stage.mux.input_pins.get("S") for stage in chain
        }
        reset_nets = {
            stage.dff.input_pins.get("RESET_B") for stage in chain
        }
        if len(selector_nets) != 1 or len(reset_nets) != 1:
            continue

        selector = next(iter(selector_nets))
        serial_input = chain[0].mux.input_pins.get("A1")
        if selector is None or serial_input is None:
            continue

        registers.append(
            ShiftRegister(
                stages=chain,
                serial_input_net=serial_input,
                selector_net=selector,
                reset_net=next(iter(reset_nets)),
                clock_nets={
                    net
                    for stage in chain
                    if (net := stage.dff.input_pins.get("CLK")) is not None
                },
            )
        )

    return sorted(registers, key=lambda register: -register.width)


def find_shift_register_input_pins(
    register: ShiftRegister,
) -> ShiftRegisterInputPins:
    """Return the virtual input pins of one recovered shift-register block."""
    return ShiftRegisterInputPins(
        serial_input=register.serial_input_net,
        selector=register.selector_net,
        reset=register.reset_net,
        clocks=tuple(sorted(register.clock_nets)),
    )


def find_shift_register_outputs(
    register: ShiftRegister,
    elements: list[SchematicElement],
) -> list[ShiftRegisterOutput]:
    """Return Q nets consumed by schematic elements outside the register."""
    internal_ids = {
        element.instance_id
        for stage in register.stages
        for element in (stage.mux, stage.dff)
    }
    load_index = build_load_index(elements)
    outputs: list[ShiftRegisterOutput] = []

    for bit, stage in enumerate(register.stages):
        q_net = stage.dff.output_pins["Q"]
        destinations = tuple(
            endpoint
            for endpoint in load_index.get(q_net, [])
            if endpoint.instance_id not in internal_ids
        )
        if not destinations:
            continue

        outputs.append(
            ShiftRegisterOutput(
                bit=bit,
                net=q_net,
                source=PinReference(
                    stage.dff.instance_id,
                    stage.dff.module,
                    "Q",
                ),
                destinations=destinations,
            )
        )

    return outputs


def short_module(module: str) -> str:
    return module.removeprefix("sky130_fd_sc_hd__")


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Recover schematic elements, inputs, and shift-register ports",
    )
    parser.add_argument("gds", nargs="?", type=Path, default=DEFAULT_GDS)
    args = parser.parse_args()

    context = recover_schematic(args.gds)
    inputs = find_input_pins(context)
    registers = find_shift_registers(context.elements)
    print(f"GDS: {args.gds}; top: {context.top.name}")
    print(f"Schematic-only elements: {len(context.elements)}")
    for kind, count in sorted(
        Counter(element.symbol_kind for element in context.elements).items()
    ):
        print(f"  {kind}: {count}")

    print("\nTop-level input pins:")
    for pin in inputs:
        print(f"  {pin.name}: net_{pin.net}; loads={len(pin.loads)}")

    print(f"\nShift registers: {len(registers)}")
    for register_index, register in enumerate(registers, start=1):
        block_inputs = find_shift_register_input_pins(register)
        outputs = find_shift_register_outputs(register, context.elements)
        print(f"  shift_register_{register_index}: {register.width} bits")
        print(f"    serial input: net_{block_inputs.serial_input}")
        print(f"    selector: net_{block_inputs.selector}")
        print(f"    reset: net_{block_inputs.reset}")
        print(
            "    clocks: "
            + ", ".join(f"net_{net}" for net in block_inputs.clocks)
        )
        print(
            "    Q order: "
            + " -> ".join(f"net_{net}" for net in register.q_nets)
        )
        print("    external outputs:")
        for output in outputs:
            destinations = ", ".join(
                f"u_{pin.instance_id}.{pin.pin}({short_module(pin.module)})"
                for pin in output.destinations
            )
            print(
                f"      Q[{output.bit}] / net_{output.net} -> {destinations}"
            )


if __name__ == "__main__":
    main()
