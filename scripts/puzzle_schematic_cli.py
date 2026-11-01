"""Print a compact ASCII schematic recovered from puzzle.gds."""

from __future__ import annotations

from pathlib import Path

import klayout.db as kdb

try:
    from .analyze_puzzle import find_mux_register_chains
    from .klayoutexmp import (
        extract_conductor_nets,
        load_liberty_logic,
        load_pdk_cell_names,
        recognize_schematic_cells,
        single_pin_net,
    )
except ImportError:
    from analyze_puzzle import find_mux_register_chains
    from klayoutexmp import (
        extract_conductor_nets,
        load_liberty_logic,
        load_pdk_cell_names,
        recognize_schematic_cells,
        single_pin_net,
    )


PUZZLE_GDS = Path("puzzle.gds")
CONTROL_REGISTER_NET = 1968
SUCCESS_NET = 2380


def print_top_level(
    serial_input: int,
    selector: int,
    shift_width: int,
) -> None:
    print(
        f"""
Recovered puzzle.gds schematic
==============================

 I / net_{serial_input}
      |
      v
+-----------------------+   Q taps   +-----------------------+   state   +----------------------+
| {shift_width}-BIT SHIFT REGISTER |----------->| CONTROL / STATE LOGIC |---------->| OUTPUT GENERATOR     |----> O[7:0]
| {shift_width} x (MUX2 + DFF)     |            | other FFs + gates     |           | 8 combinational cones|
+-----------------------+            +-----------+-----------+           +----------------------+
      ^                                           |
      | S = net_{selector}                             | next_success
      |                                           v
      |                                    +-------------+
      |                                    | SUCCESS DFF |----> success
      |                                    | Q=net_{SUCCESS_NET}  |
      |                                    +-------------+
      |
 enable ---> [ enable AND NOT net_{CONTROL_REGISTER_NET} ] ---> net_{selector}
                              ^
                              |
                    registered control bit
                         net_{CONTROL_REGISTER_NET}

 clk  ----> [buffered clock tree] ----> all flip-flops
 rst_n -----------------------------> reset/set pins
"""
    )


def print_stage(selector: int) -> None:
    print(
        f"""
One shift-register stage
========================

                         +-------+       +-------+
 previous Q / serial --->| A1    |       | D   Q |------> Q[i] ----> next stage A1
                         |  MUX  X|------>|  DFF  |
                  +----->| A0    |       |       |
                  |      +---+---+       +---+---+
                  |          ^               ^
                  |          | S=net_{selector}      | clk, rst_n
                  |                          |
                  +---------- Q[i] ----------+
                       feedback / hold

 net_{selector} = 0 : MUX selects A0, so Q[i] holds its value
 net_{selector} = 1 : MUX selects A1, so the chain shifts
"""
    )


def print_net_order(serial_input: int, q_nets: list[int]) -> None:
    names = [f"net_{serial_input}"] + [f"net_{net}" for net in q_nets]
    print("Recovered serial data order")
    print("===========================")

    for index in range(0, len(names), 4):
        prefix = "  " if index == 0 else "  -> "
        print(prefix + " -> ".join(names[index : index + 4]))


def main() -> None:
    layout = kdb.Layout()
    layout.read(str(PUZZLE_GDS))
    top = layout.top_cell()
    logic = load_liberty_logic(load_pdk_cell_names())
    l2n = extract_conductor_nets(layout, top)
    cells = recognize_schematic_cells(layout, top, l2n, logic)
    _stages, chains = find_mux_register_chains(cells)

    if len(chains) != 1:
        raise RuntimeError(
            f"Expected one recovered shift-register chain, found {len(chains)}"
        )

    chain = chains[0]
    serial_input = single_pin_net(chain[0].mux, "A1")
    selector = single_pin_net(chain[0].mux, "S")
    q_nets = [single_pin_net(stage.dff, "Q") for stage in chain]

    if serial_input is None or selector is None or any(net is None for net in q_nets):
        raise RuntimeError("Some shift-register nets could not be resolved")

    print_top_level(serial_input, selector, len(chain))
    print_stage(selector)
    print_net_order(serial_input, q_nets)


if __name__ == "__main__":
    main()
