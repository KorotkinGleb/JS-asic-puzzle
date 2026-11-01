// Structural state block recovered from GDS connectivity.
// register_05: 2 bit(s), state/counter register candidate.
module recovered_register_05 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output wire [1:0] register_05  // recovered current state
);

  // Physical-bit mapping.
  // register_05[0] = u_2293.Q / net_1805; D=net_1800
  // register_05[1] = u_2372.Q / net_1797; D=net_1752

  // Extracted combinational nets.
  wire net_604;
  wire net_1752;
  wire net_1796;
  wire net_1800;
  wire net_1842;
  wire net_1876;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__nor4_2 u_2365 (
      .A(register_03[3]),
      .B(register_03[2]),
      .C(register_03[1]),
      .D(register_03[0]),
      .Y(net_1876)
  );

  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(register_16),
      .B(enable),
      .X(net_604)
  );

  sky130_fd_sc_hd__a31o_2 u_2361 (
      .A1(I),
      .A2(net_604),
      .A3(net_1876),
      .B1(register_05[0]),
      .X(net_1842)
  );

  sky130_fd_sc_hd__nand4_2 u_2369 (
      .A(I),
      .B(net_604),
      .C(register_05[0]),
      .D(net_1876),
      .Y(net_1796)
  );

  sky130_fd_sc_hd__o21a_2 u_2363 (
      .A1(register_05[1]),
      .A2(net_1796),
      .B1(net_1842),
      .X(net_1800)
  );

  sky130_fd_sc_hd__nand2b_2 u_2437 (
      .A_N(register_05[1]),
      .B(net_1796),
      .Y(net_1752)
  );

  // Recovered sequential standard-cell instances.
  // register_05: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_2293_state (
      .CLK(clk),
      .D(net_1800),
      .RESET_B(rst_n),
      .Q(register_05[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2372_state (
      .CLK(clk),
      .D(net_1752),
      .RESET_B(rst_n),
      .Q(register_05[1])
  );

endmodule
