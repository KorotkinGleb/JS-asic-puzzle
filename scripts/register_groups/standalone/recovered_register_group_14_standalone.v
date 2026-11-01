// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_14: state/counter register candidate; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_14_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // RESET_B / net_322
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred register vector
    output reg [5:0] register_group_14_q,  // current register state
    output wire [5:0] register_group_14_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_14_q[0] = u_1228.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_14_q[1] = u_1230.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_14_q[2] = u_1258.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_14_q[3] = u_1626.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_14_q[4] = u_1808.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_14_q[5] = u_1810.Q (sky130_fd_sc_hd__dfrtp_2)

  // Recovered combinational nets.
  wire net_604;
  wire net_2274;
  wire net_2275;
  wire net_2277;
  wire net_2301;
  wire net_2307;
  wire net_2344;
  wire net_2345;
  wire net_2354;
  wire net_2377;
  wire net_2418;
  wire net_2419;
  wire net_2438;
  wire net_2440;
  wire net_2441;
  wire net_2464;

  // Inlined Boolean functions of the recovered standard cells.
  // u_1232: sky130_fd_sc_hd__a31o_2
  assign net_2301 = (I&net_604&net_2277) | (register_group_14_q[0]);
  // u_1234: sky130_fd_sc_hd__a31o_2
  assign net_2377 = (I&net_604&net_2419) | (register_group_14_q[1]);
  // u_1235: sky130_fd_sc_hd__o21a_2
  assign net_2354 = (register_group_14_q[5]&net_2377) | (net_2344&net_2377);
  // u_1240: sky130_fd_sc_hd__nand2b_2
  assign net_2345 = (register_group_14_q[5]) | (!net_2344);
  // u_1246: sky130_fd_sc_hd__and4bb_2
  assign net_2419 = (!register_group_03_q[2]&!register_group_03_q[1]&register_group_03_q[0]&register_group_03_q[3]);
  // u_1248: sky130_fd_sc_hd__and4b_2
  assign net_2418 = (!register_group_03_q[1]&register_group_03_q[0]&register_group_03_q[2]&register_group_03_q[3]);
  // u_1381: sky130_fd_sc_hd__nand4_2
  assign net_2441 = (!I) | (!net_604) | (!register_group_14_q[2]) | (!net_2418);
  // u_1611: sky130_fd_sc_hd__o21a_2
  assign net_2438 = (register_group_14_q[3]&net_2440) | (net_2441&net_2440);
  // u_1635: sky130_fd_sc_hd__a31o_2
  assign net_2440 = (I&net_604&net_2418) | (register_group_14_q[2]);
  // u_1641: sky130_fd_sc_hd__nand4_2
  assign net_2344 = (!I) | (!net_604) | (!register_group_14_q[1]) | (!net_2419);
  // u_1675: sky130_fd_sc_hd__nand2b_2
  assign net_2464 = (register_group_14_q[3]) | (!net_2441);
  // u_1772: sky130_fd_sc_hd__nand4_2
  assign net_2275 = (!I) | (!net_604) | (!register_group_14_q[0]) | (!net_2277);
  // u_1790: sky130_fd_sc_hd__o21a_2
  assign net_2307 = (register_group_14_q[4]&net_2301) | (net_2275&net_2301);
  // u_1807: sky130_fd_sc_hd__and4bb_2
  assign net_2277 = (!register_group_03_q[3]&!register_group_03_q[1]&register_group_03_q[0]&register_group_03_q[2]);
  // u_1959: sky130_fd_sc_hd__nand2b_2
  assign net_2274 = (register_group_14_q[4]) | (!net_2275);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!ff_4182_q&enable);

  // Destination D-pin vector.
  assign register_group_14_d[0] = net_2307;  // u_1228.D / net_2307
  assign register_group_14_d[1] = net_2354;  // u_1230.D / net_2354
  assign register_group_14_d[2] = net_2438;  // u_1258.D / net_2438
  assign register_group_14_d[3] = net_2464;  // u_1626.D / net_2464
  assign register_group_14_d[4] = net_2274;  // u_1808.D / net_2274
  assign register_group_14_d[5] = net_2345;  // u_1810.D / net_2345

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_14_q[0] <= 1'b0;
    else register_group_14_q[0] <= register_group_14_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_14_q[1] <= 1'b0;
    else register_group_14_q[1] <= register_group_14_d[1];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_14_q[2] <= 1'b0;
    else register_group_14_q[2] <= register_group_14_d[2];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_14_q[3] <= 1'b0;
    else register_group_14_q[3] <= register_group_14_d[3];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_14_q[4] <= 1'b0;
    else register_group_14_q[4] <= register_group_14_d[4];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_14_q[5] <= 1'b0;
    else register_group_14_q[5] <= register_group_14_d[5];
  end
endmodule
