// Structural state block recovered from GDS connectivity.
// register_02: 4 bit(s), state/counter register candidate.
module recovered_register_02 (
    input wire clk,
    input wire [2:0] register_09,  // recovered register boundary
    output wire [3:0] register_02  // recovered current state
);

  // Physical-bit mapping.
  // register_02[0] = u_234.Q / net_751; D=net_2332
  // register_02[1] = u_235.Q / net_762; D=net_2388
  // register_02[2] = u_236.Q / net_749; D=net_2411
  // register_02[3] = u_237.Q / net_848; D=net_2317

  // Extracted combinational nets.
  wire net_2302;
  wire net_2311;
  wire net_2316;
  wire net_2317;
  wire net_2330;
  wire net_2332;
  wire net_2359;
  wire net_2388;
  wire net_2411;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__xnor2_2 u_202 (
      .A(register_02[2]),
      .B(register_02[1]),
      .Y(net_2359)
  );

  sky130_fd_sc_hd__nand4_2 u_353 (
      .A(register_02[3]),
      .B(register_02[0]),
      .C(register_02[2]),
      .D(register_02[1]),
      .Y(net_2302)
  );

  sky130_fd_sc_hd__nand3_2 u_494 (
      .A(register_02[0]),
      .B(register_02[2]),
      .C(register_02[1]),
      .Y(net_2316)
  );

  sky130_fd_sc_hd__a21o_2 u_500 (
      .A1(register_02[2]),
      .A2(register_02[1]),
      .B1(register_02[0]),
      .X(net_2330)
  );

  sky130_fd_sc_hd__inv_2 u_624 (
      .A(register_02[3]),
      .Y(net_2311)
  );

  sky130_fd_sc_hd__a21boi_2 u_199 (
      .A1(register_02[1]),
      .A2(net_2302),
      .B1_N(register_09[0]),
      .Y(net_2388)
  );

  sky130_fd_sc_hd__a21boi_2 u_341 (
      .A1(net_2302),
      .A2(net_2359),
      .B1_N(register_09[0]),
      .Y(net_2411)
  );

  sky130_fd_sc_hd__o211a_2 u_608 (
      .A1(register_02[3]),
      .A2(net_2316),
      .B1(net_2330),
      .C1(register_09[0]),
      .X(net_2332)
  );

  sky130_fd_sc_hd__a21boi_2 u_215 (
      .A1(net_2311),
      .A2(net_2316),
      .B1_N(register_09[0]),
      .Y(net_2317)
  );

  // Recovered sequential standard-cell instances.
  // register_02: state/counter register candidate
  sky130_fd_sc_hd__dfxtp_2 u_234_state (
      .CLK(clk),
      .D(net_2332),
      .Q(register_02[0])
  );

  sky130_fd_sc_hd__dfxtp_2 u_235_state (
      .CLK(clk),
      .D(net_2388),
      .Q(register_02[1])
  );

  sky130_fd_sc_hd__dfxtp_2 u_236_state (
      .CLK(clk),
      .D(net_2411),
      .Q(register_02[2])
  );

  sky130_fd_sc_hd__dfxtp_2 u_237_state (
      .CLK(clk),
      .D(net_2317),
      .Q(register_02[3])
  );

endmodule
