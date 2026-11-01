// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_ff_4182_input_logic_grouped (
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    input wire [3:0] register_group_04_q,  // inferred group; index order follows instance IDs
    output wire to_ff_4182_d  // extracted net_2007
);

  // register_group_03_q: state/counter register candidate; confidence=0.950
  //   [0] = u_4659.Q (was ff_4659_q, extracted net_1001)
  //   [1] = u_4661.Q (was ff_4661_q, extracted net_547)
  //   [2] = u_4662.Q (was ff_4662_q, extracted net_169)
  //   [3] = u_4838.Q (was ff_4838_q, extracted net_114)

  // register_group_04_q: state/counter register candidate; confidence=0.950
  //   [0] = u_6435.Q (was ff_6435_q, extracted net_206)
  //   [1] = u_6436.Q (was ff_6436_q, extracted net_173)
  //   [2] = u_6442.Q (was ff_6442_q, extracted net_171)
  //   [3] = u_6451.Q (was ff_6451_q, extracted net_205)


  wire net_604;
  wire net_820;
  wire net_821;
  wire net_873;

  // to_ff_4182_d drives u_4182.D

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_4602 (
      .A1(net_873),
      .A2(net_821),
      .A3(net_604),
      .B1(ff_4182_q),
      .X(to_ff_4182_d)
  );

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

  // nand3b_2: Y=(A_N) | (!B) | (!C)
  sky130_fd_sc_hd__nand3b_2 u_6472 (
      .A_N(register_group_04_q[1]),
      .B(register_group_04_q[0]),
      .C(register_group_04_q[3]),
      .Y(net_820)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_6609 (
      .A(register_group_04_q[2]),
      .B(net_820),
      .Y(net_821)
  );

endmodule
