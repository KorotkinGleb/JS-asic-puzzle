// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_14_input_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire [5:0] register_group_14_q,  // inferred group; index order follows instance IDs
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    output wire [5:0] register_group_14_d  // complete recovered destination D vector
);

  wire to_ff_1228_d;
  wire to_ff_1230_d;
  wire to_ff_1258_d;
  wire to_ff_1626_d;
  wire to_ff_1808_d;
  wire to_ff_1810_d;

  // Recovered D-pin mapping for register_group_14_q
  assign register_group_14_d[0] = to_ff_1228_d;  // u_1228.D / net_2307
  assign register_group_14_d[1] = to_ff_1230_d;  // u_1230.D / net_2354
  assign register_group_14_d[2] = to_ff_1258_d;  // u_1258.D / net_2438
  assign register_group_14_d[3] = to_ff_1626_d;  // u_1626.D / net_2464
  assign register_group_14_d[4] = to_ff_1808_d;  // u_1808.D / net_2274
  assign register_group_14_d[5] = to_ff_1810_d;  // u_1810.D / net_2345


  // register_group_03_q: state/counter register candidate; confidence=0.950
  //   [0] = u_4659.Q (was ff_4659_q, extracted net_1001)
  //   [1] = u_4661.Q (was ff_4661_q, extracted net_547)
  //   [2] = u_4662.Q (was ff_4662_q, extracted net_169)
  //   [3] = u_4838.Q (was ff_4838_q, extracted net_114)

  // register_group_14_q: state/counter register candidate; confidence=0.793
  //   [0] = u_1228.Q (was ff_1228_q, extracted net_2276)
  //   [1] = u_1230.Q (was ff_1230_q, extracted net_2347)
  //   [2] = u_1258.Q (was ff_1258_q, extracted net_2443)
  //   [3] = u_1626.Q (was ff_1626_q, extracted net_2442)
  //   [4] = u_1808.Q (was ff_1808_q, extracted net_2273)
  //   [5] = u_1810.Q (was ff_1810_q, extracted net_2346)


  wire net_604;
  wire net_2275;
  wire net_2277;
  wire net_2301;
  wire net_2344;
  wire net_2377;
  wire net_2418;
  wire net_2419;
  wire net_2440;
  wire net_2441;

  // to_ff_1808_d drives u_1808.D
  // to_ff_1228_d drives u_1228.D
  // to_ff_1810_d drives u_1810.D
  // to_ff_1230_d drives u_1230.D
  // to_ff_1258_d drives u_1258.D
  // to_ff_1626_d drives u_1626.D

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_1232 (
      .A1(I),
      .A2(net_604),
      .A3(net_2277),
      .B1(register_group_14_q[0]),
      .X(net_2301)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_1234 (
      .A1(I),
      .A2(net_604),
      .A3(net_2419),
      .B1(register_group_14_q[1]),
      .X(net_2377)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_1235 (
      .A1(register_group_14_q[5]),
      .A2(net_2344),
      .B1(net_2377),
      .X(to_ff_1230_d)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_1240 (
      .A_N(register_group_14_q[5]),
      .B(net_2344),
      .Y(to_ff_1810_d)
  );

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_1246 (
      .A_N(register_group_03_q[2]),
      .B_N(register_group_03_q[1]),
      .C(register_group_03_q[0]),
      .D(register_group_03_q[3]),
      .X(net_2419)
  );

  // and4b_2: X=(!A_N&B&C&D)
  sky130_fd_sc_hd__and4b_2 u_1248 (
      .A_N(register_group_03_q[1]),
      .B(register_group_03_q[0]),
      .C(register_group_03_q[2]),
      .D(register_group_03_q[3]),
      .X(net_2418)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_1381 (
      .A(I),
      .B(net_604),
      .C(register_group_14_q[2]),
      .D(net_2418),
      .Y(net_2441)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_1611 (
      .A1(register_group_14_q[3]),
      .A2(net_2441),
      .B1(net_2440),
      .X(to_ff_1258_d)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_1635 (
      .A1(I),
      .A2(net_604),
      .A3(net_2418),
      .B1(register_group_14_q[2]),
      .X(net_2440)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_1641 (
      .A(I),
      .B(net_604),
      .C(register_group_14_q[1]),
      .D(net_2419),
      .Y(net_2344)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_1675 (
      .A_N(register_group_14_q[3]),
      .B(net_2441),
      .Y(to_ff_1626_d)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_1772 (
      .A(I),
      .B(net_604),
      .C(register_group_14_q[0]),
      .D(net_2277),
      .Y(net_2275)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_1790 (
      .A1(register_group_14_q[4]),
      .A2(net_2275),
      .B1(net_2301),
      .X(to_ff_1228_d)
  );

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_1807 (
      .A_N(register_group_03_q[3]),
      .B_N(register_group_03_q[1]),
      .C(register_group_03_q[0]),
      .D(register_group_03_q[2]),
      .X(net_2277)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_1959 (
      .A_N(register_group_14_q[4]),
      .B(net_2275),
      .Y(to_ff_1808_d)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

endmodule
