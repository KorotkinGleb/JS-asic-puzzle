from __future__ import annotations

from collections import Counter
from dataclasses import dataclass
from pathlib import Path
import re

import klayout.db as kdb


GDS_PATH = Path("warmup/04_final.gds")
PDK_PATH = Path("/Users/korotkingleb/.ciel/sky130A")

REFERENCE_GDS = (
    PDK_PATH
    / "libs.ref"
    / "sky130_fd_sc_hd"
    / "gds"
    / "sky130_fd_sc_hd.gds"
)
LIBERTY_PATH = (
    PDK_PATH
    / "libs.ref"
    / "sky130_fd_sc_hd"
    / "lib"
    / "sky130_fd_sc_hd__tt_025C_1v80.lib"
)

MUX2 = "sky130_fd_sc_hd__mux2_1"
DFFR = "sky130_fd_sc_hd__dfrtp_2"

# SKY130 conductor/via stack from the installed KLayout technology.
# LI and above are enough to connect standard-cell signal pins.
CONDUCTOR_STACK = [
    ("li", 67, 20),
    ("mcon", 67, 44),
    ("met1", 68, 20),
    ("via1", 68, 44),
    ("met2", 69, 20),
    ("via2", 69, 44),
    ("met3", 70, 20),
    ("via3", 70, 44),
    ("met4", 71, 20),
    ("via4", 71, 44),
    ("met5", 72, 20),
]

# SKY130 standard-cell signal pin names are labels on LI.
LI_LABEL = (67, 5)


@dataclass
class RecognizedCell:
    instance_id: int
    cell_type: str
    symbol_kind: str
    transform: kdb.Trans
    bbox: kdb.Box
    # A pin may have multiple GDS labels, but they should resolve to the
    # same extracted electrical net.
    pin_nets: dict[str, set[int]]


@dataclass
class RegisterStage:
    mux: RecognizedCell
    dff: RecognizedCell


@dataclass
class LogicDefinition:
    input_pins: tuple[str, ...]
    output_functions: dict[str, str]


@dataclass
class AdderMatch:
    input_width: int
    output_nets: list[int]
    cells: list[RecognizedCell]


def iter_named_blocks(text: str, keyword: str):
    """Yield (name, body) for nested Liberty blocks such as cell() or pin()."""
    pattern = re.compile(
        rf'\b{re.escape(keyword)}\s*\(\s*"?([^"\)]+)"?\s*\)\s*\{{'
    )
    position = 0

    while match := pattern.search(text, position):
        depth = 1
        cursor = match.end()

        while cursor < len(text) and depth:
            if text[cursor] == "{":
                depth += 1
            elif text[cursor] == "}":
                depth -= 1
            cursor += 1

        if depth:
            raise ValueError(f"Unterminated Liberty {keyword} block")

        yield match.group(1).strip(), text[match.end() : cursor - 1]
        position = cursor


def load_liberty_logic(cell_names: set[str]) -> dict[str, LogicDefinition]:
    """Load standard-cell pin directions and Boolean functions from the PDK."""
    liberty_text = LIBERTY_PATH.read_text()
    definitions: dict[str, LogicDefinition] = {}

    for cell_name, cell_body in iter_named_blocks(liberty_text, "cell"):
        if cell_name not in cell_names:
            continue

        input_pins: list[str] = []
        output_functions: dict[str, str] = {}

        for pin_name, pin_body in iter_named_blocks(cell_body, "pin"):
            direction_match = re.search(
                r'direction\s*:\s*"?(input|output|inout)"?\s*;',
                pin_body,
            )
            function_match = re.search(
                r'function\s*:\s*"([^"]+)"\s*;',
                pin_body,
            )

            if direction_match and direction_match.group(1) == "input":
                input_pins.append(pin_name)
            elif (
                direction_match
                and direction_match.group(1) == "output"
                and function_match
            ):
                output_functions[pin_name] = function_match.group(1)

        if output_functions:
            definitions[cell_name] = LogicDefinition(
                input_pins=tuple(input_pins),
                output_functions=output_functions,
            )

    return definitions


