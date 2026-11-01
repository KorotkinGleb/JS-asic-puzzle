"""Discover register vectors and store their physical/logical bit mappings."""

from __future__ import annotations

from dataclasses import dataclass
import json
from pathlib import Path
from typing import Iterable

from scripts.recover_register_groups import (
    make_report,
    recover_register_groups,
)
from scripts.recover_schematic_elements import RecoveryContext

@dataclass(frozen=True)
class RegisterBit:
    bit: int
    instance_id: int
    module: str
    q_net: int
    d_net: int
    clock_pin: str
    local_clock_net: int
    clock_root_net: int
    clock_path_nets: tuple[int, ...]
    controls: tuple[tuple[str, int], ...]


@dataclass(frozen=True)
class RegisterDefinition:
    name: str
    index: int
    kind: str
    confidence: float
    confidence_label: str
    evidence: tuple[str, ...]
    bits: tuple[RegisterBit, ...]

    @property
    def width(self) -> int:
        return len(self.bits)

    @property
    def instance_ids(self) -> tuple[int, ...]:
        return tuple(bit.instance_id for bit in self.bits)

    @property
    def q_nets(self) -> tuple[int, ...]:
        return tuple(bit.q_net for bit in self.bits)

    @property
    def d_nets(self) -> tuple[int, ...]:
        return tuple(bit.d_net for bit in self.bits)


class RegisterCatalog:
    """Named register vectors with O(1) lookup by FF, Q net, or D net."""

    def __init__(
        self,
        registers: Iterable[RegisterDefinition],
        *,
        gds_top: str = "",
        method: str = "",
    ):
        self.registers = tuple(registers)
        self.gds_top = gds_top
        self.method = method
        self.by_name = {register.name: register for register in self.registers}
        self.by_instance: dict[int, tuple[RegisterDefinition, RegisterBit]] = {}
        self.by_q_net: dict[int, tuple[RegisterDefinition, RegisterBit]] = {}
        self.by_d_net: dict[int, list[tuple[RegisterDefinition, RegisterBit]]] = {}
        for register in self.registers:
            for bit in register.bits:
                self.by_instance[bit.instance_id] = (register, bit)
                self.by_q_net[bit.q_net] = (register, bit)
                self.by_d_net.setdefault(bit.d_net, []).append((register, bit))

    def get(self, name_or_index: str | int) -> RegisterDefinition:
        if isinstance(name_or_index, int):
            name_or_index = f"register_{name_or_index:02d}"
        aliases = {
            "register_01": "shift_register",
            "group_01": "shift_register",
        }
        name = aliases.get(name_or_index, name_or_index)
        if name.startswith("group_"):
            name = "register_" + name.removeprefix("group_")
        try:
            return self.by_name[name]
        except KeyError as error:
            raise KeyError(
                f"Unknown register {name_or_index!r}; choose one of "
                + ", ".join(self.by_name)
            ) from error

    def state_expression(self, instance_id: int) -> str:
        register, bit = self.by_instance[instance_id]
        if register.width == 1:
            return register.name
        return f"{register.name}[{bit.bit}]"

    @property
    def flip_flop_count(self) -> int:
        return len(self.by_instance)


def _confidence_label(confidence: float) -> str:
    if confidence >= 0.80:
        return "high"
    if confidence >= 0.68:
        return "likely"
    return "possible"


def _bit_record(bit: RegisterBit) -> dict:
    return {
        "bit": bit.bit,
        "instance_id": bit.instance_id,
        "module": bit.module,
        "q_net": bit.q_net,
        "d_net": bit.d_net,
        "clock_pin": bit.clock_pin,
        "local_clock_net": bit.local_clock_net,
        "clock_root_net": bit.clock_root_net,
        "clock_path_nets": list(bit.clock_path_nets),
        "controls": [
            {"pin": pin, "net": net} for pin, net in bit.controls
        ],
    }


def catalog_to_dict(catalog: RegisterCatalog) -> dict:
    instance_map: dict[str, dict] = {}
    q_net_map: dict[str, dict] = {}
    d_net_map: dict[str, list[dict]] = {}
    records: list[dict] = []
    for register in catalog.registers:
        record = {
            "index": register.index,
            "name": register.name,
            "kind": register.kind,
            "confidence": register.confidence,
            "confidence_label": register.confidence_label,
            "width": register.width,
            "bit_order": list(register.instance_ids),
            "q_nets": list(register.q_nets),
            "d_nets": list(register.d_nets),
            "bits": [_bit_record(bit) for bit in register.bits],
            "evidence": list(register.evidence),
        }
        records.append(record)
        for bit in register.bits:
            location = {"register": register.name, "bit": bit.bit}
            instance_map[str(bit.instance_id)] = location
            q_net_map[str(bit.q_net)] = location
            d_net_map.setdefault(str(bit.d_net), []).append(location)
    return {
        "schema_version": 1,
        "gds_top": catalog.gds_top,
        "method": catalog.method,
        "flip_flop_count": catalog.flip_flop_count,
        "register_count": len(catalog.registers),
        "registers": records,
        "instance_map": instance_map,
        "q_net_map": q_net_map,
        "d_net_map": d_net_map,
    }


