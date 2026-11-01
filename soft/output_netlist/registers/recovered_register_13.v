// Structural state block recovered from GDS connectivity.
// register_13: 6 bit(s), state/counter register candidate.
module recovered_register_13 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output wire [5:0] register_13  // recovered current state
);

  // Physical-bit mapping.
  // register_13[0] = u_1259.Q / net_2532; D=net_2531
  // register_13[1] = u_1260.Q / net_2581; D=net_2583
  // register_13[2] = u_1261.Q / net_2512; D=net_2557
  // register_13[3] = u_1383.Q / net_2493; D=net_2489
  // register_13[4] = u_1384.Q / net_2511; D=net_2510
  // register_13[5] = u_1385.Q / net_2579; D=net_2582

  // Extracted combinational nets.
  wire net_604;
  wire net_2477;
  wire net_2478;
  wire net_2479;
  wire net_2483;
  wire net_2489;
  wire net_2490;
  wire net_2510;
  wire net_2530;
  wire net_2531;
  wire net_2533;
  wire net_2554;
  wire net_2557;
  wire net_2582;
  wire net_2583;
  wire net_2584;
  wire net_2611;
  wire net_2612;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__and4bb_2 u_1323 (
      .A_N(register_03[2]),
      .B_N(register_03[0]),
      .C(register_03[1]),
      .D(register_03[3]),
      .X(net_2612)
  );

  sky130_fd_sc_hd__and4bb_2 u_1370 (
      .A_N(register_03[3]),
      .B_N(register_03[0]),
      .C(register_03[1]),
      .D(register_03[2]),
      .X(net_2533)
  );

  sky130_fd_sc_hd__inv_2 u_1425 (
      .A(register_13[2]),
      .Y(net_2490)
  );

  sky130_fd_sc_hd__or4b_2 u_1451 (
      .A(register_03[3]),
      .B(register_03[2]),
      .C(register_03[0]),
      .D_N(register_03[1]),
      .X(net_2478)
  );

  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(register_16),
      .B(enable),
      .X(net_604)
  );

  sky130_fd_sc_hd__a31o_2 u_1286 (
      .A1(I),
      .A2(net_604),
      .A3(net_2533),
      .B1(register_13[0]),
      .X(net_2554)
  );

  sky130_fd_sc_hd__a31o_2 u_1287 (
      .A1(I),
      .A2(net_604),
      .A3(net_2612),
      .B1(register_13[1]),
      .X(net_2611)
  );

  sky130_fd_sc_hd__nand2_2 u_1362 (
      .A(I),
      .B(net_604),
      .Y(net_2479)
  );

  sky130_fd_sc_hd__nand4_2 u_1364 (
      .A(I),
      .B(net_604),
      .C(register_13[1]),
      .D(net_2612),
      .Y(net_2584)
  );

  sky130_fd_sc_hd__nand4_2 u_1365 (
      .A(I),
      .B(net_604),
      .C(register_13[0]),
      .D(net_2533),
      .Y(net_2530)
  );

  sky130_fd_sc_hd__or4_2 u_1363 (
      .A(register_13[4]),
      .B(net_2490),
      .C(net_2478),
      .D(net_2479),
      .X(net_2483)
  );

  sky130_fd_sc_hd__nor2_2 u_1377 (
      .A(net_2478),
      .B(net_2479),
      .Y(net_2477)
  );

  sky130_fd_sc_hd__nand2b_2 u_1570 (
      .A_N(register_13[5]),
      .B(net_2584),
      .Y(net_2582)
  );

  sky130_fd_sc_hd__o21a_2 u_1579 (
      .A1(register_13[5]),
      .A2(net_2584),
      .B1(net_2611),
      .X(net_2583)
  );

  sky130_fd_sc_hd__o21a_2 u_1366 (
      .A1(register_13[3]),
      .A2(net_2530),
      .B1(net_2554),
      .X(net_2531)
  );

  sky130_fd_sc_hd__nand2b_2 u_1569 (
      .A_N(register_13[3]),
      .B(net_2530),
      .Y(net_2489)
  );

  sky130_fd_sc_hd__a21o_2 u_1367 (
      .A1(register_13[2]),
      .A2(net_2477),
      .B1(register_13[4]),
      .X(net_2510)
  );

  sky130_fd_sc_hd__o21a_2 u_1387 (
      .A1(register_13[2]),
      .A2(net_2477),
      .B1(net_2483),
      .X(net_2557)
  );

  // Recovered sequential standard-cell instances.
  // register_13: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_1259_state (
      .CLK(clk),
      .D(net_2531),
      .RESET_B(rst_n),
      .Q(register_13[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1260_state (
      .CLK(clk),
      .D(net_2583),
      .RESET_B(rst_n),
      .Q(register_13[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1261_state (
      .CLK(clk),
      .D(net_2557),
      .RESET_B(rst_n),
      .Q(register_13[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1383_state (
      .CLK(clk),
      .D(net_2489),
      .RESET_B(rst_n),
      .Q(register_13[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1384_state (
      .CLK(clk),
      .D(net_2510),
      .RESET_B(rst_n),
      .Q(register_13[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1385_state (
      .CLK(clk),
      .D(net_2582),
      .RESET_B(rst_n),
      .Q(register_13[5])
  );

endmodule