def classify_schematic_symbol(cell_type: str) -> str:
    """Map a SKY130 cell master to a familiar schematic symbol category."""
    short_name = cell_type.removeprefix("sky130_fd_sc_hd__")
    base_name = re.sub(r"_\d+$", "", short_name)

    if base_name.startswith("df"):
        return "flip-flop"
    if base_name.startswith("dl"):
        return "latch"
    if base_name.startswith("mux"):
        return "multiplexer"
    if base_name.startswith("xnor"):
        return "XNOR gate"
    if base_name.startswith("xor"):
        return "XOR gate"
    if base_name.startswith("nand"):
        return "NAND gate"
    if base_name.startswith("nor"):
        return "NOR gate"
    if base_name.startswith("and"):
        return "AND gate"
    if base_name.startswith("or"):
        return "OR gate"
    if base_name.startswith(("clkinv", "inv")):
        return "inverter"
    if base_name.startswith(("clkbuf", "buf")):
        return "buffer"
    if base_name.startswith("ebuf"):
        return "tri-state buffer"
    if base_name.startswith("conb"):
        return "constant source"
    return "compound logic gate"


class BooleanExpression:
    """Evaluate the small Boolean-expression language used by Liberty files."""

    def __init__(
        self,
        expression: str,
        values: dict[str, int],
        truth_mask: int,
    ) -> None:
        self.expression = expression
        self.values = values
        self.truth_mask = truth_mask
        self.tokens = re.findall(
            r"[A-Za-z_]\w*|[01]|[!&|^()+*']",
            expression,
        )
        self.index = 0

    def take(self, expected: str | None = None) -> str | None:
        if self.index >= len(self.tokens):
            return None
        token = self.tokens[self.index]
        if expected is not None and token != expected:
            return None
        self.index += 1
        return token

    def parse(self) -> int:
        value = self.parse_or()
        if self.index != len(self.tokens):
            raise ValueError(
                f"Unsupported Liberty function syntax: {self.expression}"
            )
        return value & self.truth_mask

    def parse_or(self) -> int:
        value = self.parse_xor()
        while self.take("|") or self.take("+"):
            value |= self.parse_xor()
        return value

    def parse_xor(self) -> int:
        value = self.parse_and()
        while self.take("^"):
            value ^= self.parse_and()
        return value

    def parse_and(self) -> int:
        value = self.parse_unary()
        while self.take("&") or self.take("*"):
            value &= self.parse_unary()
        return value

    def parse_unary(self) -> int:
        if self.take("!"):
            return self.truth_mask ^ self.parse_unary()

        if self.take("("):
            value = self.parse_or()
            if not self.take(")"):
                raise ValueError(f"Missing ')' in Liberty function: {self.expression}")
        else:
            token = self.take()
            if token is None:
                raise ValueError(f"Incomplete Liberty function: {self.expression}")
            if token == "0":
                value = 0
            elif token == "1":
                value = self.truth_mask
            else:
                value = self.values[token]

        while self.take("'"):
            value = self.truth_mask ^ value
        return value


def evaluate_boolean(
    expression: str,
    values: dict[str, int],
    truth_mask: int,
) -> int:
    return BooleanExpression(expression, values, truth_mask).parse()


def load_pdk_cell_names() -> set[str]:
    """Return the cell masters present in the official PDK GDS."""
    reference = kdb.Layout()
    reference.read(str(REFERENCE_GDS))
    return {cell.name for cell in reference.each_cell()}


def extract_conductor_nets(
    layout: kdb.Layout,
    top: kdb.Cell,
) -> kdb.LayoutToNetlist:
    """Extract flat metal connectivity directly from GDS polygons."""
    l2n = kdb.LayoutToNetlist(top.name, layout.dbu)
    layers: dict[str, kdb.Region] = {}

    for name, gds_layer, datatype in CONDUCTOR_STACK:
        layer_index = layout.layer(gds_layer, datatype)
        region = kdb.Region(top.begin_shapes_rec(layer_index))
        l2n.register(region, name)
        l2n.connect(region)
        layers[name] = region

    # Connect each adjacent conductor/via/conductor item in the PDK stack.
    for lower, upper in zip(CONDUCTOR_STACK, CONDUCTOR_STACK[1:]):
        l2n.connect(layers[lower[0]], layers[upper[0]])

    l2n.extract_netlist()
    return l2n


