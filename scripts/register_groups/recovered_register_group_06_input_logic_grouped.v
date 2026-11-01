// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_06_input_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    input wire [2:0] register_group_06_q,  // inferred group; index order follows instance IDs
    output wire [2:0] register_group_06_d  // complete recovered destination D vector
);

  wire to_ff_5634_d;
  wire to_ff_5638_d;
  wire to_ff_5639_d;

  // Recovered D-pin mapping for register_group_06_q
  assign register_group_06_d[0] = to_ff_5634_d;  // u_5634.D / net_928
  assign register_group_06_d[1] = to_ff_5638_d;  // u_5638.D / net_831
  assign register_group_06_d[2] = to_ff_5639_d;  // u_5639.D / net_1007


  // register_group_03_q: state/counter register candidate; confidence=0.950
  //   [0] = u_4659.Q (was ff_4659_q, extracted net_1001)
  //   [1] = u_4661.Q (was ff_4661_q, extracted net_547)
  //   [2] = u_4662.Q (was ff_4662_q, extracted net_169)
  //   [3] = u_4838.Q (was ff_4838_q, extracted net_114)

  // register_group_06_q: state/counter register candidate; confidence=0.933
  //   [0] = u_5634.Q (was ff_5634_q, extracted net_974)
  //   [1] = u_5638.Q (was ff_5638_q, extracted net_828)
  //   [2] = u_5639.Q (was ff_5639_q, extracted net_1006)


  wire net_604;
  wire net_873;
  wire net_882;
  wire net_907;
  wire net_927;
  wire net_929;
  wire net_930;
  wire net_976;
  wire net_1004;
  wire net_1005;

  // to_ff_5638_d drives u_5638.D
  // to_ff_5634_d drives u_5634.D
  // to_ff_5639_d drives u_5639.D

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_4705 (
      .A_N(register_group_03_q[2]),
      .B_N(register_group_03_q[0]),
      .C(register_group_03_q[1]),
      .D(register_group_03_q[3]),
      .X(net_873)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_5630 (
      .A(net_873),
      .Y(net_907)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_5636 (
      .A(register_group_06_q[0]),
      .Y(net_929)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_5640 (
      .A1(net_873),
      .A2(net_604),
      .A3(net_882),
      .B1(register_group_06_q[1]),
      .X(to_ff_5638_d)
  );

  // o211a_2: X=(A1&B1&C1) | (A2&B1&C1)
  sky130_fd_sc_hd__o211a_2 u_5677 (
      .A1(register_group_06_q[0]),
      .A2(net_930),
      .B1(net_976),
      .C1(net_604),
      .X(net_1004)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_5682 (
      .A1(net_929),
      .A2(net_930),
      .B1(net_927),
      .Y(to_ff_5634_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5683 (
      .A0(net_930),
      .A1(net_976),
      .S(register_group_06_q[0]),
      .X(net_882)
  );

  // or2_2: X=(A) | (B)
  sky130_fd_sc_hd__or2_2 u_5684 (
      .A(register_group_06_q[2]),
      .B(I),
      .X(net_976)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_5711 (
      .A(register_group_06_q[2]),
      .B(I),
      .Y(net_930)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_5775 (
      .A(net_604),
      .Y(net_1005)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5778 (
      .A0(net_873),
      .A1(net_929),
      .S(net_1005),
      .X(net_927)
  );

  // a22o_2: X=(B1&B2) | (A1&A2)
  sky130_fd_sc_hd__a22o_2 u_5781 (
      .A1(net_1005),
      .A2(register_group_06_q[2]),
      .B1(net_1004),
      .B2(net_907),
      .X(to_ff_5639_d)
  );

endmodule
