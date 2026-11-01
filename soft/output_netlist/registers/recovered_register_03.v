// Structural state block recovered from GDS connectivity.
// register_03: 4 bit(s), state/counter register candidate.
module recovered_register_03 (
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire register_16,  // recovered register boundary
    output wire [3:0] register_03  // recovered current state
);

  // Physical-bit mapping.
  // register_03[0] = u_4659.Q / net_1001; D=net_1307
  // register_03[1] = u_4661.Q / net_547; D=net_1568
  // register_03[2] = u_4662.Q / net_169; D=net_1448
  // register_03[3] = u_4838.Q / net_114; D=net_1394

  // Extracted combinational nets.
  wire net_604;
  wire net_873;
  wire net_1303;
  wire net_1307;
  wire net_1391;
  wire net_1394;
  wire net_1448;
  wire net_1453;
  wire net_1497;
  wire net_1535;
  wire net_1568;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__and4bb_2 u_4705 (
      .A_N(register_03[2]),
      .B_N(register_03[0]),
      .C(register_03[1]),
      .D(register_03[3]),
      .X(net_873)
  );

  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(register_16),
      .B(enable),
      .X(net_604)
  );

  sky130_fd_sc_hd__and3_2 u_4660 (
      .A(register_03[3]),
      .B(register_03[2]),
      .C(net_604),
      .X(net_1303)
  );

  sky130_fd_sc_hd__a21oi_2 u_4837 (
      .A1(register_03[2]),
      .A2(net_604),
      .B1(register_03[3]),
      .Y(net_1453)
  );

  sky130_fd_sc_hd__xnor2_2 u_4859 (
      .A(register_03[2]),
      .B(net_604),
      .Y(net_1497)
  );

  sky130_fd_sc_hd__a41oi_2 u_4863 (
      .A1(register_03[3]),
      .A2(register_03[2]),
      .A3(register_03[0]),
      .A4(net_604),
      .B1(register_03[1]),
      .Y(net_1535)
  );

  sky130_fd_sc_hd__and4_2 u_4949 (
      .A(register_03[3]),
      .B(register_03[2]),
      .C(register_03[0]),
      .D(net_604),
      .X(net_1391)
  );

  sky130_fd_sc_hd__xor2_2 u_4862 (
      .A(register_03[0]),
      .B(net_1303),
      .X(net_1307)
  );

  sky130_fd_sc_hd__a211oi_2 u_4835 (
      .A1(net_604),
      .A2(net_873),
      .B1(net_1453),
      .C1(net_1303),
      .Y(net_1394)
  );

  sky130_fd_sc_hd__nor2_2 u_4710 (
      .A(net_873),
      .B(net_1497),
      .Y(net_1448)
  );

  sky130_fd_sc_hd__a221oi_2 u_4663 (
      .A1(net_604),
      .A2(net_873),
      .B1(net_1391),
      .B2(register_03[1]),
      .C1(net_1535),
      .Y(net_1568)
  );

  // Recovered sequential standard-cell instances.
  // register_03: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_4659_state (
      .CLK(clk),
      .D(net_1307),
      .RESET_B(rst_n),
      .Q(register_03[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_4661_state (
      .CLK(clk),
      .D(net_1568),
      .RESET_B(rst_n),
      .Q(register_03[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_4662_state (
      .CLK(clk),
      .D(net_1448),
      .RESET_B(rst_n),
      .Q(register_03[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_4838_state (
      .CLK(clk),
      .D(net_1394),
      .RESET_B(rst_n),
      .Q(register_03[3])
  );

endmodule
