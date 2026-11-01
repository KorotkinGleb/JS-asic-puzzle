// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_15_input_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire [7:0] register_group_15_q,  // inferred group; index order follows instance IDs
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    output wire [7:0] register_group_15_d  // complete recovered destination D vector
);

  wire to_ff_1229_d;
  wire to_ff_1249_d;
  wire to_ff_1250_d;
  wire to_ff_1264_d;
  wire to_ff_1809_d;
  wire to_ff_2036_d;
  wire to_ff_2037_d;
  wire to_ff_2039_d;

  // Recovered D-pin mapping for register_group_15_q
  assign register_group_15_d[0] = to_ff_1229_d;  // u_1229.D / net_2240
  assign register_group_15_d[1] = to_ff_1249_d;  // u_1249.D / net_2075
  assign register_group_15_d[2] = to_ff_1250_d;  // u_1250.D / net_1997
  assign register_group_15_d[3] = to_ff_1264_d;  // u_1264.D / net_2160
  assign register_group_15_d[4] = to_ff_1809_d;  // u_1809.D / net_2243
  assign register_group_15_d[5] = to_ff_2036_d;  // u_2036.D / net_2132
  assign register_group_15_d[6] = to_ff_2037_d;  // u_2037.D / net_2097
  assign register_group_15_d[7] = to_ff_2039_d;  // u_2039.D / net_2011


  // register_group_03_q: state/counter register candidate; confidence=0.950
  //   [0] = u_4659.Q (was ff_4659_q, extracted net_1001)
  //   [1] = u_4661.Q (was ff_4661_q, extracted net_547)
  //   [2] = u_4662.Q (was ff_4662_q, extracted net_169)
  //   [3] = u_4838.Q (was ff_4838_q, extracted net_114)

  // register_group_15_q: state/counter register candidate; confidence=0.756
  //   [0] = u_1229.Q (was ff_1229_q, extracted net_2226)
  //   [1] = u_1249.Q (was ff_1249_q, extracted net_2101)
  //   [2] = u_1250.Q (was ff_1250_q, extracted net_1996)
  //   [3] = u_1264.Q (was ff_1264_q, extracted net_2157)
  //   [4] = u_1809.Q (was ff_1809_q, extracted net_2241)
  //   [5] = u_2036.Q (was ff_2036_q, extracted net_2155)
  //   [6] = u_2037.Q (was ff_2037_q, extracted net_2069)
  //   [7] = u_2039.Q (was ff_2039_q, extracted net_1998)


  wire net_604;
  wire net_1970;
  wire net_1971;
  wire net_1972;
  wire net_2008;
  wire net_2010;
  wire net_2070;
  wire net_2072;
  wire net_2073;
  wire net_2074;
  wire net_2129;
  wire net_2154;
  wire net_2184;
  wire net_2185;
  wire net_2229;
  wire net_2242;
  wire net_2245;
  wire net_2261;
  wire net_2280;

  // to_ff_1250_d drives u_1250.D
  // to_ff_2039_d drives u_2039.D
  // to_ff_1249_d drives u_1249.D
  // to_ff_2037_d drives u_2037.D
  // to_ff_2036_d drives u_2036.D
  // to_ff_1264_d drives u_1264.D
  // to_ff_1229_d drives u_1229.D
  // to_ff_1809_d drives u_1809.D

  // or4_2: X=(A) | (B) | (C) | (D)
  sky130_fd_sc_hd__or4_2 u_144 (
      .A(register_group_15_q[7]),
      .B(net_2008),
      .C(net_1972),
      .D(net_1971),
      .X(net_2010)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_145 (
      .A1(register_group_15_q[2]),
      .A2(net_1970),
      .B1(register_group_15_q[7]),
      .X(to_ff_2039_d)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_147 (
      .A1(register_group_15_q[2]),
      .A2(net_1970),
      .B1(net_2010),
      .X(to_ff_1250_d)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_1231 (
      .A(I),
      .B(net_604),
      .Y(net_2280)
  );

  // or4_2: X=(A) | (B) | (C) | (D)
  sky130_fd_sc_hd__or4_2 u_1244 (
      .A(register_group_15_q[0]),
      .B(net_2261),
      .C(net_2229),
      .D(net_2280),
      .X(net_2245)
  );

  // or4_2: X=(A) | (B) | (C) | (D)
  sky130_fd_sc_hd__or4_2 u_1252 (
      .A(register_group_15_q[1]),
      .B(net_2129),
      .C(net_2074),
      .D(net_2073),
      .X(net_2072)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_1255 (
      .A(I),
      .B(net_604),
      .Y(net_2073)
  );

  // or4b_2: X=(A) | (B) | (C) | (!D_N)
  sky130_fd_sc_hd__or4b_2 u_1770 (
      .A(register_group_03_q[2]),
      .B(register_group_03_q[1]),
      .C(register_group_03_q[0]),
      .D_N(register_group_03_q[3]),
      .X(net_2074)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_1777 (
      .A1(register_group_15_q[4]),
      .A2(net_2242),
      .B1(register_group_15_q[0]),
      .X(to_ff_1229_d)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_1780 (
      .A1(register_group_15_q[5]),
      .A2(net_2154),
      .B1(net_2184),
      .X(to_ff_1264_d)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_1781 (
      .A1(register_group_15_q[4]),
      .A2(net_2242),
      .B1(net_2245),
      .X(to_ff_1809_d)
  );

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_1788 (
      .A_N(register_group_03_q[1]),
      .B_N(register_group_03_q[0]),
      .C(register_group_03_q[2]),
      .D(register_group_03_q[3]),
      .X(net_2185)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_1792 (
      .A_N(register_group_15_q[5]),
      .B(net_2154),
      .Y(to_ff_2036_d)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_1795 (
      .A1(register_group_15_q[6]),
      .A2(net_2070),
      .B1(net_2072),
      .X(to_ff_2037_d)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_1796 (
      .A1(register_group_15_q[6]),
      .A2(net_2070),
      .B1(register_group_15_q[1]),
      .X(to_ff_1249_d)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_1798 (
      .A(net_2229),
      .B(net_2280),
      .Y(net_2242)
  );

  // or4b_2: X=(A) | (B) | (C) | (!D_N)
  sky130_fd_sc_hd__or4b_2 u_1803 (
      .A(register_group_03_q[3]),
      .B(register_group_03_q[2]),
      .C(register_group_03_q[1]),
      .D_N(register_group_03_q[0]),
      .X(net_2229)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_1968 (
      .A(register_group_15_q[4]),
      .Y(net_2261)
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

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_2034 (
      .A(I),
      .B(net_604),
      .C(register_group_15_q[3]),
      .D(net_2185),
      .Y(net_2154)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_2049 (
      .A1(I),
      .A2(net_604),
      .A3(net_2185),
      .B1(register_group_15_q[3]),
      .X(net_2184)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_2143 (
      .A(net_2074),
      .B(net_2073),
      .Y(net_2070)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_2359 (
      .A(net_1972),
      .B(net_1971),
      .Y(net_1970)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_2370 (
      .A(I),
      .B(net_604),
      .Y(net_1971)
  );

  // or4b_2: X=(A) | (B) | (C) | (!D_N)
  sky130_fd_sc_hd__or4b_2 u_2396 (
      .A(register_group_03_q[3]),
      .B(register_group_03_q[1]),
      .C(register_group_03_q[0]),
      .D_N(register_group_03_q[2]),
      .X(net_1972)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

endmodule
