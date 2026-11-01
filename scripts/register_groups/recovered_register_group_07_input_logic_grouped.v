// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_07_input_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [7:0] register_group_07_q,  // inferred group; index order follows instance IDs
    output wire [7:0] register_group_07_d  // complete recovered destination D vector
);

  wire to_ff_6095_d;
  wire to_ff_6106_d;
  wire to_ff_6109_d;
  wire to_ff_6111_d;
  wire to_ff_6159_d;
  wire to_ff_6197_d;
  wire to_ff_6198_d;
  wire to_ff_6199_d;

  // Recovered D-pin mapping for register_group_07_q
  assign register_group_07_d[0] = to_ff_6095_d;  // u_6095.D / net_458
  assign register_group_07_d[1] = to_ff_6106_d;  // u_6106.D / net_263
  assign register_group_07_d[2] = to_ff_6109_d;  // u_6109.D / net_347
  assign register_group_07_d[3] = to_ff_6111_d;  // u_6111.D / net_555
  assign register_group_07_d[4] = to_ff_6159_d;  // u_6159.D / net_578
  assign register_group_07_d[5] = to_ff_6197_d;  // u_6197.D / net_384
  assign register_group_07_d[6] = to_ff_6198_d;  // u_6198.D / net_297
  assign register_group_07_d[7] = to_ff_6199_d;  // u_6199.D / net_519


  // register_group_07_q: state/counter register candidate; confidence=0.918
  //   [0] = u_6095.Q (was ff_6095_q, extracted net_433)
  //   [1] = u_6106.Q (was ff_6106_q, extracted net_342)
  //   [2] = u_6109.Q (was ff_6109_q, extracted net_338)
  //   [3] = u_6111.Q (was ff_6111_q, extracted net_603)
  //   [4] = u_6159.Q (was ff_6159_q, extracted net_534)
  //   [5] = u_6197.Q (was ff_6197_q, extracted net_415)
  //   [6] = u_6198.Q (was ff_6198_q, extracted net_339)
  //   [7] = u_6199.Q (was ff_6199_q, extracted net_484)


  wire net_272;
  wire net_274;
  wire net_341;
  wire net_386;
  wire net_430;
  wire net_457;
  wire net_459;
  wire net_477;
  wire net_478;
  wire net_488;
  wire net_533;
  wire net_571;
  wire net_573;
  wire net_604;

  // to_ff_6106_d drives u_6106.D
  // to_ff_6198_d drives u_6198.D
  // to_ff_6109_d drives u_6109.D
  // to_ff_6197_d drives u_6197.D
  // to_ff_6095_d drives u_6095.D
  // to_ff_6199_d drives u_6199.D
  // to_ff_6111_d drives u_6111.D
  // to_ff_6159_d drives u_6159.D

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_5603 (
      .A_N(net_272),
      .B(net_274),
      .X(to_ff_6106_d)
  );

  // and4_2: X=(A&B&C&D)
  sky130_fd_sc_hd__and4_2 u_5613 (
      .A(register_group_07_q[7]),
      .B(net_457),
      .C(net_477),
      .D(net_478),
      .X(net_573)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_5614 (
      .A(net_477),
      .B(net_533),
      .Y(to_ff_6111_d)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_5615 (
      .A_N(net_573),
      .B(net_571),
      .X(to_ff_6199_d)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_5626 (
      .A(net_477),
      .Y(net_459)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_5627 (
      .A1(net_341),
      .A2(net_430),
      .B1(net_386),
      .X(to_ff_6197_d)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_5628 (
      .A(register_group_07_q[6]),
      .B(register_group_07_q[5]),
      .Y(net_341)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_5947 (
      .A1(net_457),
      .A2(net_477),
      .A3(net_478),
      .B1(register_group_07_q[7]),
      .X(net_571)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_6017 (
      .A1(register_group_07_q[6]),
      .A2(net_477),
      .A3(net_478),
      .B1(register_group_07_q[5]),
      .X(net_386)
  );

  // and2_2: X=(A&B)
  sky130_fd_sc_hd__and2_2 u_6032 (
      .A(register_group_07_q[6]),
      .B(register_group_07_q[5]),
      .X(net_457)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_6033 (
      .A(register_group_07_q[2]),
      .B(register_group_07_q[1]),
      .C(net_477),
      .X(net_272)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_6041 (
      .A1(register_group_07_q[0]),
      .A2(net_272),
      .B1(net_430),
      .X(to_ff_6095_d)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_6067 (
      .A(net_477),
      .B(net_478),
      .Y(net_430)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_6094 (
      .A_N(register_group_07_q[2]),
      .B(register_group_07_q[3]),
      .X(net_488)
  );

  // a32o_2: X=(A1&A2&A3) | (B1&B2)
  sky130_fd_sc_hd__a32o_2 u_6103 (
      .A1(I),
      .A2(net_604),
      .A3(net_488),
      .B1(net_459),
      .B2(register_group_07_q[2]),
      .X(to_ff_6109_d)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_6110 (
      .A(register_group_07_q[4]),
      .B(net_573),
      .X(to_ff_6159_d)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_6160 (
      .A1(I),
      .A2(net_604),
      .B1(register_group_07_q[3]),
      .Y(net_533)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_6166 (
      .A(register_group_07_q[3]),
      .B(I),
      .C(net_604),
      .X(net_477)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_6195 (
      .A(register_group_07_q[6]),
      .B(net_430),
      .Y(to_ff_6198_d)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_6350 (
      .A(register_group_07_q[2]),
      .B(register_group_07_q[1]),
      .C(register_group_07_q[0]),
      .X(net_478)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_6356 (
      .A1(register_group_07_q[2]),
      .A2(net_477),
      .B1(register_group_07_q[1]),
      .X(net_274)
  );

endmodule
