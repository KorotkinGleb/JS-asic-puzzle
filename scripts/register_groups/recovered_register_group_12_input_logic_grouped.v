// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_12_input_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire [2:0] register_group_09_q,  // inferred group; index order follows instance IDs
    input wire [3:0] register_group_02_q,  // inferred group; index order follows instance IDs
    input wire [7:0] register_group_12_q,  // inferred group; index order follows instance IDs
    input wire ff_4182_q,  // extracted net_1968
    output wire [7:0] register_group_12_d  // complete recovered destination D vector
);

  wire to_ff_2944_d;
  wire to_ff_2946_d;
  wire to_ff_2947_d;
  wire to_ff_2948_d;
  wire to_ff_2957_d;
  wire to_ff_2958_d;
  wire to_ff_2959_d;
  wire to_ff_2960_d;

  // Recovered D-pin mapping for register_group_12_q
  assign register_group_12_d[0] = to_ff_2944_d;  // u_2944.D / net_1913
  assign register_group_12_d[1] = to_ff_2946_d;  // u_2946.D / net_1927
  assign register_group_12_d[2] = to_ff_2947_d;  // u_2947.D / net_1713
  assign register_group_12_d[3] = to_ff_2948_d;  // u_2948.D / net_1767
  assign register_group_12_d[4] = to_ff_2957_d;  // u_2957.D / net_1850
  assign register_group_12_d[5] = to_ff_2958_d;  // u_2958.D / net_1851
  assign register_group_12_d[6] = to_ff_2959_d;  // u_2959.D / net_1844
  assign register_group_12_d[7] = to_ff_2960_d;  // u_2960.D / net_1730


  // register_group_02_q: state/counter register candidate; confidence=0.950
  //   [0] = u_234.Q (was ff_234_q, extracted net_751)
  //   [1] = u_235.Q (was ff_235_q, extracted net_762)
  //   [2] = u_236.Q (was ff_236_q, extracted net_749)
  //   [3] = u_237.Q (was ff_237_q, extracted net_848)

  // register_group_09_q: decoded state/register vector; confidence=0.847
  //   [0] = u_226.Q (was ff_226_q, extracted net_2329)
  //   unused bits in this cone: 1, 2

  // register_group_12_q: state/counter register candidate; confidence=0.819
  //   [0] = u_2944.Q (was ff_2944_q, extracted net_1950)
  //   [1] = u_2946.Q (was ff_2946_q, extracted net_1812)
  //   [2] = u_2947.Q (was ff_2947_q, extracted net_1715)
  //   [3] = u_2948.Q (was ff_2948_q, extracted net_1763)
  //   [4] = u_2957.Q (was ff_2957_q, extracted net_1806)
  //   [5] = u_2958.Q (was ff_2958_q, extracted net_1813)
  //   [6] = u_2959.Q (was ff_2959_q, extracted net_1675)
  //   [7] = u_2960.Q (was ff_2960_q, extracted net_1740)


  wire net_604;
  wire net_1612;
  wire net_1613;
  wire net_1621;
  wire net_1626;
  wire net_1634;
  wire net_1635;
  wire net_1671;
  wire net_1673;
  wire net_1683;
  wire net_1684;
  wire net_1725;
  wire net_1726;
  wire net_1731;
  wire net_1732;
  wire net_1781;
  wire net_1782;
  wire net_1787;
  wire net_1788;
  wire net_1789;
  wire net_1808;
  wire net_1814;
  wire net_1817;
  wire net_1846;
  wire net_1848;
  wire net_1849;
  wire net_1880;
  wire net_1882;
  wire net_1894;
  wire net_1911;
  wire net_1912;
  wire net_1915;
  wire net_1947;
  wire net_1958;
  wire net_1978;
  wire net_2016;
  wire net_2302;

  // to_ff_2947_d drives u_2947.D
  // to_ff_2960_d drives u_2960.D
  // to_ff_2948_d drives u_2948.D
  // to_ff_2959_d drives u_2959.D
  // to_ff_2957_d drives u_2957.D
  // to_ff_2958_d drives u_2958.D
  // to_ff_2944_d drives u_2944.D
  // to_ff_2946_d drives u_2946.D

  // or2_2: X=(A) | (B)
  sky130_fd_sc_hd__or2_2 u_142 (
      .A(register_group_12_q[4]),
      .B(net_1808),
      .X(net_1782)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_171 (
      .A1(net_1978),
      .A2(net_1683),
      .B1(net_2016),
      .Y(net_1958)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_173 (
      .A(register_group_12_q[4]),
      .B(net_1808),
      .Y(net_1788)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_198 (
      .A(register_group_09_q[0]),
      .B(net_2302),
      .X(net_1911)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_240 (
      .A(register_group_12_q[1]),
      .B(register_group_12_q[0]),
      .X(net_1947)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_353 (
      .A(register_group_02_q[3]),
      .B(register_group_02_q[0]),
      .C(register_group_02_q[2]),
      .D(register_group_02_q[1]),
      .Y(net_2302)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_743 (
      .A_N(net_604),
      .B(net_1911),
      .Y(net_2016)
  );

  // or2_2: X=(A) | (B)
  sky130_fd_sc_hd__or2_2 u_882 (
      .A(net_1911),
      .B(net_604),
      .X(net_1846)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_1166 (
      .A(net_2016),
      .B(net_1731),
      .Y(net_1915)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_2949 (
      .A(net_1814),
      .B(net_1817),
      .Y(net_1612)
  );

  // nor3b_2: Y=(!A&!B&C_N)
  sky130_fd_sc_hd__nor3b_2 u_2954 (
      .A(net_604),
      .B(net_1635),
      .C_N(net_1612),
      .Y(net_1634)
  );

  // a21boi_2: Y=(!A1&B1_N) | (!A2&B1_N)
  sky130_fd_sc_hd__a21boi_2 u_2956 (
      .A1(I),
      .A2(net_1612),
      .B1_N(net_604),
      .Y(net_1621)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_2963 (
      .A(register_group_12_q[2]),
      .B(net_1732),
      .Y(net_1731)
  );

  // a221o_2: X=(B1&B2) | (A1&A2) | (C1)
  sky130_fd_sc_hd__a221o_2 u_2965 (
      .A1(net_604),
      .A2(register_group_12_q[2]),
      .B1(register_group_12_q[7]),
      .B2(net_1882),
      .C1(net_1684),
      .X(to_ff_2960_d)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_2966 (
      .A_N(net_1673),
      .B(net_1613),
      .X(net_1849)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_2967 (
      .A(register_group_12_q[1]),
      .B(register_group_12_q[7]),
      .X(net_1732)
  );

  // a221o_2: X=(B1&B2) | (A1&A2) | (C1)
  sky130_fd_sc_hd__a221o_2 u_2969 (
      .A1(net_604),
      .A2(register_group_12_q[1]),
      .B1(net_1882),
      .B2(register_group_12_q[3]),
      .C1(net_1894),
      .X(to_ff_2948_d)
  );

  // a221o_2: X=(B1&B2) | (A1&A2) | (C1)
  sky130_fd_sc_hd__a221o_2 u_2972 (
      .A1(net_604),
      .A2(register_group_12_q[4]),
      .B1(net_1613),
      .B2(net_1635),
      .C1(net_1882),
      .X(net_1789)
  );

  // o22a_2: X=(A1&B1) | (A2&B1) | (A1&B2) | (A2&B2)
  sky130_fd_sc_hd__o22a_2 u_2973 (
      .A1(register_group_12_q[1]),
      .A2(net_1846),
      .B1(net_1634),
      .B2(net_1789),
      .X(to_ff_2946_d)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_2974 (
      .A1(net_1978),
      .A2(net_1683),
      .B1(net_1958),
      .X(net_1894)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_3012 (
      .A(register_group_12_q[6]),
      .B(net_1947),
      .Y(net_1635)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_3014 (
      .A(register_group_12_q[6]),
      .B(net_1808),
      .X(net_1673)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_3017 (
      .A(register_group_12_q[2]),
      .B(net_1814),
      .Y(net_1808)
  );

  // o21ai_2: Y=(!A1&!A2) | (!B1)
  sky130_fd_sc_hd__o21ai_2 u_3164 (
      .A1(I),
      .A2(net_1612),
      .B1(net_1621),
      .Y(net_1626)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_3167 (
      .A(register_group_12_q[6]),
      .B(register_group_12_q[3]),
      .X(net_1683)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_3191 (
      .A(net_1612),
      .B(net_2016),
      .Y(net_1684)
  );

  // and3b_2: X=(!A_N&B&C)
  sky130_fd_sc_hd__and3b_2 u_3277 (
      .A_N(net_604),
      .B(net_1612),
      .C(net_1673),
      .X(net_1671)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_3278 (
      .A(register_group_12_q[2]),
      .B(net_1726),
      .Y(net_1725)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_3281 (
      .A1(net_604),
      .A2(register_group_12_q[0]),
      .B1(net_1882),
      .X(net_1848)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_3282 (
      .A(register_group_12_q[4]),
      .B(register_group_12_q[5]),
      .Y(net_1726)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_3283 (
      .A(net_1726),
      .B(net_1947),
      .Y(net_1912)
  );

  // o32a_2: X=(A1&B1) | (A1&B2) | (A2&B1) | (A3&B1) | (A2&B2) | (A3&B2)
  sky130_fd_sc_hd__o32a_2 u_3284 (
      .A1(net_1849),
      .A2(net_1671),
      .A3(net_1848),
      .B1(net_1846),
      .B2(register_group_12_q[4]),
      .X(to_ff_2957_d)
  );

  // a221o_2: X=(B1&B2) | (A1&A2) | (C1)
  sky130_fd_sc_hd__a221o_2 u_3285 (
      .A1(net_604),
      .A2(register_group_12_q[6]),
      .B1(register_group_12_q[0]),
      .B2(net_1882),
      .C1(net_1915),
      .X(to_ff_2944_d)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_3289 (
      .A(register_group_12_q[3]),
      .B(register_group_12_q[1]),
      .Y(net_1814)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_3295 (
      .A(register_group_12_q[5]),
      .B(register_group_12_q[7]),
      .Y(net_1817)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_3296 (
      .A(register_group_12_q[4]),
      .B(register_group_12_q[0]),
      .X(net_1978)
  );

  // a22o_2: X=(B1&B2) | (A1&A2)
  sky130_fd_sc_hd__a22o_2 u_3477 (
      .A1(net_604),
      .A2(register_group_12_q[3]),
      .B1(register_group_12_q[5]),
      .B2(net_1882),
      .X(net_1880)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_3483 (
      .A(net_1911),
      .B(net_604),
      .Y(net_1882)
  );

  // a22o_2: X=(B1&B2) | (A1&A2)
  sky130_fd_sc_hd__a22o_2 u_3487 (
      .A1(net_604),
      .A2(register_group_12_q[5]),
      .B1(net_1882),
      .B2(register_group_12_q[2]),
      .X(net_1781)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_3489 (
      .A1(net_1787),
      .A2(net_1788),
      .A3(net_1782),
      .B1(net_1781),
      .X(to_ff_2947_d)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_3516 (
      .A1(net_1787),
      .A2(net_1912),
      .B1(net_1880),
      .X(to_ff_2958_d)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_3518 (
      .A_N(net_604),
      .B(net_1911),
      .X(net_1787)
  );

  // o221a_2: X=(A1&B1&C1) | (A2&B1&C1) | (A1&B2&C1) | (A2&B2&C1)
  sky130_fd_sc_hd__o221a_2 u_3587 (
      .A1(register_group_12_q[6]),
      .A2(net_1846),
      .B1(net_2016),
      .B2(net_1725),
      .C1(net_1626),
      .X(to_ff_2959_d)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_3821 (
      .A(net_604),
      .B(net_1612),
      .Y(net_1613)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

endmodule
