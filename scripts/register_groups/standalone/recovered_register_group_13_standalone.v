// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_13: state/counter register candidate; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_13_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // RESET_B / net_322
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred register vector
    output reg [5:0] register_group_13_q,  // current register state
    output wire [5:0] register_group_13_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_13_q[0] = u_1259.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_13_q[1] = u_1260.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_13_q[2] = u_1261.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_13_q[3] = u_1383.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_13_q[4] = u_1384.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_13_q[5] = u_1385.Q (sky130_fd_sc_hd__dfrtp_2)

  // Recovered combinational nets.
  wire net_604;
  wire net_2477;
  wire net_2478;
  wire net_2479;
  wire net_2483;
  wire net_2489;
  wire net_2490;
  wire net_2510;
  wire net_2530;
  wire net_2531;
  wire net_2533;
  wire net_2554;
  wire net_2557;
  wire net_2582;
  wire net_2583;
  wire net_2584;
  wire net_2611;
  wire net_2612;

  // Inlined Boolean functions of the recovered standard cells.
  // u_1286: sky130_fd_sc_hd__a31o_2
  assign net_2554 = (I&net_604&net_2533) | (register_group_13_q[0]);
  // u_1287: sky130_fd_sc_hd__a31o_2
  assign net_2611 = (I&net_604&net_2612) | (register_group_13_q[1]);
  // u_1323: sky130_fd_sc_hd__and4bb_2
  assign net_2612 = (!register_group_03_q[2]&!register_group_03_q[0]&register_group_03_q[1]&register_group_03_q[3]);
  // u_1362: sky130_fd_sc_hd__nand2_2
  assign net_2479 = (!I) | (!net_604);
  // u_1363: sky130_fd_sc_hd__or4_2
  assign net_2483 = (register_group_13_q[4]) | (net_2490) | (net_2478) | (net_2479);
  // u_1364: sky130_fd_sc_hd__nand4_2
  assign net_2584 = (!I) | (!net_604) | (!register_group_13_q[1]) | (!net_2612);
  // u_1365: sky130_fd_sc_hd__nand4_2
  assign net_2530 = (!I) | (!net_604) | (!register_group_13_q[0]) | (!net_2533);
  // u_1366: sky130_fd_sc_hd__o21a_2
  assign net_2531 = (register_group_13_q[3]&net_2554) | (net_2530&net_2554);
  // u_1367: sky130_fd_sc_hd__a21o_2
  assign net_2510 = (register_group_13_q[2]&net_2477) | (register_group_13_q[4]);
  // u_1370: sky130_fd_sc_hd__and4bb_2
  assign net_2533 = (!register_group_03_q[3]&!register_group_03_q[0]&register_group_03_q[1]&register_group_03_q[2]);
  // u_1377: sky130_fd_sc_hd__nor2_2
  assign net_2477 = (!net_2478&!net_2479);
  // u_1387: sky130_fd_sc_hd__o21a_2
  assign net_2557 = (register_group_13_q[2]&net_2483) | (net_2477&net_2483);
  // u_1425: sky130_fd_sc_hd__inv_2
  assign net_2490 = (!register_group_13_q[2]);
  // u_1451: sky130_fd_sc_hd__or4b_2
  assign net_2478 = (register_group_03_q[3]) | (register_group_03_q[2]) | (register_group_03_q[0]) | (!register_group_03_q[1]);
  // u_1569: sky130_fd_sc_hd__nand2b_2
  assign net_2489 = (register_group_13_q[3]) | (!net_2530);
  // u_1570: sky130_fd_sc_hd__nand2b_2
  assign net_2582 = (register_group_13_q[5]) | (!net_2584);
  // u_1579: sky130_fd_sc_hd__o21a_2
  assign net_2583 = (register_group_13_q[5]&net_2611) | (net_2584&net_2611);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!ff_4182_q&enable);

  // Destination D-pin vector.
  assign register_group_13_d[0] = net_2531;  // u_1259.D / net_2531
  assign register_group_13_d[1] = net_2583;  // u_1260.D / net_2583
  assign register_group_13_d[2] = net_2557;  // u_1261.D / net_2557
  assign register_group_13_d[3] = net_2489;  // u_1383.D / net_2489
  assign register_group_13_d[4] = net_2510;  // u_1384.D / net_2510
  assign register_group_13_d[5] = net_2582;  // u_1385.D / net_2582

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_13_q[0] <= 1'b0;
    else register_group_13_q[0] <= register_group_13_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_13_q[1] <= 1'b0;
    else register_group_13_q[1] <= register_group_13_d[1];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_13_q[2] <= 1'b0;
    else register_group_13_q[2] <= register_group_13_d[2];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_13_q[3] <= 1'b0;
    else register_group_13_q[3] <= register_group_13_d[3];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_13_q[4] <= 1'b0;
    else register_group_13_q[4] <= register_group_13_d[4];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_13_q[5] <= 1'b0;
    else register_group_13_q[5] <= register_group_13_d[5];
  end
endmodule
