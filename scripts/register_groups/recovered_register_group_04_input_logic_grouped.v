// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_04_input_logic_grouped (
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    input wire [3:0] register_group_04_q,  // inferred group; index order follows instance IDs
    output wire [3:0] register_group_04_d  // complete recovered destination D vector
);

  wire to_ff_6435_d;
  wire to_ff_6436_d;
  wire to_ff_6442_d;
  wire to_ff_6451_d;

  // Recovered D-pin mapping for register_group_04_q
  assign register_group_04_d[0] = to_ff_6435_d;  // u_6435.D / net_921
  assign register_group_04_d[1] = to_ff_6436_d;  // u_6436.D / net_1059
  assign register_group_04_d[2] = to_ff_6442_d;  // u_6442.D / net_827
  assign register_group_04_d[3] = to_ff_6451_d;  // u_6451.D / net_972


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
  wire net_873;
  wire net_874;
  wire net_876;
  wire net_878;
  wire net_879;
  wire net_918;
  wire net_968;
  wire net_970;

  // to_ff_6442_d drives u_6442.D
  // to_ff_6435_d drives u_6435.D
  // to_ff_6451_d drives u_6451.D
  // to_ff_6436_d drives u_6436.D

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

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_6403 (
      .A1(net_873),
      .A2(net_604),
      .A3(register_group_04_q[2]),
      .B1(register_group_04_q[3]),
      .X(net_918)
  );

  // and4_2: X=(A&B&C&D)
  sky130_fd_sc_hd__and4_2 u_6404 (
      .A(net_873),
      .B(net_604),
      .C(register_group_04_q[3]),
      .D(register_group_04_q[2]),
      .X(net_968)
  );

  // o311a_2: X=(A1&B1&C1) | (A2&B1&C1) | (A3&B1&C1)
  sky130_fd_sc_hd__o311a_2 u_6437 (
      .A1(register_group_04_q[2]),
      .A2(net_820),
      .A3(net_879),
      .B1(net_878),
      .C1(net_874),
      .X(to_ff_6435_d)
  );

  // and3_2: X=(A&B&C)
  sky130_fd_sc_hd__and3_2 u_6441 (
      .A(net_873),
      .B(net_604),
      .C(net_820),
      .X(net_876)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_6444 (
      .A0(net_876),
      .A1(net_879),
      .S(register_group_04_q[2]),
      .X(to_ff_6442_d)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_6445 (
      .A(net_873),
      .B(net_604),
      .Y(net_879)
  );

  // o211a_2: X=(A1&B1&C1) | (A2&B1&C1)
  sky130_fd_sc_hd__o211a_2 u_6446 (
      .A1(net_820),
      .A2(net_879),
      .B1(net_918),
      .C1(net_970),
      .X(to_ff_6451_d)
  );

  // nand3b_2: Y=(A_N) | (!B) | (!C)
  sky130_fd_sc_hd__nand3b_2 u_6472 (
      .A_N(register_group_04_q[1]),
      .B(register_group_04_q[0]),
      .C(register_group_04_q[3]),
      .Y(net_820)
  );

  // nand3_2: Y=(!A) | (!B) | (!C)
  sky130_fd_sc_hd__nand3_2 u_6473 (
      .A(register_group_04_q[1]),
      .B(register_group_04_q[0]),
      .C(net_968),
      .Y(net_878)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_6474 (
      .A1(register_group_04_q[1]),
      .A2(net_968),
      .B1(register_group_04_q[0]),
      .X(net_874)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_6478 (
      .A(net_968),
      .Y(net_970)
  );

  // xor2_2: X=(A&!B) | (!A&B)
  sky130_fd_sc_hd__xor2_2 u_6481 (
      .A(register_group_04_q[1]),
      .B(net_968),
      .X(to_ff_6436_d)
  );

endmodule
