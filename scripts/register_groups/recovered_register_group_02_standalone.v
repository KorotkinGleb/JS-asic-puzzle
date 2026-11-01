// Standalone RTL reconstruction of register group 02 from puzzle.gds.
// No includes, PDK cells, or submodules are required.
//
// Recovered mapping:
//   q[0] = u_234.Q, d[0] = u_234.D
//   q[1] = u_235.Q, d[1] = u_235.D
//   q[2] = u_236.Q, d[2] = u_236.D
//   q[3] = u_237.Q, d[3] = u_237.D
//
// These physical flip-flops have no reset pin.  Their state is therefore
// unknown at power-up.  When register_group_09_q[0] is low, next_d becomes
// zero, so the next rising clock edge clears current_q synchronously.

module recovered_register_group_02_standalone (
    input  wire       clk,
    input  wire [2:0] register_group_09_q,
    output reg  [3:0] current_q,
    output wire [3:0] next_d
);
    wire net_2302;
    wire net_2311;
    wire net_2316;
    wire net_2330;
    wire net_2359;

    // Recovered internal combinational signals.
    assign net_2302 = ~(current_q[3] & current_q[0] &
                        current_q[2] & current_q[1]);
    assign net_2311 = ~current_q[3];
    assign net_2316 = ~(current_q[0] & current_q[2] & current_q[1]);
    assign net_2330 = (current_q[2] & current_q[1]) | current_q[0];
    assign net_2359 = ~(current_q[2] ^ current_q[1]);

    // Recovered next-state function.
    assign next_d[0] = (current_q[3] | net_2316) &
                       net_2330 & register_group_09_q[0];
    assign next_d[1] = register_group_09_q[0] &
                       ~(current_q[1] & net_2302);
    assign next_d[2] = register_group_09_q[0] &
                       ~(net_2302 & net_2359);
    assign next_d[3] = register_group_09_q[0] &
                       ~(net_2311 & net_2316);

    // Recovered four-bit register.  All four physical clock-tree leaves trace
    // back to the same top-level rising-edge clock (extracted net_1608).
    always @(posedge clk)
        current_q <= next_d;
endmodule

