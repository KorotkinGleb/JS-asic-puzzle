// Stateful RTL recovered by merging every FF.D backward cone.
// register_09: 3 bit(s), decoded state/register vector.
module recovered_register_09 (
    input wire clk,
    input wire rst_n,
    input wire [1:0] register_05,  // recovered register boundary
    input wire [2:0] register_06,  // recovered register boundary
    input wire [7:0] register_07,  // recovered register boundary
    input wire [5:0] register_08,  // recovered register boundary
    input wire [7:0] register_10,  // recovered register boundary
    input wire [7:0] register_11,  // recovered register boundary
    input wire [5:0] register_13,  // recovered register boundary
    input wire [5:0] register_14,  // recovered register boundary
    input wire [7:0] register_15,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    input wire register_17,  // recovered register boundary
    output reg [2:0] register_09  // recovered current state
);

  // Physical-bit mapping.
  // register_09[0] = u_226.Q / net_2329; D=net_2564
  // register_09[1] = u_227.Q / net_2403; D=net_2501
  // register_09[2] = u_228.Q / net_2380; D=net_2543

  // Extracted combinational nets.
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

  // Liberty Boolean functions recovered from standard cells.
  // u_395: sky130_fd_sc_hd__or2_2
  assign net_2564 = (register_16) | (register_09[0]);
  // u_406: sky130_fd_sc_hd__nand2b_2
  assign net_2520 = (register_09[0]) | (!register_16);
  // u_1262: sky130_fd_sc_hd__and2b_2
  assign net_1505 = (!register_13[0]&register_13[3]);
  // u_1376: sky130_fd_sc_hd__and2b_2
  assign net_1509 = (!register_14[2]&register_14[3]);
  // u_1425: sky130_fd_sc_hd__inv_2
  assign net_2490 = (!register_13[2]);
  // u_1591: sky130_fd_sc_hd__and2b_2
  assign net_1501 = (!register_13[1]&register_13[5]);
  // u_1630: sky130_fd_sc_hd__and2b_2
  assign net_1507 = (!register_14[1]&register_14[5]);
  // u_1775: sky130_fd_sc_hd__and2b_2
  assign net_1510 = (!register_14[0]&register_14[4]);
  // u_1968: sky130_fd_sc_hd__inv_2
  assign net_2261 = (!register_15[4]);
  // u_2012: sky130_fd_sc_hd__inv_2
  assign net_2129 = (!register_15[6]);
  // u_2013: sky130_fd_sc_hd__inv_2
  assign net_2008 = (!register_15[2]);
  // u_2107: sky130_fd_sc_hd__and2b_2
  assign net_1541 = (!register_15[3]&register_15[5]);
  // u_2364: sky130_fd_sc_hd__and2b_2
  assign net_1542 = (!register_05[0]&register_05[1]);
  // u_2555: sky130_fd_sc_hd__and2b_2
  assign net_163 = (!register_08[2]&register_08[0]);
  // u_2571: sky130_fd_sc_hd__and2b_2
  assign net_161 = (!register_08[3]&register_08[1]);
  // u_2711: sky130_fd_sc_hd__inv_2
  assign net_1163 = (!register_08[4]);
  // u_2843: sky130_fd_sc_hd__and2b_2
  assign net_104 = (!register_10[0]&register_10[4]);
  // u_5532: sky130_fd_sc_hd__inv_2
  assign net_1361 = (!register_17);
  // u_5612: sky130_fd_sc_hd__or3_2
  assign net_480 = (register_07[3]) | (register_07[0]) | (register_07[4]);
  // u_5836: sky130_fd_sc_hd__inv_2
  assign net_855 = (!register_06[1]);
  // u_8106: sky130_fd_sc_hd__inv_2
  assign net_699 = (!register_11[1]);
  // u_8218: sky130_fd_sc_hd__and2b_2
  assign net_102 = (!register_10[7]&register_10[2]);
  // u_8290: sky130_fd_sc_hd__inv_2
  assign net_938 = (!register_10[5]);
  // u_8325: sky130_fd_sc_hd__and2b_2
  assign net_105 = (!register_10[6]&register_10[3]);
  // u_8408: sky130_fd_sc_hd__and2b_2
  assign net_194 = (!register_11[2]&register_11[3]);
  // u_8590: sky130_fd_sc_hd__and2b_2
  assign net_195 = (!register_11[7]&register_11[0]);
  // u_8660: sky130_fd_sc_hd__inv_2
  assign net_635 = (!register_11[6]);
  // u_1560: sky130_fd_sc_hd__and2_2
  assign net_1502 = (register_13[4]&net_2490);
  // u_1776: sky130_fd_sc_hd__and2_2
  assign net_1504 = (register_15[0]&net_2261);
  // u_1794: sky130_fd_sc_hd__and2_2
  assign net_1538 = (register_15[1]&net_2129);
  // u_1982: sky130_fd_sc_hd__and2_2
  assign net_1543 = (register_15[7]&net_2008);
  // u_2561: sky130_fd_sc_hd__and2_2
  assign net_160 = (register_08[5]&net_1163);
  // u_247: sky130_fd_sc_hd__inv_2
  assign net_2522 = (!net_1361);
  // u_5616: sky130_fd_sc_hd__nor3_2
  assign net_340 = (!register_07[5]&!register_07[7]&!net_480);
  // u_8197: sky130_fd_sc_hd__and2_2
  assign net_193 = (register_11[4]&net_699);
  // u_8367: sky130_fd_sc_hd__and2_2
  assign net_127 = (register_10[1]&net_938);
  // u_8575: sky130_fd_sc_hd__and2_2
  assign net_168 = (register_11[5]&net_635);
  // u_5230: sky130_fd_sc_hd__and3_2
  assign net_1500 = (net_1505&net_1502&net_1501);
  // u_5225: sky130_fd_sc_hd__and4_2
  assign net_1506 = (net_1510&net_1504&net_1509&net_1507);
  // u_5010: sky130_fd_sc_hd__and4_2
  assign net_1539 = (net_1543&net_1542&net_1541&net_1538);
  // u_6809: sky130_fd_sc_hd__and3_2
  assign net_192 = (net_163&net_160&net_161);
  // u_6298: sky130_fd_sc_hd__and4_2
  assign net_367 = (register_07[2]&register_07[1]&register_07[6]&net_340);
  // u_6806: sky130_fd_sc_hd__and4_2
  assign net_126 = (net_105&net_127&net_104&net_102);
  // u_6822: sky130_fd_sc_hd__and4_2
  assign net_165 = (net_168&net_195&net_194&net_193);
  // u_5013: sky130_fd_sc_hd__and3_2
  assign net_1573 = (net_1506&net_1539&net_1500);
  // u_460: sky130_fd_sc_hd__and2_2
  assign net_2487 = (net_855&net_367);
  // u_6802: sky130_fd_sc_hd__and3_2
  assign net_164 = (net_126&net_165&net_192);
  // u_450: sky130_fd_sc_hd__and4b_2
  assign net_2542 = (!register_09[0]&register_16&net_164&net_1573);
  // u_233: sky130_fd_sc_hd__a32o_2
  assign net_2543 = (net_1361&net_2487&net_2542) | (register_09[2]&net_2520);
  // u_399: sky130_fd_sc_hd__a32o_2
  assign net_2501 = (net_2522&net_2487&net_2542) | (register_09[1]&net_2520);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_09: decoded state/register vector
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_09[0] <= 1'b0;
    else register_09[0] <= net_2564;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_09[1] <= 1'b0;
    else register_09[1] <= net_2501;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_09[2] <= 1'b0;
    else register_09[2] <= net_2543;
  end

endmodule
