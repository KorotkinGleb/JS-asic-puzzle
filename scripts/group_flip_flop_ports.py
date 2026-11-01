"""Create grouped-port copies of recovered structural Verilog modules.

Scalar inputs such as ``ff_4659_q`` are replaced by packed register vectors
using ``recovered_register_groups.json``.  The original netlists are never
modified.  Destination D ports stay scalar because a recovered cone may drive
only some bits of a destination register.

For verified shift registers, vector indexes use the recovered shift order.
For heuristic register candidates, indexes use sorted instance IDs; that order
is deterministic but is not claimed to be the original RTL bit ordering.
"""

from __future__ import annotations

import argparse
from dataclasses import dataclass
import json
from pathlib import Path
import re


DEFAULT_REPORT = Path("scripts/recovered_register_groups.json")
DEFAULT_OUTPUT_DIR = Path("scripts/grouped")
DEFAULT_INPUT_GLOB = "recovered_*.v"

MODULE_RE = re.compile(r"^(\s*module\s+)([A-Za-z_$][A-Za-z0-9_$]*)")
PORT_RE = re.compile(
    r"^(?P<indent>\s*)input\s+wire\s+"
    r"(?P<name>ff_(?P<ff_id>\d+)_q|shift_q_(?P<shift_bit>\d+))"
    r"(?P<comma>,?)\s*(?P<comment>//.*)?$"
)
NET_COMMENT_RE = re.compile(r"extracted net_(\d+)")


@dataclass(frozen=True)
class GroupDefinition:
    report_index: int
    name: str
    kind: str
    confidence: float
    members: tuple[int, ...]
    bit_order: tuple[int, ...]

    @property
    def width(self) -> int:
        return len(self.bit_order)

    def bit_for_instance(self, instance_id: int) -> int:
        return self.bit_order.index(instance_id)


@dataclass(frozen=True)
class IdentifierMapping:
    group: GroupDefinition
    bit: int
    instance_id: int


def load_groups(report_path: Path) -> list[GroupDefinition]:
    report = json.loads(report_path.read_text())
    groups: list[GroupDefinition] = []

    for index, item in enumerate(report["register_groups"], start=1):
        members = tuple(item["flip_flops"])
        recovered_order = item.get("bit_order")
        bit_order = tuple(recovered_order or sorted(members))
        name = (
            "shift_register_q"
            if item["kind"] == "verified shift register"
            else f"register_group_{index:02d}_q"
        )
        groups.append(
            GroupDefinition(
                report_index=index,
                name=name,
                kind=item["kind"],
                confidence=float(item["confidence"]),
                members=members,
                bit_order=bit_order,
            )
        )
    return groups


def build_identifier_map(
    groups: list[GroupDefinition],
) -> dict[str, IdentifierMapping]:
    mappings: dict[str, IdentifierMapping] = {}

    for group in groups:
        for instance_id in group.members:
            mappings[f"ff_{instance_id}_q"] = IdentifierMapping(
                group=group,
                bit=group.bit_for_instance(instance_id),
                instance_id=instance_id,
            )

        if group.kind == "verified shift register":
            for bit, instance_id in enumerate(group.bit_order):
                mappings[f"shift_q_{bit}"] = IdentifierMapping(
                    group=group,
                    bit=bit,
                    instance_id=instance_id,
                )
    return mappings


def _replace_identifiers(
    line: str,
    mappings: dict[str, IdentifierMapping],
) -> str:
    identifiers = sorted(mappings, key=len, reverse=True)
    if not identifiers:
        return line
    pattern = re.compile(
        r"\b(" + "|".join(re.escape(name) for name in identifiers) + r")\b"
    )
    return pattern.sub(
        lambda match: (
            f"{mappings[match.group(1)].group.name}"
            f"[{mappings[match.group(1)].bit}]"
        ),
        line,
    )


def _set_header_commas(lines: list[str]) -> list[str]:
    declaration_indexes = [
        index
        for index, line in enumerate(lines)
        if re.match(r"^\s*(input|output|inout)\s+", line)
    ]
    if not declaration_indexes:
        return lines

    final_index = declaration_indexes[-1]
    for index in declaration_indexes:
        line = lines[index]
        code, separator, comment = line.partition("//")
        code = code.rstrip().rstrip(",")
        if index != final_index:
            code += ","
        lines[index] = code + (f"  //{comment}" if separator else "")
    return lines


