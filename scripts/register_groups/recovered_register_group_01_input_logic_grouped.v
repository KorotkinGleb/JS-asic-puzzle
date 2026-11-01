// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_01_input_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [11:0] shift_register_q,  // verified shift order
    output wire [11:0] shift_register_d  // complete recovered destination D vector
);

  wire to_ff_4993_d;
  wire to_ff_5000_d;
  wire to_ff_5004_d;
  wire to_ff_5093_d;
  wire to_ff_5336_d;
  wire to_ff_5339_d;
  wire to_ff_5342_d;
  wire to_ff_5343_d;
  wire to_ff_5344_d;
  wire to_ff_5399_d;
  wire to_ff_5401_d;
  wire to_ff_5569_d;

  // Recovered D-pin mapping for shift_register_q
  assign shift_register_d[0] = to_ff_5000_d;  // u_5000.D / net_1584
  assign shift_register_d[1] = to_ff_5401_d;  // u_5401.D / net_1544
  assign shift_register_d[2] = to_ff_5093_d;  // u_5093.D / net_1597
  assign shift_register_d[3] = to_ff_5399_d;  // u_5399.D / net_1464
  assign shift_register_d[4] = to_ff_5004_d;  // u_5004.D / net_1354
  assign shift_register_d[5] = to_ff_5342_d;  // u_5342.D / net_1279
  assign shift_register_d[6] = to_ff_4993_d;  // u_4993.D / net_1351
  assign shift_register_d[7] = to_ff_5569_d;  // u_5569.D / net_1214
  assign shift_register_d[8] = to_ff_5343_d;  // u_5343.D / net_1250
  assign shift_register_d[9] = to_ff_5344_d;  // u_5344.D / net_1315
  assign shift_register_d[10] = to_ff_5339_d;  // u_5339.D / net_1412
  assign shift_register_d[11] = to_ff_5336_d;  // u_5336.D / net_1514


  // shift_register_q: verified shift register; confidence=1.000
  //   [0] = u_5000.Q (was ff_5000_q, extracted net_1577)
  //   [1] = u_5401.Q (was ff_5401_q, extracted net_1547)
  //   [2] = u_5093.Q (was ff_5093_q, extracted net_1596)
  //   [3] = u_5399.Q (was ff_5399_q, extracted net_1458)
  //   [4] = u_5004.Q (was ff_5004_q, extracted net_1402)
  //   [5] = u_5342.Q (was ff_5342_q, extracted net_1349)
  //   [6] = u_4993.Q (was ff_4993_q, extracted net_1309)
  //   [7] = u_5569.Q (was ff_5569_q, extracted net_1212)
  //   [8] = u_5343.Q (was ff_5343_q, extracted net_1248)
  //   [9] = u_5344.Q (was ff_5344_q, extracted net_1308)
  //   [10] = u_5339.Q (was ff_5339_q, extracted net_1358)
  //   [11] = u_5336.Q (was ff_5336_q, extracted net_1512)


  wire net_604;

  // to_ff_5569_d drives u_5569.D
  // to_ff_5343_d drives u_5343.D
  // to_ff_5342_d drives u_5342.D
  // to_ff_5344_d drives u_5344.D
  // to_ff_4993_d drives u_4993.D
  // to_ff_5004_d drives u_5004.D
  // to_ff_5339_d drives u_5339.D
  // to_ff_5399_d drives u_5399.D
  // to_ff_5336_d drives u_5336.D
  // to_ff_5401_d drives u_5401.D
  // to_ff_5000_d drives u_5000.D
  // to_ff_5093_d drives u_5093.D

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5007 (
      .A0(shift_register_q[2]),
      .A1(shift_register_q[1]),
      .S(net_604),
      .X(to_ff_5093_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5008 (
      .A0(shift_register_q[1]),
      .A1(shift_register_q[0]),
      .S(net_604),
      .X(to_ff_5401_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5011 (
      .A0(shift_register_q[3]),
      .A1(shift_register_q[2]),
      .S(net_604),
      .X(to_ff_5399_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5205 (
      .A0(shift_register_q[5]),
      .A1(shift_register_q[4]),
      .S(net_604),
      .X(to_ff_5342_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5263 (
      .A0(shift_register_q[6]),
      .A1(shift_register_q[5]),
      .S(net_604),
      .X(to_ff_4993_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5265 (
      .A0(shift_register_q[7]),
      .A1(shift_register_q[6]),
      .S(net_604),
      .X(to_ff_5569_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5340 (
      .A0(shift_register_q[0]),
      .A1(I),
      .S(net_604),
      .X(to_ff_5000_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5347 (
      .A0(shift_register_q[10]),
      .A1(shift_register_q[9]),
      .S(net_604),
      .X(to_ff_5339_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5400 (
      .A0(shift_register_q[11]),
      .A1(shift_register_q[10]),
      .S(net_604),
      .X(to_ff_5336_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5403 (
      .A0(shift_register_q[9]),
      .A1(shift_register_q[8]),
      .S(net_604),
      .X(to_ff_5344_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5433 (
      .A0(shift_register_q[4]),
      .A1(shift_register_q[3]),
      .S(net_604),
      .X(to_ff_5004_d)
  );

  // mux2_1: X=(A0&!S) | (A1&S)
  sky130_fd_sc_hd__mux2_1 u_5537 (
      .A0(shift_register_q[8]),
      .A1(shift_register_q[7]),
      .S(net_604),
      .X(to_ff_5343_d)
  );

endmodule
