// Structural state block recovered from GDS connectivity.
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
    output wire [2:0] register_09  // recovered current state
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

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__or2_2 u_395 (
      .A(register_16),
      .B(register_09[0]),
      .X(net_2564)
  );

  sky130_fd_sc_hd__nand2b_2 u_406 (
      .A_N(register_09[0]),
      .B(register_16),
      .Y(net_2520)
  );

  sky130_fd_sc_hd__and2b_2 u_1262 (
      .A_N(register_13[0]),
      .B(register_13[3]),
      .X(net_1505)
  );

  sky130_fd_sc_hd__and2b_2 u_1376 (
      .A_N(register_14[2]),
      .B(register_14[3]),
      .X(net_1509)
  );

  sky130_fd_sc_hd__inv_2 u_1425 (
      .A(register_13[2]),
      .Y(net_2490)
  );

  sky130_fd_sc_hd__and2b_2 u_1591 (
      .A_N(register_13[1]),
      .B(register_13[5]),
      .X(net_1501)
  );

  sky130_fd_sc_hd__and2b_2 u_1630 (
      .A_N(register_14[1]),
      .B(register_14[5]),
      .X(net_1507)
  );

  sky130_fd_sc_hd__and2b_2 u_1775 (
      .A_N(register_14[0]),
      .B(register_14[4]),
      .X(net_1510)
  );

  sky130_fd_sc_hd__inv_2 u_1968 (
      .A(register_15[4]),
      .Y(net_2261)
  );

  sky130_fd_sc_hd__inv_2 u_2012 (
      .A(register_15[6]),
      .Y(net_2129)
  );

  sky130_fd_sc_hd__inv_2 u_2013 (
      .A(register_15[2]),
      .Y(net_2008)
  );

  sky130_fd_sc_hd__and2b_2 u_2107 (
      .A_N(register_15[3]),
      .B(register_15[5]),
      .X(net_1541)
  );

  sky130_fd_sc_hd__and2b_2 u_2364 (
      .A_N(register_05[0]),
      .B(register_05[1]),
      .X(net_1542)
  );

  sky130_fd_sc_hd__and2b_2 u_2555 (
      .A_N(register_08[2]),
      .B(register_08[0]),
      .X(net_163)
  );

  sky130_fd_sc_hd__and2b_2 u_2571 (
      .A_N(register_08[3]),
      .B(register_08[1]),
      .X(net_161)
  );

  sky130_fd_sc_hd__inv_2 u_2711 (
      .A(register_08[4]),
      .Y(net_1163)
  );

  sky130_fd_sc_hd__and2b_2 u_2843 (
      .A_N(register_10[0]),
      .B(register_10[4]),
      .X(net_104)
  );

  sky130_fd_sc_hd__inv_2 u_5532 (
      .A(register_17),
      .Y(net_1361)
  );

  sky130_fd_sc_hd__or3_2 u_5612 (
      .A(register_07[3]),
      .B(register_07[0]),
      .C(register_07[4]),
      .X(net_480)
  );

  sky130_fd_sc_hd__inv_2 u_5836 (
      .A(register_06[1]),
      .Y(net_855)
  );

  sky130_fd_sc_hd__inv_2 u_8106 (
      .A(register_11[1]),
      .Y(net_699)
  );

  sky130_fd_sc_hd__and2b_2 u_8218 (
      .A_N(register_10[7]),
      .B(register_10[2]),
      .X(net_102)
  );

  sky130_fd_sc_hd__inv_2 u_8290 (
      .A(register_10[5]),
      .Y(net_938)
  );

  sky130_fd_sc_hd__and2b_2 u_8325 (
      .A_N(register_10[6]),
      .B(register_10[3]),
      .X(net_105)
  );

  sky130_fd_sc_hd__and2b_2 u_8408 (
      .A_N(register_11[2]),
      .B(register_11[3]),
      .X(net_194)
  );

  sky130_fd_sc_hd__and2b_2 u_8590 (
      .A_N(register_11[7]),
      .B(register_11[0]),
      .X(net_195)
  );

  sky130_fd_sc_hd__inv_2 u_8660 (
      .A(register_11[6]),
      .Y(net_635)
  );

  sky130_fd_sc_hd__and2_2 u_1560 (
      .A(register_13[4]),
      .B(net_2490),
      .X(net_1502)
  );

  sky130_fd_sc_hd__and2_2 u_1776 (
      .A(register_15[0]),
      .B(net_2261),
      .X(net_1504)
  );

  sky130_fd_sc_hd__and2_2 u_1794 (
      .A(register_15[1]),
      .B(net_2129),
      .X(net_1538)
  );

  sky130_fd_sc_hd__and2_2 u_1982 (
      .A(register_15[7]),
      .B(net_2008),
      .X(net_1543)
  );

  sky130_fd_sc_hd__and2_2 u_2561 (
      .A(register_08[5]),
      .B(net_1163),
      .X(net_160)
  );

  sky130_fd_sc_hd__inv_2 u_247 (
      .A(net_1361),
      .Y(net_2522)
  );

  sky130_fd_sc_hd__nor3_2 u_5616 (
      .A(register_07[5]),
      .B(register_07[7]),
      .C(net_480),
      .Y(net_340)
  );

  sky130_fd_sc_hd__and2_2 u_8197 (
      .A(register_11[4]),
      .B(net_699),
      .X(net_193)
  );

  sky130_fd_sc_hd__and2_2 u_8367 (
      .A(register_10[1]),
      .B(net_938),
      .X(net_127)
  );

  sky130_fd_sc_hd__and2_2 u_8575 (
      .A(register_11[5]),
      .B(net_635),
      .X(net_168)
  );

  sky130_fd_sc_hd__and3_2 u_5230 (
      .A(net_1505),
      .B(net_1502),
      .C(net_1501),
      .X(net_1500)
  );

  sky130_fd_sc_hd__and4_2 u_5225 (
      .A(net_1510),
      .B(net_1504),
      .C(net_1509),
      .D(net_1507),
      .X(net_1506)
  );

  sky130_fd_sc_hd__and4_2 u_5010 (
      .A(net_1543),
      .B(net_1542),
      .C(net_1541),
      .D(net_1538),
      .X(net_1539)
  );

  sky130_fd_sc_hd__and3_2 u_6809 (
      .A(net_163),
      .B(net_160),
      .C(net_161),
      .X(net_192)
  );

  sky130_fd_sc_hd__and4_2 u_6298 (
      .A(register_07[2]),
      .B(register_07[1]),
      .C(register_07[6]),
      .D(net_340),
      .X(net_367)
  );

  sky130_fd_sc_hd__and4_2 u_6806 (
      .A(net_105),
      .B(net_127),
      .C(net_104),
      .D(net_102),
      .X(net_126)
  );

  sky130_fd_sc_hd__and4_2 u_6822 (
      .A(net_168),
      .B(net_195),
      .C(net_194),
      .D(net_193),
      .X(net_165)
  );

  sky130_fd_sc_hd__and3_2 u_5013 (
      .A(net_1506),
      .B(net_1539),
      .C(net_1500),
      .X(net_1573)
  );

  sky130_fd_sc_hd__and2_2 u_460 (
      .A(net_855),
      .B(net_367),
      .X(net_2487)
  );

  sky130_fd_sc_hd__and3_2 u_6802 (
      .A(net_126),
      .B(net_165),
      .C(net_192),
      .X(net_164)
  );

  sky130_fd_sc_hd__and4b_2 u_450 (
      .A_N(register_09[0]),
      .B(register_16),
      .C(net_164),
      .D(net_1573),
      .X(net_2542)
  );

  sky130_fd_sc_hd__a32o_2 u_233 (
      .A1(net_1361),
      .A2(net_2487),
      .A3(net_2542),
      .B1(register_09[2]),
      .B2(net_2520),
      .X(net_2543)
  );

  sky130_fd_sc_hd__a32o_2 u_399 (
      .A1(net_2522),
      .A2(net_2487),
      .A3(net_2542),
      .B1(register_09[1]),
      .B2(net_2520),
      .X(net_2501)
  );

  // Recovered sequential standard-cell instances.
  // register_09: decoded state/register vector
  sky130_fd_sc_hd__dfrtp_2 u_226_state (
      .CLK(clk),
      .D(net_2564),
      .RESET_B(rst_n),
      .Q(register_09[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_227_state (
      .CLK(clk),
      .D(net_2501),
      .RESET_B(rst_n),
      .Q(register_09[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_228_state (
      .CLK(clk),
      .D(net_2543),
      .RESET_B(rst_n),
      .Q(register_09[2])
  );

endmodule