def extract_pin_nets(
    layout: kdb.Layout,
    instance: kdb.Instance,
    l2n: kdb.LayoutToNetlist,
) -> dict[str, set[int]]:
    """Transform GDS pin labels and probe the extracted net at each label."""
    label_layer = layout.layer(*LI_LABEL)
    li_region = l2n.polygons_by_name("li")
    result: dict[str, set[int]] = {}

    for shape in instance.cell.shapes(label_layer).each():
        if not shape.is_text():
            continue

        text = shape.text
        displacement = text.trans.disp
        local_point = kdb.Point(displacement.x, displacement.y)
        top_point = instance.trans * local_point
        net = l2n.probe_net(li_region, top_point)

        if net is not None:
            result.setdefault(text.string, set()).add(net.cluster_id)

    return result


def recognize_schematic_cells(
    layout: kdb.Layout,
    top: kdb.Cell,
    l2n: kdb.LayoutToNetlist,
    logic: dict[str, LogicDefinition],
) -> list[RecognizedCell]:
    """Return only functional PDK instances normally shown on a schematic.

    Presence in ``logic`` means that the installed PDK Liberty file defines
    an output function for the master. Physical-only filler, tap, decap, and
    end-cap cells therefore never enter the returned array.
    """
    recognized: list[RecognizedCell] = []

    for instance_id, instance in enumerate(top.each_inst()):
        cell_type = instance.cell.name
        if cell_type not in logic:
            continue

        recognized.append(
            RecognizedCell(
                instance_id=instance_id,
                cell_type=cell_type,
                symbol_kind=classify_schematic_symbol(cell_type),
                transform=instance.trans,
                bbox=instance.cell.bbox().transformed(instance.trans),
                pin_nets=extract_pin_nets(layout, instance, l2n),
            )
        )

    return recognized


def pins_connected(
    first: RecognizedCell,
    first_pin: str,
    second: RecognizedCell,
    second_pin: str,
) -> bool:
    """Test connectivity using net IDs extracted from GDS geometry."""
    return bool(
        first.pin_nets.get(first_pin, set())
        & second.pin_nets.get(second_pin, set())
    )


def is_stage(mux: RecognizedCell, dff: RecognizedCell) -> bool:
    """Recognize one enable-controlled shift-register stage."""
    return (
        mux.cell_type == MUX2
        and dff.cell_type == DFFR
        and pins_connected(mux, "X", dff, "D")
        and pins_connected(mux, "A0", dff, "Q")
    )


def follows(previous: RegisterStage, following: RegisterStage) -> bool:
    """Return True when the following stage shifts from the previous Q."""
    return pins_connected(previous.dff, "Q", following.mux, "A1")


def share_pin_net(
    stages: list[RegisterStage],
    part: str,
    pin: str,
) -> bool:
    """Check that every selected MUX or DFF pin shares one physical net."""
    common: set[int] | None = None

    for stage in stages:
        cell = stage.mux if part == "mux" else stage.dff
        nets = cell.pin_nets.get(pin, set())
        common = set(nets) if common is None else common & nets

    return bool(common)


def find_shift_registers(stages: list[RegisterStage]) -> list[list[RegisterStage]]:
    """Build ordered chains and verify shared enable, clock, and reset nets."""
    successors: dict[int, list[int]] = {index: [] for index in range(len(stages))}
    predecessors: dict[int, list[int]] = {index: [] for index in range(len(stages))}

    for previous_index, previous in enumerate(stages):
        for following_index, following in enumerate(stages):
            if previous_index == following_index:
                continue
            if follows(previous, following):
                successors[previous_index].append(following_index)
                predecessors[following_index].append(previous_index)

    chains: list[list[RegisterStage]] = []

    for root in (index for index in predecessors if not predecessors[index]):
        indexes: list[int] = []
        current = root

        while current not in indexes:
            indexes.append(current)
            if len(successors[current]) != 1:
                break
            current = successors[current][0]

        chain = [stages[index] for index in indexes]

        # A single MUX+DFF is only a register stage, not enough evidence for
        # a shift register. A chain must also share its control signals.
        if (
            len(chain) >= 2
            and share_pin_net(chain, "mux", "S")
            and share_pin_net(chain, "dff", "CLK")
            and share_pin_net(chain, "dff", "RESET_B")
        ):
            chains.append(chain)

    # Make output deterministic: upper chains appear before lower chains.
    return sorted(
        chains,
        key=lambda chain: sum(stage.dff.transform.disp.y for stage in chain),
        reverse=True,
    )


def single_pin_net(cell: RecognizedCell, pin: str) -> int | None:
    """Return a pin's net when the GDS labels resolve unambiguously."""
    nets = cell.pin_nets.get(pin, set())
    return next(iter(nets)) if len(nets) == 1 else None


