// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_02_input_logic_grouped (
    input wire [2:0] register_group_09_q,  // inferred group; index order follows instance IDs
    input wire [3:0] register_group_02_q,  // inferred group; index order follows instance IDs
    output wire [3:0] register_group_02_d  // complete recovered destination D vector
);

  wire to_ff_234_d;
  wire to_ff_235_d;
  wire to_ff_236_d;
  wire to_ff_237_d;

  // Recovered D-pin mapping for register_group_02_q
  assign register_group_02_d[0] = to_ff_234_d;  // u_234.D / net_2332
  assign register_group_02_d[1] = to_ff_235_d;  // u_235.D / net_2388
  assign register_group_02_d[2] = to_ff_236_d;  // u_236.D / net_2411
  assign register_group_02_d[3] = to_ff_237_d;  // u_237.D / net_2317


  // register_group_02_q: state/counter register candidate; confidence=0.950
  //   [0] = u_234.Q (was ff_234_q, extracted net_751)
  //   [1] = u_235.Q (was ff_235_q, extracted net_762)
  //   [2] = u_236.Q (was ff_236_q, extracted net_749)
  //   [3] = u_237.Q (was ff_237_q, extracted net_848)

  // register_group_09_q: decoded state/register vector; confidence=0.847
  //   [0] = u_226.Q (was ff_226_q, extracted net_2329)
  //   unused bits in this cone: 1, 2


  wire net_2302;
  wire net_2311;
  wire net_2316;
  wire net_2330;
  wire net_2359;

  // to_ff_237_d drives u_237.D
  // to_ff_234_d drives u_234.D
  // to_ff_235_d drives u_235.D
  // to_ff_236_d drives u_236.D

  // a21boi_2: Y=(!A1&B1_N) | (!A2&B1_N)
  sky130_fd_sc_hd__a21boi_2 u_199 (
      .A1(register_group_02_q[1]),
      .A2(net_2302),
      .B1_N(register_group_09_q[0]),
      .Y(to_ff_235_d)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_202 (
      .A(register_group_02_q[2]),
      .B(register_group_02_q[1]),
      .Y(net_2359)
  );

  // a21boi_2: Y=(!A1&B1_N) | (!A2&B1_N)
  sky130_fd_sc_hd__a21boi_2 u_215 (
      .A1(net_2311),
      .A2(net_2316),
      .B1_N(register_group_09_q[0]),
      .Y(to_ff_237_d)
  );

  // a21boi_2: Y=(!A1&B1_N) | (!A2&B1_N)
  sky130_fd_sc_hd__a21boi_2 u_341 (
      .A1(net_2302),
      .A2(net_2359),
      .B1_N(register_group_09_q[0]),
      .Y(to_ff_236_d)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_353 (
      .A(register_group_02_q[3]),
      .B(register_group_02_q[0]),
      .C(register_group_02_q[2]),
      .D(register_group_02_q[1]),
      .Y(net_2302)
  );

  // nand3_2: Y=(!A) | (!B) | (!C)
  sky130_fd_sc_hd__nand3_2 u_494 (
      .A(register_group_02_q[0]),
      .B(register_group_02_q[2]),
      .C(register_group_02_q[1]),
      .Y(net_2316)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_500 (
      .A1(register_group_02_q[2]),
      .A2(register_group_02_q[1]),
      .B1(register_group_02_q[0]),
      .X(net_2330)
  );

  // o211a_2: X=(A1&B1&C1) | (A2&B1&C1)
  sky130_fd_sc_hd__o211a_2 u_608 (
      .A1(register_group_02_q[3]),
      .A2(net_2316),
      .B1(net_2330),
      .C1(register_group_09_q[0]),
      .X(to_ff_234_d)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_624 (
      .A(register_group_02_q[3]),
      .Y(net_2311)
  );

endmodule
