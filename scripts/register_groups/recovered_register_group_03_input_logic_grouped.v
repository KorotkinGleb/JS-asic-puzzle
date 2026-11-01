// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_03_input_logic_grouped (
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    output wire [3:0] register_group_03_d  // complete recovered destination D vector
);

  wire to_ff_4659_d;
  wire to_ff_4661_d;
  wire to_ff_4662_d;
  wire to_ff_4838_d;

  // Recovered D-pin mapping for register_group_03_q
  assign register_group_03_d[0] = to_ff_4659_d;  // u_4659.D / net_1307
  assign register_group_03_d[1] = to_ff_4661_d;  // u_4661.D / net_1568
  assign register_group_03_d[2] = to_ff_4662_d;  // u_4662.D / net_1448
  assign register_group_03_d[3] = to_ff_4838_d;  // u_4838.D / net_1394


  // register_group_03_q: state/counter register candidate; confidence=0.950
  //   [0] = u_4659.Q (was ff_4659_q, extracted net_1001)
  //   [1] = u_4661.Q (was ff_4661_q, extracted net_547)
  //   [2] = u_4662.Q (was ff_4662_q, extracted net_169)
  //   [3] = u_4838.Q (was ff_4838_q, extracted net_114)


  wire net_604;
  wire net_873;
  wire net_1303;
  wire net_1391;
  wire net_1453;
  wire net_1497;
  wire net_1535;

  // to_ff_4659_d drives u_4659.D
  // to_ff_4838_d drives u_4838.D
  // to_ff_4662_d drives u_4662.D
  // to_ff_4661_d drives u_4661.D

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_4660 (
      .A(register_group_03_q[3]),
      .B(register_group_03_q[2]),
      .C(net_604),
      .X(net_1303)
  );

  // a221oi_2: Y=(!A1&!B1&!C1) | (!A1&!B2&!C1) | (!A2&!B1&!C1) | (!A2&!B2&!C1)
  sky130_fd_sc_hd__a221oi_2 u_4663 (
      .A1(net_604),
      .A2(net_873),
      .B1(net_1391),
      .B2(register_group_03_q[1]),
      .C1(net_1535),
      .Y(to_ff_4661_d)
  );

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_4705 (
      .A_N(register_group_03_q[2]),
      .B_N(register_group_03_q[0]),
      .C(register_group_03_q[1]),
      .D(register_group_03_q[3]),
      .X(net_873)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_4710 (
      .A(net_873),
      .B(net_1497),
      .Y(to_ff_4662_d)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

  // a211oi_2: Y=(!A1&!B1&!C1) | (!A2&!B1&!C1)
  sky130_fd_sc_hd__a211oi_2 u_4835 (
      .A1(net_604),
      .A2(net_873),
      .B1(net_1453),
      .C1(net_1303),
      .Y(to_ff_4838_d)
  );

  // a21oi_2: Y=(!A1&!B1) | (!A2&!B1)
  sky130_fd_sc_hd__a21oi_2 u_4837 (
      .A1(register_group_03_q[2]),
      .A2(net_604),
      .B1(register_group_03_q[3]),
      .Y(net_1453)
  );

  // xnor2_2: Y=(!A&!B) | (A&B)
  sky130_fd_sc_hd__xnor2_2 u_4859 (
      .A(register_group_03_q[2]),
      .B(net_604),
      .Y(net_1497)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_4862 (
      .A(register_group_03_q[0]),
      .B(net_1303),
      .X(to_ff_4659_d)
  );

  // a41oi_2: Y=(!A1&!B1) | (!A2&!B1) | (!A3&!B1) | (!A4&!B1)
  sky130_fd_sc_hd__a41oi_2 u_4863 (
      .A1(register_group_03_q[3]),
      .A2(register_group_03_q[2]),
      .A3(register_group_03_q[0]),
      .A4(net_604),
      .B1(register_group_03_q[1]),
      .Y(net_1535)
  );

  // and4_2: X=(A&B&C&D)
  sky130_fd_sc_hd__and4_2 u_4949 (
      .A(register_group_03_q[3]),
      .B(register_group_03_q[2]),
      .C(register_group_03_q[0]),
      .D(net_604),
      .X(net_1391)
  );

endmodule
