// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_register_group_13_input_logic_grouped (
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire [5:0] register_group_13_q,  // inferred group; index order follows instance IDs
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred group; index order follows instance IDs
    output wire [5:0] register_group_13_d  // complete recovered destination D vector
);

  wire to_ff_1259_d;
  wire to_ff_1260_d;
  wire to_ff_1261_d;
  wire to_ff_1383_d;
  wire to_ff_1384_d;
  wire to_ff_1385_d;

  // Recovered D-pin mapping for register_group_13_q
  assign register_group_13_d[0] = to_ff_1259_d;  // u_1259.D / net_2531
  assign register_group_13_d[1] = to_ff_1260_d;  // u_1260.D / net_2583
  assign register_group_13_d[2] = to_ff_1261_d;  // u_1261.D / net_2557
  assign register_group_13_d[3] = to_ff_1383_d;  // u_1383.D / net_2489
  assign register_group_13_d[4] = to_ff_1384_d;  // u_1384.D / net_2510
  assign register_group_13_d[5] = to_ff_1385_d;  // u_1385.D / net_2582


  // register_group_03_q: state/counter register candidate; confidence=0.950
  //   [0] = u_4659.Q (was ff_4659_q, extracted net_1001)
  //   [1] = u_4661.Q (was ff_4661_q, extracted net_547)
  //   [2] = u_4662.Q (was ff_4662_q, extracted net_169)
  //   [3] = u_4838.Q (was ff_4838_q, extracted net_114)

  // register_group_13_q: state/counter register candidate; confidence=0.797
  //   [0] = u_1259.Q (was ff_1259_q, extracted net_2532)
  //   [1] = u_1260.Q (was ff_1260_q, extracted net_2581)
  //   [2] = u_1261.Q (was ff_1261_q, extracted net_2512)
  //   [3] = u_1383.Q (was ff_1383_q, extracted net_2493)
  //   [4] = u_1384.Q (was ff_1384_q, extracted net_2511)
  //   [5] = u_1385.Q (was ff_1385_q, extracted net_2579)


  wire net_604;
  wire net_2477;
  wire net_2478;
  wire net_2479;
  wire net_2483;
  wire net_2490;
  wire net_2530;
  wire net_2533;
  wire net_2554;
  wire net_2584;
  wire net_2611;
  wire net_2612;

  // to_ff_1383_d drives u_1383.D
  // to_ff_1384_d drives u_1384.D
  // to_ff_1259_d drives u_1259.D
  // to_ff_1261_d drives u_1261.D
  // to_ff_1385_d drives u_1385.D
  // to_ff_1260_d drives u_1260.D

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_1286 (
      .A1(I),
      .A2(net_604),
      .A3(net_2533),
      .B1(register_group_13_q[0]),
      .X(net_2554)
  );

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_1287 (
      .A1(I),
      .A2(net_604),
      .A3(net_2612),
      .B1(register_group_13_q[1]),
      .X(net_2611)
  );

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_1323 (
      .A_N(register_group_03_q[2]),
      .B_N(register_group_03_q[0]),
      .C(register_group_03_q[1]),
      .D(register_group_03_q[3]),
      .X(net_2612)
  );

  // nand2_2: Y=(!A) | (!B)
  sky130_fd_sc_hd__nand2_2 u_1362 (
      .A(I),
      .B(net_604),
      .Y(net_2479)
  );

  // or4_2: X=(A) | (B) | (C) | (D)
  sky130_fd_sc_hd__or4_2 u_1363 (
      .A(register_group_13_q[4]),
      .B(net_2490),
      .C(net_2478),
      .D(net_2479),
      .X(net_2483)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_1364 (
      .A(I),
      .B(net_604),
      .C(register_group_13_q[1]),
      .D(net_2612),
      .Y(net_2584)
  );

  // nand4_2: Y=(!A) | (!B) | (!C) | (!D)
  sky130_fd_sc_hd__nand4_2 u_1365 (
      .A(I),
      .B(net_604),
      .C(register_group_13_q[0]),
      .D(net_2533),
      .Y(net_2530)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_1366 (
      .A1(register_group_13_q[3]),
      .A2(net_2530),
      .B1(net_2554),
      .X(to_ff_1259_d)
  );

  // a21o_2: X=(A1&A2) | (B1)
  sky130_fd_sc_hd__a21o_2 u_1367 (
      .A1(register_group_13_q[2]),
      .A2(net_2477),
      .B1(register_group_13_q[4]),
      .X(to_ff_1384_d)
  );

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_1370 (
      .A_N(register_group_03_q[3]),
      .B_N(register_group_03_q[0]),
      .C(register_group_03_q[1]),
      .D(register_group_03_q[2]),
      .X(net_2533)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_1377 (
      .A(net_2478),
      .B(net_2479),
      .Y(net_2477)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_1387 (
      .A1(register_group_13_q[2]),
      .A2(net_2477),
      .B1(net_2483),
      .X(to_ff_1261_d)
  );

  // inv_2: Y=(!A)
  sky130_fd_sc_hd__inv_2 u_1425 (
      .A(register_group_13_q[2]),
      .Y(net_2490)
  );

  // or4b_2: X=(A) | (B) | (C) | (!D_N)
  sky130_fd_sc_hd__or4b_2 u_1451 (
      .A(register_group_03_q[3]),
      .B(register_group_03_q[2]),
      .C(register_group_03_q[0]),
      .D_N(register_group_03_q[1]),
      .X(net_2478)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_1569 (
      .A_N(register_group_13_q[3]),
      .B(net_2530),
      .Y(to_ff_1383_d)
  );

  // nand2b_2: Y=(A_N) | (!B)
  sky130_fd_sc_hd__nand2b_2 u_1570 (
      .A_N(register_group_13_q[5]),
      .B(net_2584),
      .Y(to_ff_1385_d)
  );

  // o21a_2: X=(A1&B1) | (A2&B1)
  sky130_fd_sc_hd__o21a_2 u_1579 (
      .A1(register_group_13_q[5]),
      .A2(net_2584),
      .B1(net_2611),
      .X(to_ff_1260_d)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

endmodule
