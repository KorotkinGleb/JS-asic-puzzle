// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: shift Q taps -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_shift_output_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    input wire ff_5337_q,  // extracted net_1360
    input wire [11:0] shift_register_q,  // verified shift order
    output wire to_ff_5337_d  // extracted net_1466
);

  // shift_register_q: verified shift register; confidence=1.000
  //   [0] = u_5000.Q (was shift_q_0, extracted net_1577)
  //   [9] = u_5344.Q (was shift_q_9, extracted net_1308)
  //   [10] = u_5339.Q (was shift_q_10, extracted net_1358)
  //   [11] = u_5336.Q (was shift_q_11, extracted net_1512)
  //   unused bits in this cone: 1, 2, 3, 4, 5, 6, 7, 8

  // register_group_03_q: state/counter register candidate; confidence=0.950
  //   [0] = u_4659.Q (was ff_4659_q, extracted net_1001)
  //   [1] = u_4661.Q (was ff_4661_q, extracted net_547)
  //   [2] = u_4662.Q (was ff_4662_q, extracted net_169)
  //   [3] = u_4838.Q (was ff_4838_q, extracted net_114)


  wire net_604;
  wire net_978;
  wire net_1002;
  wire net_1029;
  wire net_1454;
  wire net_1456;

  // to_ff_5337_d drives u_5337.D

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

  // a221o_2: X=(B1&B2) | (A1&A2) | (C1)
  sky130_fd_sc_hd__a221o_2 u_5229 (
      .A1(net_1002),
      .A2(shift_register_q[9]),
      .B1(1'b1),
      .B2(shift_register_q[10]),
      .C1(net_1456),
      .X(net_1454)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_5256 (
      .A1(I),
      .A2(net_604),
      .A3(net_1454),
      .B1(ff_5337_q),
      .X(to_ff_5337_d)
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

endmodule
