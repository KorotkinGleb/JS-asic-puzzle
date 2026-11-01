// Stateful RTL recovered by merging every FF.D backward cone.
// register_13: 6 bit(s), state/counter register candidate.
module recovered_register_13 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output reg [5:0] register_13  // recovered current state
);

  // Physical-bit mapping.
  // register_13[0] = u_1259.Q / net_2532; D=net_2531
  // register_13[1] = u_1260.Q / net_2581; D=net_2583
  // register_13[2] = u_1261.Q / net_2512; D=net_2557
  // register_13[3] = u_1383.Q / net_2493; D=net_2489
  // register_13[4] = u_1384.Q / net_2511; D=net_2510
  // register_13[5] = u_1385.Q / net_2579; D=net_2582

  // Extracted combinational nets.
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

  // Liberty Boolean functions recovered from standard cells.
  // u_1323: sky130_fd_sc_hd__and4bb_2
  assign net_2612 = (!register_03[2]&!register_03[0]&register_03[1]&register_03[3]);
  // u_1370: sky130_fd_sc_hd__and4bb_2
  assign net_2533 = (!register_03[3]&!register_03[0]&register_03[1]&register_03[2]);
  // u_1425: sky130_fd_sc_hd__inv_2
  assign net_2490 = (!register_13[2]);
  // u_1451: sky130_fd_sc_hd__or4b_2
  assign net_2478 = (register_03[3]) | (register_03[2]) | (register_03[0]) | (!register_03[1]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_1286: sky130_fd_sc_hd__a31o_2
  assign net_2554 = (I&net_604&net_2533) | (register_13[0]);
  // u_1287: sky130_fd_sc_hd__a31o_2
  assign net_2611 = (I&net_604&net_2612) | (register_13[1]);
  // u_1362: sky130_fd_sc_hd__nand2_2
  assign net_2479 = (!I) | (!net_604);
  // u_1364: sky130_fd_sc_hd__nand4_2
  assign net_2584 = (!I) | (!net_604) | (!register_13[1]) | (!net_2612);
  // u_1365: sky130_fd_sc_hd__nand4_2
  assign net_2530 = (!I) | (!net_604) | (!register_13[0]) | (!net_2533);
  // u_1363: sky130_fd_sc_hd__or4_2
  assign net_2483 = (register_13[4]) | (net_2490) | (net_2478) | (net_2479);
  // u_1377: sky130_fd_sc_hd__nor2_2
  assign net_2477 = (!net_2478&!net_2479);
  // u_1570: sky130_fd_sc_hd__nand2b_2
  assign net_2582 = (register_13[5]) | (!net_2584);
  // u_1579: sky130_fd_sc_hd__o21a_2
  assign net_2583 = (register_13[5]&net_2611) | (net_2584&net_2611);
  // u_1366: sky130_fd_sc_hd__o21a_2
  assign net_2531 = (register_13[3]&net_2554) | (net_2530&net_2554);
  // u_1569: sky130_fd_sc_hd__nand2b_2
  assign net_2489 = (register_13[3]) | (!net_2530);
  // u_1367: sky130_fd_sc_hd__a21o_2
  assign net_2510 = (register_13[2]&net_2477) | (register_13[4]);
  // u_1387: sky130_fd_sc_hd__o21a_2
  assign net_2557 = (register_13[2]&net_2483) | (net_2477&net_2483);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_13: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[0] <= 1'b0;
    else register_13[0] <= net_2531;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[1] <= 1'b0;
    else register_13[1] <= net_2583;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[2] <= 1'b0;
    else register_13[2] <= net_2557;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[3] <= 1'b0;
    else register_13[3] <= net_2489;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[4] <= 1'b0;
    else register_13[4] <= net_2510;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13[5] <= 1'b0;
    else register_13[5] <= net_2582;
  end

endmodule