def build_addition_signatures(
    width: int,
) -> tuple[list[int], list[int], int]:
    """Encode every A/B input and expected A+B output as bit-parallel truth tables."""
    # Exact exhaustive simulation scales as 2 ** (2 * width). Keep this sample
    # intentionally bounded; the warm-up puzzle uses two 8-bit registers.
    if width > 8:
        raise ValueError("Exact adder recognition is currently limited to 8 bits")

    sample_count = 1 << (2 * width)
    byte_count = (sample_count + 7) // 8
    input_buffers = [bytearray(byte_count) for _ in range(2 * width)]
    sum_buffers = [bytearray(byte_count) for _ in range(width + 1)]
    value_mask = (1 << width) - 1

    for sample in range(sample_count):
        first = sample & value_mask
        second = sample >> width
        total = first + second
        byte_index = sample >> 3
        sample_mask = 1 << (sample & 7)

        for bit in range(width):
            if (first >> bit) & 1:
                input_buffers[bit][byte_index] |= sample_mask
            if (second >> bit) & 1:
                input_buffers[width + bit][byte_index] |= sample_mask

        for bit in range(width + 1):
            if (total >> bit) & 1:
                sum_buffers[bit][byte_index] |= sample_mask

    input_signatures = [
        int.from_bytes(buffer, "little") for buffer in input_buffers
    ]
    sum_signatures = [int.from_bytes(buffer, "little") for buffer in sum_buffers]
    truth_mask = (1 << sample_count) - 1
    return input_signatures, sum_signatures, truth_mask


def find_adder(
    cells: list[RecognizedCell],
    shift_registers: list[list[RegisterStage]],
    logic: dict[str, LogicDefinition],
) -> AdderMatch | None:
    """Find an A+B cone fed by two equal-width physical shift registers."""
    if len(shift_registers) != 2:
        return None

    width = len(shift_registers[0])
    if width == 0 or len(shift_registers[1]) != width:
        return None

    input_signatures, sum_signatures, truth_mask = build_addition_signatures(width)
    input_nets: list[int] = []

    for chain in shift_registers:
        for stage in chain:
            net = single_pin_net(stage.dff, "Q")
            if net is None:
                return None
            input_nets.append(net)

    values = dict(zip(input_nets, input_signatures))
    drivers: dict[int, list[tuple[RecognizedCell, str]]] = {}

    for cell in cells:
        definition = logic.get(cell.cell_type)
        if definition is None or cell.cell_type == DFFR:
            continue
        for output_pin in definition.output_functions:
            output_net = single_pin_net(cell, output_pin)
            if output_net is not None:
                drivers.setdefault(output_net, []).append((cell, output_pin))

    # Propagate all combinational PDK functions whose inputs are known. Each
    # Python integer holds one truth value for every possible pair (A, B).
    changed = True
    while changed:
        changed = False

        for cell in cells:
            definition = logic.get(cell.cell_type)
            if definition is None or cell.cell_type == DFFR:
                continue

            for output_pin, expression in definition.output_functions.items():
                output_net = single_pin_net(cell, output_pin)
                if output_net is None or output_net in values:
                    continue

                variables = set(re.findall(r"[A-Za-z_]\w*", expression))
                pin_values: dict[str, int] = {}

                for pin in variables:
                    input_net = single_pin_net(cell, pin)
                    if input_net is None or input_net not in values:
                        break
                    pin_values[pin] = values[input_net]
                else:
                    values[output_net] = evaluate_boolean(
                        expression,
                        pin_values,
                        truth_mask,
                    )
                    changed = True

    output_nets: list[int] = []
    for expected in sum_signatures:
        candidates = [
            net
            for net, signature in values.items()
            if signature == expected and net in drivers
        ]
        if len(candidates) != 1:
            return None
        output_nets.append(candidates[0])

    # Trace backward from all nine result bits. This removes unrelated logic
    # that happened to be simulated and leaves only the physical adder cone.
    primary_input_nets = set(input_nets)
    cone: dict[int, RecognizedCell] = {}
    visited_nets: set[int] = set()

    def trace_fanin(net: int) -> None:
        if net in visited_nets or net in primary_input_nets:
            return
        visited_nets.add(net)

        for cell, _output_pin in drivers.get(net, []):
            cone[cell.instance_id] = cell
            definition = logic[cell.cell_type]
            for input_pin in definition.input_pins:
                input_net = single_pin_net(cell, input_pin)
                if input_net is not None:
                    trace_fanin(input_net)

    for output_net in output_nets:
        trace_fanin(output_net)

    return AdderMatch(
        input_width=width,
        output_nets=output_nets,
        cells=list(cone.values()),
    )


