// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_02: state/counter register candidate; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_02_standalone (
    input wire clk,  // clock root net_1608
    input wire [2:0] register_group_09_q,  // inferred register vector
    output reg [3:0] register_group_02_q,  // current register state
    output wire [3:0] register_group_02_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_02_q[0] = u_234.Q (sky130_fd_sc_hd__dfxtp_2)
  // register_group_02_q[1] = u_235.Q (sky130_fd_sc_hd__dfxtp_2)
  // register_group_02_q[2] = u_236.Q (sky130_fd_sc_hd__dfxtp_2)
  // register_group_02_q[3] = u_237.Q (sky130_fd_sc_hd__dfxtp_2)

  // Recovered combinational nets.
  wire net_2302;
  wire net_2311;
  wire net_2316;
  wire net_2317;
  wire net_2330;
  wire net_2332;
  wire net_2359;
  wire net_2388;
  wire net_2411;

  // Inlined Boolean functions of the recovered standard cells.
  // u_199: sky130_fd_sc_hd__a21boi_2
  assign net_2388 = (!register_group_02_q[1]&register_group_09_q[0]) | (!net_2302&register_group_09_q[0]);
  // u_202: sky130_fd_sc_hd__xnor2_2
  assign net_2359 = (!register_group_02_q[2]&!register_group_02_q[1]) | (register_group_02_q[2]&register_group_02_q[1]);
  // u_215: sky130_fd_sc_hd__a21boi_2
  assign net_2317 = (!net_2311&register_group_09_q[0]) | (!net_2316&register_group_09_q[0]);
  // u_341: sky130_fd_sc_hd__a21boi_2
  assign net_2411 = (!net_2302&register_group_09_q[0]) | (!net_2359&register_group_09_q[0]);
  // u_353: sky130_fd_sc_hd__nand4_2
  assign net_2302 = (!register_group_02_q[3]) | (!register_group_02_q[0]) | (!register_group_02_q[2]) | (!register_group_02_q[1]);
  // u_494: sky130_fd_sc_hd__nand3_2
  assign net_2316 = (!register_group_02_q[0]) | (!register_group_02_q[2]) | (!register_group_02_q[1]);
  // u_500: sky130_fd_sc_hd__a21o_2
  assign net_2330 = (register_group_02_q[2]&register_group_02_q[1]) | (register_group_02_q[0]);
  // u_608: sky130_fd_sc_hd__o211a_2
  assign net_2332 = (register_group_02_q[3]&net_2330&register_group_09_q[0]) | (net_2316&net_2330&register_group_09_q[0]);
  // u_624: sky130_fd_sc_hd__inv_2
  assign net_2311 = (!register_group_02_q[3]);

  // Destination D-pin vector.
  assign register_group_02_d[0] = net_2332;  // u_234.D / net_2332
  assign register_group_02_d[1] = net_2388;  // u_235.D / net_2388
  assign register_group_02_d[2] = net_2411;  // u_236.D / net_2411
  assign register_group_02_d[3] = net_2317;  // u_237.D / net_2317

  // Recovered sequential behavior.
  always @(posedge clk) begin
    register_group_02_q[0] <= register_group_02_d[0];
  end
  always @(posedge clk) begin
    register_group_02_q[1] <= register_group_02_d[1];
  end
  always @(posedge clk) begin
    register_group_02_q[2] <= register_group_02_d[2];
  end
  always @(posedge clk) begin
    register_group_02_q[3] <= register_group_02_d[3];
  end
endmodule
