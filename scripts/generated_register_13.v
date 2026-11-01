// Stateful RTL recovered from puzzle.gds.
// The first source-register layer is the module boundary.
module recovered_register_13 (
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire [3:0] register_03,  // source register at backtrace boundary
    input wire register_16,  // u_4182.Q at backtrace boundary
    input wire serial_in,
    output reg [5:0] register_13  // recovered register state
);

  // Physical flip-flop to RTL-bit mapping.
  // register_13[0] = u_1259.Q
  // register_13[1] = u_1260.Q
  // register_13[2] = u_1261.Q
  // register_13[3] = u_1383.Q
  // register_13[4] = u_1384.Q
  // register_13[5] = u_1385.Q

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

  // Recovered combinational next-state logic.
  // u_1286: sky130_fd_sc_hd__a31o_2
  assign net_2554 = (serial_in&net_604&net_2533) | (register_13[0]);
  // u_1287: sky130_fd_sc_hd__a31o_2
  assign net_2611 = (serial_in&net_604&net_2612) | (register_13[1]);
  // u_1323: sky130_fd_sc_hd__and4bb_2
  assign net_2612 = (!register_03[2]&!register_03[0]&register_03[1]&register_03[3]);
  // u_1362: sky130_fd_sc_hd__nand2_2
  assign net_2479 = (!serial_in) | (!net_604);
  // u_1363: sky130_fd_sc_hd__or4_2
  assign net_2483 = (register_13[4]) | (net_2490) | (net_2478) | (net_2479);
  // u_1364: sky130_fd_sc_hd__nand4_2
  assign net_2584 = (!serial_in) | (!net_604) | (!register_13[1]) | (!net_2612);
  // u_1365: sky130_fd_sc_hd__nand4_2
  assign net_2530 = (!serial_in) | (!net_604) | (!register_13[0]) | (!net_2533);
  // u_1366: sky130_fd_sc_hd__o21a_2
  assign net_2531 = (register_13[3]&net_2554) | (net_2530&net_2554);
  // u_1367: sky130_fd_sc_hd__a21o_2
  assign net_2510 = (register_13[2]&net_2477) | (register_13[4]);
  // u_1370: sky130_fd_sc_hd__and4bb_2
  assign net_2533 = (!register_03[3]&!register_03[0]&register_03[1]&register_03[2]);
  // u_1377: sky130_fd_sc_hd__nor2_2
  assign net_2477 = (!net_2478&!net_2479);
  // u_1387: sky130_fd_sc_hd__o21a_2
  assign net_2557 = (register_13[2]&net_2483) | (net_2477&net_2483);
  // u_1425: sky130_fd_sc_hd__inv_2
  assign net_2490 = (!register_13[2]);
  // u_1451: sky130_fd_sc_hd__or4b_2
  assign net_2478 = (register_03[3]) | (register_03[2]) | (register_03[0]) | (!register_03[1]);
  // u_1569: sky130_fd_sc_hd__nand2b_2
  assign net_2489 = (register_13[3]) | (!net_2530);
  // u_1570: sky130_fd_sc_hd__nand2b_2
  assign net_2582 = (register_13[5]) | (!net_2584);
  // u_1579: sky130_fd_sc_hd__o21a_2
  assign net_2583 = (register_13[5]&net_2611) | (net_2584&net_2611);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);

  // Recovered registers; D logic is used directly.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_13 <= 6'b000000;
    else begin
      register_13[0] <= net_2531;
      register_13[1] <= net_2583;
      register_13[2] <= net_2557;
      register_13[3] <= net_2489;
      register_13[4] <= net_2510;
      register_13[5] <= net_2582;
    end
  end
endmodule