def output_driver(
    net: int,
    cells: list[RecognizedCell],
    logic: dict[str, LogicDefinition],
) -> RecognizedCell | None:
    """Return the recognized combinational cell driving an extracted net."""
    for cell in cells:
        definition = logic.get(cell.cell_type)
        if definition is None:
            continue
        if any(
            single_pin_net(cell, pin) == net
            for pin in definition.output_functions
        ):
            return cell
    return None


def main() -> None:
    if not GDS_PATH.is_file():
        raise FileNotFoundError(f"GDS not found: {GDS_PATH}")
    if not REFERENCE_GDS.is_file():
        raise FileNotFoundError(f"PDK reference GDS not found: {REFERENCE_GDS}")
    if not LIBERTY_PATH.is_file():
        raise FileNotFoundError(f"PDK Liberty file not found: {LIBERTY_PATH}")

    layout = kdb.Layout()
    layout.read(str(GDS_PATH))
    top = layout.top_cell()

    known_pdk_cells = load_pdk_cell_names()
    logic = load_liberty_logic(known_pdk_cells)
    l2n = extract_conductor_nets(layout, top)
    recognized = recognize_schematic_cells(layout, top, l2n, logic)

    muxes = [cell for cell in recognized if cell.cell_type == MUX2]
    dffs = [cell for cell in recognized if cell.cell_type == DFFR]
    stages = [
        RegisterStage(mux, dff)
        for mux in muxes
        for dff in dffs
        if is_stage(mux, dff)
    ]
    shift_registers = find_shift_registers(stages)
    adder = find_adder(recognized, shift_registers, logic)

    print(f"Top cell: {top.name}")
    print(f"Recognized schematic cells: {len(recognized)}")
    print("Schematic symbols:")
    symbol_counts = Counter(cell.symbol_kind for cell in recognized)
    for symbol_kind, count in sorted(symbol_counts.items()):
        print(f"  {symbol_kind}: {count}")
    print(f"MUX+DFF register stages: {len(stages)}")
    print(f"Shift-register chains: {len(shift_registers)}")

    for register_number, chain in enumerate(shift_registers, start=1):
        print(f"\nshift_register_{register_number}: {len(chain)} bits")
        for bit, stage in enumerate(chain):
            mux_position = stage.mux.transform.disp
            dff_position = stage.dff.transform.disp
            print(
                f"  bit {bit}: "
                f"MUX {stage.mux.transform} "
                f"({mux_position.x * layout.dbu:.3f}, "
                f"{mux_position.y * layout.dbu:.3f}) um; "
                f"DFF {stage.dff.transform} "
                f"({dff_position.x * layout.dbu:.3f}, "
                f"{dff_position.y * layout.dbu:.3f}) um"
            )

    if adder is None:
        print("\nAdder matches: 0")
        return

    left = min(cell.bbox.left for cell in adder.cells) * layout.dbu
    bottom = min(cell.bbox.bottom for cell in adder.cells) * layout.dbu
    right = max(cell.bbox.right for cell in adder.cells) * layout.dbu
    top_y = max(cell.bbox.top for cell in adder.cells) * layout.dbu

    print("\nAdder matches: 1")
    print(
        f"adder_1: {adder.input_width} + {adder.input_width} -> "
        f"{len(adder.output_nets)} bits; {len(adder.cells)} PDK cells"
    )
    print(
        "  KLayout region: "
        f"x={left:.3f}..{right:.3f} um, "
        f"y={bottom:.3f}..{top_y:.3f} um"
    )

    for bit, net in enumerate(adder.output_nets):
        driver = output_driver(net, adder.cells, logic)
        if driver is None:
            print(f"  sum[{bit}]: extracted net ${net}")
            continue

        position = driver.transform.disp
        short_name = driver.cell_type.removeprefix("sky130_fd_sc_hd__")
        print(
            f"  sum[{bit}]: net ${net}, driven by {short_name} at "
            f"({position.x * layout.dbu:.3f}, "
            f"{position.y * layout.dbu:.3f}) um"
        )


if __name__ == "__main__":
    main()
