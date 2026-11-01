// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_09: decoded state/register vector; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_09_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // RESET_B / net_322
    input wire ff_4182_q,  // extracted net_1968
    input wire ff_5337_q,  // extracted net_1360
    input wire [1:0] register_group_05_q,  // inferred register vector
    input wire [2:0] register_group_06_q,  // inferred register vector
    input wire [7:0] register_group_07_q,  // inferred register vector
    input wire [5:0] register_group_08_q,  // inferred register vector
    input wire [7:0] register_group_10_q,  // inferred register vector
    input wire [7:0] register_group_11_q,  // inferred register vector
    input wire [5:0] register_group_13_q,  // inferred register vector
    input wire [5:0] register_group_14_q,  // inferred register vector
    input wire [7:0] register_group_15_q,  // inferred register vector
    output reg [2:0] register_group_09_q,  // current register state
    output wire [2:0] register_group_09_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_09_q[0] = u_226.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_09_q[1] = u_227.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_09_q[2] = u_228.Q (sky130_fd_sc_hd__dfrtp_2)

  // Recovered combinational nets.
  wire net_102;
  wire net_104;
  wire net_105;
  wire net_126;
  wire net_127;
  wire net_160;
  wire net_161;
  wire net_163;
  wire net_164;
  wire net_165;
  wire net_168;
  wire net_192;
  wire net_193;
  wire net_194;
  wire net_195;
  wire net_340;
  wire net_367;
  wire net_480;
  wire net_635;
  wire net_699;
  wire net_855;
  wire net_938;
  wire net_1163;
  wire net_1361;
  wire net_1500;
  wire net_1501;
  wire net_1502;
  wire net_1504;
  wire net_1505;
  wire net_1506;
  wire net_1507;
  wire net_1509;
  wire net_1510;
  wire net_1538;
  wire net_1539;
  wire net_1541;
  wire net_1542;
  wire net_1543;
  wire net_1573;
  wire net_2008;
  wire net_2129;
  wire net_2261;
  wire net_2487;
  wire net_2490;
  wire net_2501;
  wire net_2520;
  wire net_2522;
  wire net_2542;
  wire net_2543;
  wire net_2564;

  // Inlined Boolean functions of the recovered standard cells.
  // u_233: sky130_fd_sc_hd__a32o_2
  assign net_2543 = (net_1361&net_2487&net_2542) | (register_group_09_q[2]&net_2520);
  // u_247: sky130_fd_sc_hd__inv_2
  assign net_2522 = (!net_1361);
  // u_395: sky130_fd_sc_hd__or2_2
  assign net_2564 = (ff_4182_q) | (register_group_09_q[0]);
  // u_399: sky130_fd_sc_hd__a32o_2
  assign net_2501 = (net_2522&net_2487&net_2542) | (register_group_09_q[1]&net_2520);
  // u_406: sky130_fd_sc_hd__nand2b_2
  assign net_2520 = (register_group_09_q[0]) | (!ff_4182_q);
  // u_450: sky130_fd_sc_hd__and4b_2
  assign net_2542 = (!register_group_09_q[0]&ff_4182_q&net_164&net_1573);
  // u_460: sky130_fd_sc_hd__and2_2
  assign net_2487 = (net_855&net_367);
  // u_1262: sky130_fd_sc_hd__and2b_2
  assign net_1505 = (!register_group_13_q[0]&register_group_13_q[3]);
  // u_1376: sky130_fd_sc_hd__and2b_2
  assign net_1509 = (!register_group_14_q[2]&register_group_14_q[3]);
  // u_1425: sky130_fd_sc_hd__inv_2
  assign net_2490 = (!register_group_13_q[2]);
  // u_1560: sky130_fd_sc_hd__and2_2
  assign net_1502 = (register_group_13_q[4]&net_2490);
  // u_1591: sky130_fd_sc_hd__and2b_2
  assign net_1501 = (!register_group_13_q[1]&register_group_13_q[5]);
  // u_1630: sky130_fd_sc_hd__and2b_2
  assign net_1507 = (!register_group_14_q[1]&register_group_14_q[5]);
  // u_1775: sky130_fd_sc_hd__and2b_2
  assign net_1510 = (!register_group_14_q[0]&register_group_14_q[4]);
  // u_1776: sky130_fd_sc_hd__and2_2
  assign net_1504 = (register_group_15_q[0]&net_2261);
  // u_1794: sky130_fd_sc_hd__and2_2
  assign net_1538 = (register_group_15_q[1]&net_2129);
  // u_1968: sky130_fd_sc_hd__inv_2
  assign net_2261 = (!register_group_15_q[4]);
  // u_1982: sky130_fd_sc_hd__and2_2
  assign net_1543 = (register_group_15_q[7]&net_2008);
  // u_2012: sky130_fd_sc_hd__inv_2
  assign net_2129 = (!register_group_15_q[6]);
  // u_2013: sky130_fd_sc_hd__inv_2
  assign net_2008 = (!register_group_15_q[2]);
  // u_2107: sky130_fd_sc_hd__and2b_2
  assign net_1541 = (!register_group_15_q[3]&register_group_15_q[5]);
  // u_2364: sky130_fd_sc_hd__and2b_2
  assign net_1542 = (!register_group_05_q[0]&register_group_05_q[1]);
  // u_2555: sky130_fd_sc_hd__and2b_2
  assign net_163 = (!register_group_08_q[2]&register_group_08_q[0]);
  // u_2561: sky130_fd_sc_hd__and2_2
  assign net_160 = (register_group_08_q[5]&net_1163);
  // u_2571: sky130_fd_sc_hd__and2b_2
  assign net_161 = (!register_group_08_q[3]&register_group_08_q[1]);
  // u_2711: sky130_fd_sc_hd__inv_2
  assign net_1163 = (!register_group_08_q[4]);
  // u_2843: sky130_fd_sc_hd__and2b_2
  assign net_104 = (!register_group_10_q[0]&register_group_10_q[4]);
  // u_5010: sky130_fd_sc_hd__and4_2
  assign net_1539 = (net_1543&net_1542&net_1541&net_1538);
  // u_5013: sky130_fd_sc_hd__and3_2
  assign net_1573 = (net_1506&net_1539&net_1500);
  // u_5225: sky130_fd_sc_hd__and4_2
  assign net_1506 = (net_1510&net_1504&net_1509&net_1507);
  // u_5230: sky130_fd_sc_hd__and3_2
  assign net_1500 = (net_1505&net_1502&net_1501);
  // u_5532: sky130_fd_sc_hd__inv_2
  assign net_1361 = (!ff_5337_q);
  // u_5612: sky130_fd_sc_hd__or3_2
  assign net_480 = (register_group_07_q[3]) | (register_group_07_q[0]) | (register_group_07_q[4]);
  // u_5616: sky130_fd_sc_hd__nor3_2
  assign net_340 = (!register_group_07_q[5]&!register_group_07_q[7]&!net_480);
  // u_5836: sky130_fd_sc_hd__inv_2
  assign net_855 = (!register_group_06_q[1]);
  // u_6298: sky130_fd_sc_hd__and4_2
  assign net_367 = (register_group_07_q[2]&register_group_07_q[1]&register_group_07_q[6]&net_340);
  // u_6802: sky130_fd_sc_hd__and3_2
  assign net_164 = (net_126&net_165&net_192);
  // u_6806: sky130_fd_sc_hd__and4_2
  assign net_126 = (net_105&net_127&net_104&net_102);
  // u_6809: sky130_fd_sc_hd__and3_2
  assign net_192 = (net_163&net_160&net_161);
  // u_6822: sky130_fd_sc_hd__and4_2
  assign net_165 = (net_168&net_195&net_194&net_193);
  // u_8106: sky130_fd_sc_hd__inv_2
  assign net_699 = (!register_group_11_q[1]);
  // u_8197: sky130_fd_sc_hd__and2_2
  assign net_193 = (register_group_11_q[4]&net_699);
  // u_8218: sky130_fd_sc_hd__and2b_2
  assign net_102 = (!register_group_10_q[7]&register_group_10_q[2]);
  // u_8290: sky130_fd_sc_hd__inv_2
  assign net_938 = (!register_group_10_q[5]);
  // u_8325: sky130_fd_sc_hd__and2b_2
  assign net_105 = (!register_group_10_q[6]&register_group_10_q[3]);
  // u_8367: sky130_fd_sc_hd__and2_2
  assign net_127 = (register_group_10_q[1]&net_938);
  // u_8408: sky130_fd_sc_hd__and2b_2
  assign net_194 = (!register_group_11_q[2]&register_group_11_q[3]);
  // u_8575: sky130_fd_sc_hd__and2_2
  assign net_168 = (register_group_11_q[5]&net_635);
  // u_8590: sky130_fd_sc_hd__and2b_2
  assign net_195 = (!register_group_11_q[7]&register_group_11_q[0]);
  // u_8660: sky130_fd_sc_hd__inv_2
  assign net_635 = (!register_group_11_q[6]);

  // Destination D-pin vector.
  assign register_group_09_d[0] = net_2564;  // u_226.D / net_2564
  assign register_group_09_d[1] = net_2501;  // u_227.D / net_2501
  assign register_group_09_d[2] = net_2543;  // u_228.D / net_2543

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_09_q[0] <= 1'b0;
    else register_group_09_q[0] <= register_group_09_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_09_q[1] <= 1'b0;
    else register_group_09_q[1] <= register_group_09_d[1];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_09_q[2] <= 1'b0;
    else register_group_09_q[2] <= register_group_09_d[2];
  end
endmodule