def group_verilog_text(
    text: str,
    groups: list[GroupDefinition],
) -> tuple[str, dict]:
    mappings = build_identifier_map(groups)
    original_lines = text.splitlines()
    output_lines: list[str] = []
    emitted_groups: set[str] = set()
    used: dict[str, list[dict]] = {}
    inside_header = False
    module_name: str | None = None
    grouped_module_name: str | None = None
    header_end_index: int | None = None

    for line in original_lines:
        module_match = MODULE_RE.match(line)
        if module_match and module_name is None:
            module_name = module_match.group(2)
            grouped_module_name = f"{module_name}_grouped"
            line = MODULE_RE.sub(
                rf"\1{grouped_module_name}",
                line,
                count=1,
            )
            inside_header = True

        port_match = PORT_RE.match(line) if inside_header else None
        if port_match and port_match.group("name") in mappings:
            scalar_name = port_match.group("name")
            mapping = mappings[scalar_name]
            group = mapping.group
            net_match = NET_COMMENT_RE.search(port_match.group("comment") or "")
            used.setdefault(group.name, []).append(
                {
                    "bit": mapping.bit,
                    "instance_id": mapping.instance_id,
                    "original_port": scalar_name,
                    "net": int(net_match.group(1)) if net_match else None,
                }
            )

            if group.name not in emitted_groups:
                emitted_groups.add(group.name)
                order_note = (
                    "verified shift order"
                    if group.kind == "verified shift register"
                    else "inferred group; index order follows instance IDs"
                )
                output_lines.append(
                    f"{port_match.group('indent')}input wire "
                    f"[{group.width - 1}:0] {group.name},  "
                    f"// {order_note}"
                )
            continue

        if inside_header and line.strip() == ");":
            output_lines = _set_header_commas(output_lines)
            output_lines.append(line)
            header_end_index = len(output_lines)
            inside_header = False
            continue

        output_lines.append(_replace_identifiers(line, mappings))

    if module_name is None or grouped_module_name is None:
        raise ValueError("No Verilog module declaration found")

    mapping_comments: list[str] = []
    for group in groups:
        entries = sorted(used.get(group.name, []), key=lambda item: item["bit"])
        if not entries:
            continue
        mapping_comments.append(
            f"  // {group.name}: {group.kind}; "
            f"confidence={group.confidence:.3f}"
        )
        for entry in entries:
            net_text = (
                f", extracted net_{entry['net']}"
                if entry["net"] is not None
                else ""
            )
            mapping_comments.append(
                f"  //   [{entry['bit']}] = u_{entry['instance_id']}.Q "
                f"(was {entry['original_port']}{net_text})"
            )
        missing_bits = sorted(
            set(range(group.width)) - {entry["bit"] for entry in entries}
        )
        if missing_bits:
            mapping_comments.append(
                "  //   unused bits in this cone: "
                + ", ".join(str(bit) for bit in missing_bits)
            )
        mapping_comments.append("")

    if mapping_comments and header_end_index is not None:
        output_lines[header_end_index:header_end_index] = [""] + mapping_comments

    output_text = "\n".join(output_lines) + "\n"
    manifest = {
        "original_module": module_name,
        "grouped_module": grouped_module_name,
        "groups": [
            {
                "name": group.name,
                "width": group.width,
                "kind": group.kind,
                "confidence": group.confidence,
                "present_bits": sorted(
                    used.get(group.name, []), key=lambda item: item["bit"]
                ),
            }
            for group in groups
            if group.name in used
        ],
    }
    return output_text, manifest


def discover_inputs(explicit: list[Path]) -> list[Path]:
    if explicit:
        return explicit
    return sorted(
        path
        for path in Path("scripts").glob(DEFAULT_INPUT_GLOB)
        if "_grouped" not in path.stem
    )


def main() -> None:
    parser = argparse.ArgumentParser(
        description="Group recovered scalar FF.Q Verilog ports into vectors"
    )
    parser.add_argument("verilog", nargs="*", type=Path)
    parser.add_argument("--groups", type=Path, default=DEFAULT_REPORT)
    parser.add_argument("--output-dir", type=Path, default=DEFAULT_OUTPUT_DIR)
    args = parser.parse_args()

    groups = load_groups(args.groups)
    inputs = discover_inputs(args.verilog)
    if not inputs:
        raise FileNotFoundError("No recovered Verilog files found")

    args.output_dir.mkdir(parents=True, exist_ok=True)
    manifest = {
        "group_report": str(args.groups),
        "bit_order_note": (
            "Shift order is verified. Other vector indexes use sorted "
            "instance IDs and may differ from the original RTL bit order."
        ),
        "files": [],
    }

    for input_path in inputs:
        grouped_text, file_manifest = group_verilog_text(
            input_path.read_text(), groups
        )
        output_path = args.output_dir / f"{input_path.stem}_grouped.v"
        output_path.write_text(grouped_text)
        file_manifest["input"] = str(input_path)
        file_manifest["output"] = str(output_path)
        manifest["files"].append(file_manifest)
        print(
            f"{input_path} -> {output_path}: "
            f"{len(file_manifest['groups'])} grouped register ports"
        )

    manifest_path = args.output_dir / "register_port_mapping.json"
    manifest_path.write_text(json.dumps(manifest, indent=2) + "\n")
    print(f"Mapping manifest: {manifest_path}")


if __name__ == "__main__":
    main()
