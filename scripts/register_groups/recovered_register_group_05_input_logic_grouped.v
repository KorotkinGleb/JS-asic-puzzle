// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_05_input_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire [1:0] register_group_05_q,  // inferred group; index order follows instance IDs
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    output wire [1:0] register_group_05_d  // complete recovered destination D vector
);

  wire to_ff_2293_d;
  wire to_ff_2372_d;

  // Recovered D-pin mapping for register_group_05_q
  assign register_group_05_d[0] = to_ff_2293_d;  // u_2293.D / net_1800
  assign register_group_05_d[1] = to_ff_2372_d;  // u_2372.D / net_1752


  // register_group_03_q: state/counter register candidate; confidence=0.950
  //   [0] = u_4659.Q (was ff_4659_q, extracted net_1001)
  //   [1] = u_4661.Q (was ff_4661_q, extracted net_547)
  //   [2] = u_4662.Q (was ff_4662_q, extracted net_169)
  //   [3] = u_4838.Q (was ff_4838_q, extracted net_114)

  // register_group_05_q: state/counter register candidate; confidence=0.950
  //   [0] = u_2293.Q (was ff_2293_q, extracted net_1805)
  //   [1] = u_2372.Q (was ff_2372_q, extracted net_1797)


  wire net_604;
  wire net_1796;
  wire net_1842;
  wire net_1876;

  // to_ff_2372_d drives u_2372.D
  // to_ff_2293_d drives u_2293.D

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_2361 (
      .A1(I),
      .A2(net_604),
      .A3(net_1876),
      .B1(register_group_05_q[0]),
      .X(net_1842)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_2363 (
      .A1(register_group_05_q[1]),
      .A2(net_1796),
      .B1(net_1842),
      .X(to_ff_2293_d)
  );

  // nor4_2: Y=(!A&!B&!C&!D)
  sky130_fd_sc_hd__nor4_2 u_2365 (
      .A(register_group_03_q[3]),
      .B(register_group_03_q[2]),
      .C(register_group_03_q[1]),
      .D(register_group_03_q[0]),
      .Y(net_1876)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_2369 (
      .A(I),
      .B(net_604),
      .C(register_group_05_q[0]),
      .D(net_1876),
      .Y(net_1796)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_2437 (
      .A_N(register_group_05_q[1]),
      .B(net_1796),
      .Y(to_ff_2372_d)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

endmodule
