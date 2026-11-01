// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: shift Q taps -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_ff_5337_output_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire [5:0] register_group_14_q,  // inferred group; index order follows instance IDs
    input wire [7:0] register_group_15_q,  // inferred group; index order follows instance IDs
    input wire [5:0] register_group_13_q,  // inferred group; index order follows instance IDs
    input wire [2:0] register_group_09_q,  // inferred group; index order follows instance IDs
    input wire [1:0] register_group_05_q,  // inferred group; index order follows instance IDs
    input wire [5:0] register_group_08_q,  // inferred group; index order follows instance IDs
    input wire [7:0] register_group_10_q,  // inferred group; index order follows instance IDs
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    input wire [11:0] shift_register_q,  // verified shift order
    input wire ff_5337_q,  // extracted net_1360
    input wire [2:0] register_group_06_q,  // inferred group; index order follows instance IDs
    input wire [7:0] register_group_07_q,  // inferred group; index order follows instance IDs
    input wire [7:0] register_group_11_q,  // inferred group; index order follows instance IDs
    output wire to_ff_227_d,  // extracted net_2501
    output wire to_ff_228_d,  // extracted net_2543
    output wire to_ff_5337_d  // extracted net_1466
);

  // shift_register_q: verified shift register; confidence=1.000
  //   [0] = u_5000.Q (was ff_5000_q, extracted net_1577)
  //   [9] = u_5344.Q (was ff_5344_q, extracted net_1308)
  //   [10] = u_5339.Q (was ff_5339_q, extracted net_1358)
  //   [11] = u_5336.Q (was ff_5336_q, extracted net_1512)
  //   unused bits in this cone: 1, 2, 3, 4, 5, 6, 7, 8

  // register_group_03_q: state/counter register candidate; confidence=0.950
  //   [0] = u_4659.Q (was ff_4659_q, extracted net_1001)
  //   [1] = u_4661.Q (was ff_4661_q, extracted net_547)
  //   [2] = u_4662.Q (was ff_4662_q, extracted net_169)
  //   [3] = u_4838.Q (was ff_4838_q, extracted net_114)

  // register_group_05_q: state/counter register candidate; confidence=0.950
  //   [0] = u_2293.Q (was ff_2293_q, extracted net_1805)
  //   [1] = u_2372.Q (was ff_2372_q, extracted net_1797)

  // register_group_06_q: state/counter register candidate; confidence=0.933
  //   [1] = u_5638.Q (was ff_5638_q, extracted net_828)
  //   unused bits in this cone: 0, 2

  // register_group_07_q: state/counter register candidate; confidence=0.918
  //   [0] = u_6095.Q (was ff_6095_q, extracted net_433)
  //   [1] = u_6106.Q (was ff_6106_q, extracted net_342)
  //   [2] = u_6109.Q (was ff_6109_q, extracted net_338)
  //   [3] = u_6111.Q (was ff_6111_q, extracted net_603)
  //   [4] = u_6159.Q (was ff_6159_q, extracted net_534)
  //   [5] = u_6197.Q (was ff_6197_q, extracted net_415)
  //   [6] = u_6198.Q (was ff_6198_q, extracted net_339)
  //   [7] = u_6199.Q (was ff_6199_q, extracted net_484)

  // register_group_08_q: state/counter register candidate; confidence=0.895
  //   [0] = u_2299.Q (was ff_2299_q, extracted net_1193)
  //   [1] = u_2301.Q (was ff_2301_q, extracted net_1379)
  //   [2] = u_2542.Q (was ff_2542_q, extracted net_1187)
  //   [3] = u_2574.Q (was ff_2574_q, extracted net_1325)
  //   [4] = u_2708.Q (was ff_2708_q, extracted net_1165)
  //   [5] = u_2710.Q (was ff_2710_q, extracted net_1164)

  // register_group_09_q: decoded state/register vector; confidence=0.847
  //   [0] = u_226.Q (was ff_226_q, extracted net_2329)
  //   [1] = u_227.Q (was ff_227_q, extracted net_2403)
  //   [2] = u_228.Q (was ff_228_q, extracted net_2380)

  // register_group_10_q: state/counter register candidate; confidence=0.844
  //   [0] = u_2709.Q (was ff_2709_q, extracted net_1129)
  //   [1] = u_8085.Q (was ff_8085_q, extracted net_837)
  //   [2] = u_8086.Q (was ff_8086_q, extracted net_1012)
  //   [3] = u_8090.Q (was ff_8090_q, extracted net_942)
  //   [4] = u_8091.Q (was ff_8091_q, extracted net_1110)
  //   [5] = u_8199.Q (was ff_8199_q, extracted net_839)
  //   [6] = u_8214.Q (was ff_8214_q, extracted net_796)
  //   [7] = u_8219.Q (was ff_8219_q, extracted net_1031)

  // register_group_11_q: state/counter register candidate; confidence=0.830
  //   [0] = u_8084.Q (was ff_8084_q, extracted net_492)
  //   [1] = u_8092.Q (was ff_8092_q, extracted net_657)
  //   [2] = u_8095.Q (was ff_8095_q, extracted net_707)
  //   [3] = u_8429.Q (was ff_8429_q, extracted net_717)
  //   [4] = u_8431.Q (was ff_8431_q, extracted net_698)
  //   [5] = u_8591.Q (was ff_8591_q, extracted net_636)
  //   [6] = u_8602.Q (was ff_8602_q, extracted net_658)
  //   [7] = u_8815.Q (was ff_8815_q, extracted net_582)

  // register_group_13_q: state/counter register candidate; confidence=0.797
  //   [0] = u_1259.Q (was ff_1259_q, extracted net_2532)
  //   [1] = u_1260.Q (was ff_1260_q, extracted net_2581)
  //   [2] = u_1261.Q (was ff_1261_q, extracted net_2512)
  //   [3] = u_1383.Q (was ff_1383_q, extracted net_2493)
  //   [4] = u_1384.Q (was ff_1384_q, extracted net_2511)
  //   [5] = u_1385.Q (was ff_1385_q, extracted net_2579)

  // register_group_14_q: state/counter register candidate; confidence=0.793
  //   [0] = u_1228.Q (was ff_1228_q, extracted net_2276)
  //   [1] = u_1230.Q (was ff_1230_q, extracted net_2347)
  //   [2] = u_1258.Q (was ff_1258_q, extracted net_2443)
  //   [3] = u_1626.Q (was ff_1626_q, extracted net_2442)
  //   [4] = u_1808.Q (was ff_1808_q, extracted net_2273)
  //   [5] = u_1810.Q (was ff_1810_q, extracted net_2346)

  // register_group_15_q: state/counter register candidate; confidence=0.756
  //   [0] = u_1229.Q (was ff_1229_q, extracted net_2226)
  //   [1] = u_1249.Q (was ff_1249_q, extracted net_2101)
  //   [2] = u_1250.Q (was ff_1250_q, extracted net_1996)
  //   [3] = u_1264.Q (was ff_1264_q, extracted net_2157)
  //   [4] = u_1809.Q (was ff_1809_q, extracted net_2241)
  //   [5] = u_2036.Q (was ff_2036_q, extracted net_2155)
  //   [6] = u_2037.Q (was ff_2037_q, extracted net_2069)
  //   [7] = u_2039.Q (was ff_2039_q, extracted net_1998)


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
  wire net_604;
  wire net_635;
  wire net_699;
  wire net_855;
  wire net_938;
  wire net_978;
  wire net_1002;
  wire net_1029;
  wire net_1163;
  wire net_1361;
  wire net_1454;
  wire net_1456;
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
  wire net_2520;
  wire net_2522;
  wire net_2542;

  // to_ff_5337_d drives u_5337.D
  // to_ff_227_d drives u_227.D
  // to_ff_228_d drives u_228.D

  // a32o_2: X=(A1&A2&A3) | (B1&B2)
  sky130_fd_sc_hd__a32o_2 u_233 (
      .A1(net_1361),
      .A2(net_2487),
      .A3(net_2542),
      .B1(register_group_09_q[2]),
      .B2(net_2520),
      .X(to_ff_228_d)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_247 (
      .A(net_1361),
      .Y(net_2522)
  );

  // a32o_2: X=(A1&A2&A3) | (B1&B2)
  sky130_fd_sc_hd__a32o_2 u_399 (
      .A1(net_2522),
      .A2(net_2487),
      .A3(net_2542),
      .B1(register_group_09_q[1]),
      .B2(net_2520),
      .X(to_ff_227_d)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_406 (
      .A_N(register_group_09_q[0]),
      .B(ff_4182_q),
      .Y(net_2520)
  );

  // and4b_2: X=(!A_N&B&C&D)
  sky130_fd_sc_hd__and4b_2 u_450 (
      .A_N(register_group_09_q[0]),
      .B(ff_4182_q),
      .C(net_164),
      .D(net_1573),
      .X(net_2542)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_460 (
      .A(net_855),
      .B(net_367),
      .X(net_2487)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_1262 (
      .A_N(register_group_13_q[0]),
      .B(register_group_13_q[3]),
      .X(net_1505)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_1376 (
      .A_N(register_group_14_q[2]),
      .B(register_group_14_q[3]),
      .X(net_1509)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_1425 (
      .A(register_group_13_q[2]),
      .Y(net_2490)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_1560 (
      .A(register_group_13_q[4]),
      .B(net_2490),
      .X(net_1502)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_1591 (
      .A_N(register_group_13_q[1]),
      .B(register_group_13_q[5]),
      .X(net_1501)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_1630 (
      .A_N(register_group_14_q[1]),
      .B(register_group_14_q[5]),
      .X(net_1507)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_1775 (
      .A_N(register_group_14_q[0]),
      .B(register_group_14_q[4]),
      .X(net_1510)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_1776 (
      .A(register_group_15_q[0]),
      .B(net_2261),
      .X(net_1504)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_1794 (
      .A(register_group_15_q[1]),
      .B(net_2129),
      .X(net_1538)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_1968 (
      .A(register_group_15_q[4]),
      .Y(net_2261)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_1982 (
      .A(register_group_15_q[7]),
      .B(net_2008),
      .X(net_1543)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_2012 (
      .A(register_group_15_q[6]),
      .Y(net_2129)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_2013 (
      .A(register_group_15_q[2]),
      .Y(net_2008)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_2107 (
      .A_N(register_group_15_q[3]),
      .B(register_group_15_q[5]),
      .X(net_1541)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_2364 (
      .A_N(register_group_05_q[0]),
      .B(register_group_05_q[1]),
      .X(net_1542)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_2555 (
      .A_N(register_group_08_q[2]),
      .B(register_group_08_q[0]),
      .X(net_163)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_2561 (
      .A(register_group_08_q[5]),
      .B(net_1163),
      .X(net_160)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_2571 (
      .A_N(register_group_08_q[3]),
      .B(register_group_08_q[1]),
      .X(net_161)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_2711 (
      .A(register_group_08_q[4]),
      .Y(net_1163)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_2843 (
      .A_N(register_group_10_q[0]),
      .B(register_group_10_q[4]),
      .X(net_104)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

  // a22o_2: X=(B1&B2) | (A1&A2)
  sky130_fd_sc_hd__a22o_2 u_4999 (
      .A1(net_1029),
      .A2(shift_register_q[0]),
      .B1(net_978),
      .B2(shift_register_q[11]),
      .X(net_1456)
  );

  // and4_2: X=(A&B&C&D)
  sky130_fd_sc_hd__and4_2 u_5010 (
      .A(net_1543),
      .B(net_1542),
      .C(net_1541),
      .D(net_1538),
      .X(net_1539)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_5013 (
      .A(net_1506),
      .B(net_1539),
      .C(net_1500),
      .X(net_1573)
  );

  // and4_2: X=(A&B&C&D)
  sky130_fd_sc_hd__and4_2 u_5225 (
      .A(net_1510),
      .B(net_1504),
      .C(net_1509),
      .D(net_1507),
      .X(net_1506)
  );

  // a221o_2: X=(B1&B2) | (A1&A2) | (C1)
  sky130_fd_sc_hd__a221o_2 u_5229 (
      .A1(net_1002),
      .A2(shift_register_q[9]),
      .B1(1'b1),
      .B2(shift_register_q[10]),
      .C1(net_1456),
      .X(net_1454)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_5230 (
      .A(net_1505),
      .B(net_1502),
      .C(net_1501),
      .X(net_1500)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_5256 (
      .A1(I),
      .A2(net_604),
      .A3(net_1454),
      .B1(ff_5337_q),
      .X(to_ff_5337_d)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_5532 (
      .A(ff_5337_q),
      .Y(net_1361)
  );

  // or3_2: X=(A) | (B) | (C)
  sky130_fd_sc_hd__or3_2 u_5612 (
      .A(register_group_07_q[3]),
      .B(register_group_07_q[0]),
      .C(register_group_07_q[4]),
      .X(net_480)
  );

  // nor3_2: Y=(!A&!B&!C)
  sky130_fd_sc_hd__nor3_2 u_5616 (
      .A(register_group_07_q[5]),
      .B(register_group_07_q[7]),
      .C(net_480),
      .Y(net_340)
  );

  // or4bb_2: X=(A) | (B) | (!C_N) | (!D_N)
  sky130_fd_sc_hd__or4bb_2 u_5680 (
      .A(register_group_03_q[2]),
      .B(register_group_03_q[0]),
      .C_N(register_group_03_q[1]),
      .D_N(register_group_03_q[3]),
      .X(net_1002)
  );

  // or4_2: X=(A) | (B) | (C) | (D)
  sky130_fd_sc_hd__or4_2 u_5681 (
      .A(register_group_03_q[2]),
      .B(register_group_03_q[3]),
      .C(register_group_03_q[0]),
      .D(register_group_03_q[1]),
      .X(net_1029)
  );

  // buf_2: X=(A)
  sky130_fd_sc_hd__buf_2 u_5789 (
      .A(net_1029),
      .X(net_978)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_5836 (
      .A(register_group_06_q[1]),
      .Y(net_855)
  );

  // and4_2: X=(A&B&C&D)
  sky130_fd_sc_hd__and4_2 u_6298 (
      .A(register_group_07_q[2]),
      .B(register_group_07_q[1]),
      .C(register_group_07_q[6]),
      .D(net_340),
      .X(net_367)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_6802 (
      .A(net_126),
      .B(net_165),
      .C(net_192),
      .X(net_164)
  );

  // and4_2: X=(A&B&C&D)
  sky130_fd_sc_hd__and4_2 u_6806 (
      .A(net_105),
      .B(net_127),
      .C(net_104),
      .D(net_102),
      .X(net_126)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_6809 (
      .A(net_163),
      .B(net_160),
      .C(net_161),
      .X(net_192)
  );

  // and4_2: X=(A&B&C&D)
  sky130_fd_sc_hd__and4_2 u_6822 (
      .A(net_168),
      .B(net_195),
      .C(net_194),
      .D(net_193),
      .X(net_165)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_8106 (
      .A(register_group_11_q[1]),
      .Y(net_699)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_8197 (
      .A(register_group_11_q[4]),
      .B(net_699),
      .X(net_193)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_8218 (
      .A_N(register_group_10_q[7]),
      .B(register_group_10_q[2]),
      .X(net_102)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_8290 (
      .A(register_group_10_q[5]),
      .Y(net_938)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_8325 (
      .A_N(register_group_10_q[6]),
      .B(register_group_10_q[3]),
      .X(net_105)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_8367 (
      .A(register_group_10_q[1]),
      .B(net_938),
      .X(net_127)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_8408 (
      .A_N(register_group_11_q[2]),
      .B(register_group_11_q[3]),
      .X(net_194)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_8575 (
      .A(register_group_11_q[5]),
      .B(net_635),
      .X(net_168)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_8590 (
      .A_N(register_group_11_q[7]),
      .B(register_group_11_q[0]),
      .X(net_195)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_8660 (
      .A(register_group_11_q[6]),
      .Y(net_635)
  );

endmodule
