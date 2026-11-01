// Structural state block recovered from GDS connectivity.
// register_17: 1 bit(s), ungrouped one-bit register.
module recovered_register_17 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    input wire [11:0] shift_register,  // recovered register boundary
    output wire register_17  // recovered current state
);

  // Physical-bit mapping.
  // register_17[0] = u_5337.Q / net_1360; D=net_1466

  // Extracted combinational nets.
  wire net_604;
  wire net_978;
  wire net_1002;
  wire net_1029;
  wire net_1454;
  wire net_1456;
  wire net_1466;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(register_16),
      .B(enable),
      .X(net_604)
  );

  sky130_fd_sc_hd__or4bb_2 u_5680 (
      .A(register_03[2]),
      .B(register_03[0]),
      .C_N(register_03[1]),
      .D_N(register_03[3]),
      .X(net_1002)
  );

  sky130_fd_sc_hd__or4_2 u_5681 (
      .A(register_03[2]),
      .B(register_03[3]),
      .C(register_03[0]),
      .D(register_03[1]),
      .X(net_1029)
  );

  sky130_fd_sc_hd__buf_2 u_5789 (
      .A(net_1029),
      .X(net_978)
  );

  sky130_fd_sc_hd__a22o_2 u_4999 (
      .A1(net_1029),
      .A2(shift_register[0]),
      .B1(net_978),
      .B2(shift_register[11]),
      .X(net_1456)
  );

  sky130_fd_sc_hd__a221o_2 u_5229 (
      .A1(net_1002),
      .A2(shift_register[9]),
      .B1(1'b1),
      .B2(shift_register[10]),
      .C1(net_1456),
      .X(net_1454)
  );

  sky130_fd_sc_hd__a31o_2 u_5256 (
      .A1(I),
      .A2(net_604),
      .A3(net_1454),
      .B1(register_17),
      .X(net_1466)
  );

  // Recovered sequential standard-cell instances.
  // register_17: ungrouped one-bit register
  sky130_fd_sc_hd__dfrtp_2 u_5337_state (
      .CLK(clk),
      .D(net_1466),
      .RESET_B(rst_n),
      .Q(register_17)
  );

endmodule
