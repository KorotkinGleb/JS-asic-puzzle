// RTL reconstruction of register group 02 from puzzle.gds.
//
// Recovered bit mapping:
//   register_group_02_q[0] = u_234.Q
//   register_group_02_q[1] = u_235.Q
//   register_group_02_q[2] = u_236.Q
//   register_group_02_q[3] = u_237.Q
//
// The four physical cells are sky130_fd_sc_hd__dfxtp_2 flip-flops.  No reset
// pin was recovered on these cells, so this model deliberately does not invent
// a reset.  register_group_09_q[0] is an external state/control dependency.

module recovered_register_group_02_next_state_rtl (
    input  wire [2:0] register_group_09_q,
    input  wire [3:0] register_group_02_q,
    output wire [3:0] register_group_02_d
);
    wire net_2302;
    wire net_2311;
    wire net_2316;
    wire net_2330;
    wire net_2359;

    // These equations are direct RTL translations of recovered cells
    // u_199, u_202, u_215, u_341, u_353, u_494, u_500, u_608 and u_624.
    assign net_2302 = ~(register_group_02_q[3] &
                        register_group_02_q[0] &
                        register_group_02_q[2] &
                        register_group_02_q[1]);
    assign net_2359 = ~(register_group_02_q[2] ^
                        register_group_02_q[1]);
    assign net_2316 = ~(register_group_02_q[0] &
                        register_group_02_q[2] &
                        register_group_02_q[1]);
    assign net_2330 = (register_group_02_q[2] &
                       register_group_02_q[1]) |
                       register_group_02_q[0];
    assign net_2311 = ~register_group_02_q[3];

    assign register_group_02_d[0] =
        (register_group_02_q[3] | net_2316) &
        net_2330 & register_group_09_q[0];
    assign register_group_02_d[1] =
        register_group_09_q[0] &
        ~(register_group_02_q[1] & net_2302);
    assign register_group_02_d[2] =
        register_group_09_q[0] & ~(net_2302 & net_2359);
    assign register_group_02_d[3] =
        register_group_09_q[0] & ~(net_2311 & net_2316);
endmodule


// Sequential form of the recovered group.  Q receives the recovered D value
// on every rising clock edge.  Its power-up state is unknown because these
// four recovered flip-flops do not have reset pins.
module recovered_register_group_02_rtl (
    input  wire       clk,
    input  wire [2:0] register_group_09_q,
    output reg  [3:0] register_group_02_q,
    output wire [3:0] register_group_02_d
);
    recovered_register_group_02_next_state_rtl next_state (
        .register_group_09_q(register_group_09_q),
        .register_group_02_q(register_group_02_q),
        .register_group_02_d(register_group_02_d)
    );

    always @(posedge clk)
        register_group_02_q <= register_group_02_d;
endmodule

