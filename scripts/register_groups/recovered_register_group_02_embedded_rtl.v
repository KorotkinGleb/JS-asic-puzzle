// Experimental stateful reconstruction of register group 02.
//
// Unlike the earlier next-state-cone module, this module does not expose the
// physical FF Q and D vectors as ports.  The recovered feedback flip-flops are
// represented by the internal physical_state member and a real clocked block.
// Only the meaningful value used outside this block is exposed.

module recovered_character_index_counter (
    input  wire       clk,
    input  wire       done,
    output wire [3:0] character_index
);
    // Physical standard-cell mapping:
    //   physical_state[0] = u_234.Q / net_751
    //   physical_state[1] = u_235.Q / net_762
    //   physical_state[2] = u_236.Q / net_749
    //   physical_state[3] = u_237.Q / net_848
    //
    // All four FFs have feedback through their recovered D cones, so they are
    // internal state rather than separate Q-input and D-output ports.
    reg  [3:0] physical_state;
    wire [3:0] physical_next;
    wire [3:0] logical_next;

    // Synthesis scrambled the original counter bit order.  This permutation
    // produces the logical sequence 0, 1, 2, ... 15.
    assign character_index = {
        physical_state[3],
        physical_state[0],
        physical_state[2],
        physical_state[1]
    };

    // Recovered behavior:
    //   done == 0: clear on the next rising clock;
    //   done == 1: increment, saturating at 15.
    assign logical_next = !done ? 4'd0 :
                          (character_index == 4'd15) ? 4'd15 :
                          character_index + 1'b1;

    // Inverse of the physical-to-logical bit permutation above.
    assign physical_next = {
        logical_next[3],
        logical_next[1],
        logical_next[0],
        logical_next[2]
    };

    // The recovered u_234..u_237 cells are dfxtp FFs and have no reset pin.
    // Therefore this model deliberately does not invent an asynchronous reset.
    always @(posedge clk)
        physical_state <= physical_next;

endmodule

