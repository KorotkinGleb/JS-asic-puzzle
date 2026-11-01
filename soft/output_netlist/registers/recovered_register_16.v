// Structural state block recovered from GDS connectivity.
// register_16: 1 bit(s), ungrouped one-bit register.
module recovered_register_16 (
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire [3:0] register_04,  // recovered register boundary
    output wire register_16  // recovered current state
);

  // Physical-bit mapping.
  // register_16[0] = u_4182.Q / net_1968; D=net_2007

  // Extracted combinational nets.
  wire net_604;
  wire net_820;
  wire net_821;
  wire net_873;
  wire net_2007;

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

  sky130_fd_sc_hd__nand3b_2 u_6472 (
      .A_N(register_04[1]),
      .B(register_04[0]),
      .C(register_04[3]),
      .Y(net_820)
  );

  sky130_fd_sc_hd__nor2_2 u_6609 (
      .A(register_04[2]),
      .B(net_820),
      .Y(net_821)
  );

  sky130_fd_sc_hd__a31o_2 u_4602 (
      .A1(net_873),
      .A2(net_821),
      .A3(net_604),
      .B1(register_16),
      .X(net_2007)
  );

  // Recovered sequential standard-cell instances.
  // register_16: ungrouped one-bit register
  sky130_fd_sc_hd__dfrtp_2 u_4182_state (
      .CLK(clk),
      .D(net_2007),
      .RESET_B(rst_n),
      .Q(register_16)
  );

endmodule