def catalog_from_dict(data: dict) -> RegisterCatalog:
    registers: list[RegisterDefinition] = []
    for record in data["registers"]:
        bits = tuple(
            RegisterBit(
                bit=item["bit"],
                instance_id=item["instance_id"],
                module=item["module"],
                q_net=item["q_net"],
                d_net=item["d_net"],
                clock_pin=item.get("clock_pin", "CLK"),
                local_clock_net=item["local_clock_net"],
                clock_root_net=item["clock_root_net"],
                clock_path_nets=tuple(item.get("clock_path_nets", ())),
                controls=tuple(
                    (control["pin"], control["net"])
                    for control in item.get("controls", ())
                ),
            )
            for item in record["bits"]
        )
        registers.append(
            RegisterDefinition(
                name=record["name"],
                index=record["index"],
                kind=record["kind"],
                confidence=record["confidence"],
                confidence_label=record.get(
                    "confidence_label", _confidence_label(record["confidence"])
                ),
                evidence=tuple(record.get("evidence", ())),
                bits=bits,
            )
        )
    return RegisterCatalog(
        registers,
        gds_top=data.get("gds_top", ""),
        method=data.get("method", ""),
    )


def load_register_catalog(path: str | Path) -> RegisterCatalog:
    return catalog_from_dict(json.loads(Path(path).read_text()))


def discover_registers(context: RecoveryContext) -> RegisterCatalog:
    """Run structural/clock/fan-in grouping and include singleton FF state."""

    information, groups, pair_evidence = recover_register_groups(context)
    raw_report = make_report(context, information, groups, pair_evidence)
    by_id = {element.instance_id: element for element in context.elements}
    registers: list[RegisterDefinition] = []
    grouped: set[int] = set()

    for index, group in enumerate(groups, start=1):
        order = tuple(group.bit_order or group.members)
        grouped.update(order)
        name = "shift_register" if index == 1 and group.bit_order else f"register_{index:02d}"
        bits: list[RegisterBit] = []
        for bit_index, instance_id in enumerate(order):
            element = by_id[instance_id]
            info = information[instance_id]
            clock_pin = "CLK" if "CLK" in element.input_pins else next(
                (
                    pin
                    for pin in element.input_pins
                    if "CLK" in pin.upper() or pin.upper() in {"GATE", "GCLK"}
                ),
                "CLK",
            )
            controls = tuple(
                sorted(
                    (pin, net)
                    for pin, net in element.input_pins.items()
                    if pin not in {"D", clock_pin}
                )
            )
            bits.append(
                RegisterBit(
                    bit=bit_index,
                    instance_id=instance_id,
                    module=element.module,
                    q_net=info.q_net,
                    d_net=info.d_net,
                    clock_pin=clock_pin,
                    local_clock_net=info.clock.local_net,
                    clock_root_net=info.clock.root_net,
                    clock_path_nets=info.clock.path_nets,
                    controls=controls,
                )
            )
        registers.append(
            RegisterDefinition(
                name=name,
                index=index,
                kind=group.kind,
                confidence=group.confidence,
                confidence_label=_confidence_label(group.confidence),
                evidence=tuple(group.evidence),
                bits=tuple(bits),
            )
        )

    # The grouping algorithm is intentionally conservative.  Every remaining
    # FF still becomes a real one-bit register so complete RTL never loses state.
    for instance_id in sorted(set(information) - grouped):
        index = len(registers) + 1
        element = by_id[instance_id]
        info = information[instance_id]
        clock_pin = "CLK" if "CLK" in element.input_pins else "CLK"
        controls = tuple(
            sorted(
                (pin, net)
                for pin, net in element.input_pins.items()
                if pin not in {"D", clock_pin}
            )
        )
        registers.append(
            RegisterDefinition(
                name=f"register_{index:02d}",
                index=index,
                kind="ungrouped one-bit register",
                confidence=1.0,
                confidence_label="physical FF",
                evidence=(
                    "physical sequential cell is certain; vector grouping is unknown",
                ),
                bits=(
                    RegisterBit(
                        bit=0,
                        instance_id=instance_id,
                        module=element.module,
                        q_net=info.q_net,
                        d_net=info.d_net,
                        clock_pin=clock_pin,
                        local_clock_net=info.clock.local_net,
                        clock_root_net=info.clock.root_net,
                        clock_path_nets=info.clock.path_nets,
                        controls=controls,
                    ),
                ),
            )
        )

    return RegisterCatalog(
        registers,
        gds_top=context.top.name,
        method=raw_report["method"],
    )


def write_register_json(
    context: RecoveryContext,
    output_path: str | Path,
) -> tuple[Path, RegisterCatalog]:
    catalog = discover_registers(context)
    path = Path(output_path)
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(catalog_to_dict(catalog), indent=2) + "\n")
    return path, catalog
