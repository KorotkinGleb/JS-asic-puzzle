// Structural state block recovered from GDS connectivity.
// shift_register: 12 bit(s), verified shift register.
module recovered_shift_register (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire register_16,  // recovered register boundary
    output wire [11:0] shift_register  // recovered current state
);

  // Physical-bit mapping.
  // shift_register[0] = u_5000.Q / net_1577; D=net_1584
  // shift_register[1] = u_5401.Q / net_1547; D=net_1544
  // shift_register[2] = u_5093.Q / net_1596; D=net_1597
  // shift_register[3] = u_5399.Q / net_1458; D=net_1464
  // shift_register[4] = u_5004.Q / net_1402; D=net_1354
  // shift_register[5] = u_5342.Q / net_1349; D=net_1279
  // shift_register[6] = u_4993.Q / net_1309; D=net_1351
  // shift_register[7] = u_5569.Q / net_1212; D=net_1214
  // shift_register[8] = u_5343.Q / net_1248; D=net_1250
  // shift_register[9] = u_5344.Q / net_1308; D=net_1315
  // shift_register[10] = u_5339.Q / net_1358; D=net_1412
  // shift_register[11] = u_5336.Q / net_1512; D=net_1514

  // Extracted combinational nets.
  wire net_604;
  wire net_1214;
  wire net_1250;
  wire net_1279;
  wire net_1315;
  wire net_1351;
  wire net_1354;
  wire net_1412;
  wire net_1464;
  wire net_1514;
  wire net_1544;
  wire net_1584;
  wire net_1597;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(register_16),
      .B(enable),
      .X(net_604)
  );

  sky130_fd_sc_hd__mux2_1 u_5007 (
      .A0(shift_register[2]),
      .A1(shift_register[1]),
      .S(net_604),
      .X(net_1597)
  );

  sky130_fd_sc_hd__mux2_1 u_5008 (
      .A0(shift_register[1]),
      .A1(shift_register[0]),
      .S(net_604),
      .X(net_1544)
  );

  sky130_fd_sc_hd__mux2_1 u_5011 (
      .A0(shift_register[3]),
      .A1(shift_register[2]),
      .S(net_604),
      .X(net_1464)
  );

  sky130_fd_sc_hd__mux2_1 u_5205 (
      .A0(shift_register[5]),
      .A1(shift_register[4]),
      .S(net_604),
      .X(net_1279)
  );

  sky130_fd_sc_hd__mux2_1 u_5263 (
      .A0(shift_register[6]),
      .A1(shift_register[5]),
      .S(net_604),
      .X(net_1351)
  );

  sky130_fd_sc_hd__mux2_1 u_5265 (
      .A0(shift_register[7]),
      .A1(shift_register[6]),
      .S(net_604),
      .X(net_1214)
  );

  sky130_fd_sc_hd__mux2_1 u_5340 (
      .A0(shift_register[0]),
      .A1(I),
      .S(net_604),
      .X(net_1584)
  );

  sky130_fd_sc_hd__mux2_1 u_5347 (
      .A0(shift_register[10]),
      .A1(shift_register[9]),
      .S(net_604),
      .X(net_1412)
  );

  sky130_fd_sc_hd__mux2_1 u_5400 (
      .A0(shift_register[11]),
      .A1(shift_register[10]),
      .S(net_604),
      .X(net_1514)
  );

  sky130_fd_sc_hd__mux2_1 u_5403 (
      .A0(shift_register[9]),
      .A1(shift_register[8]),
      .S(net_604),
      .X(net_1315)
  );

  sky130_fd_sc_hd__mux2_1 u_5433 (
      .A0(shift_register[4]),
      .A1(shift_register[3]),
      .S(net_604),
      .X(net_1354)
  );

  sky130_fd_sc_hd__mux2_1 u_5537 (
      .A0(shift_register[8]),
      .A1(shift_register[7]),
      .S(net_604),
      .X(net_1250)
  );

  // Recovered sequential standard-cell instances.
  // shift_register: verified shift register
  sky130_fd_sc_hd__dfrtp_2 u_5000_state (
      .CLK(clk),
      .D(net_1584),
      .RESET_B(rst_n),
      .Q(shift_register[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5401_state (
      .CLK(clk),
      .D(net_1544),
      .RESET_B(rst_n),
      .Q(shift_register[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5093_state (
      .CLK(clk),
      .D(net_1597),
      .RESET_B(rst_n),
      .Q(shift_register[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5399_state (
      .CLK(clk),
      .D(net_1464),
      .RESET_B(rst_n),
      .Q(shift_register[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5004_state (
      .CLK(clk),
      .D(net_1354),
      .RESET_B(rst_n),
      .Q(shift_register[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5342_state (
      .CLK(clk),
      .D(net_1279),
      .RESET_B(rst_n),
      .Q(shift_register[5])
  );

  sky130_fd_sc_hd__dfrtp_2 u_4993_state (
      .CLK(clk),
      .D(net_1351),
      .RESET_B(rst_n),
      .Q(shift_register[6])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5569_state (
      .CLK(clk),
      .D(net_1214),
      .RESET_B(rst_n),
      .Q(shift_register[7])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5343_state (
      .CLK(clk),
      .D(net_1250),
      .RESET_B(rst_n),
      .Q(shift_register[8])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5344_state (
      .CLK(clk),
      .D(net_1315),
      .RESET_B(rst_n),
      .Q(shift_register[9])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5339_state (
      .CLK(clk),
      .D(net_1412),
      .RESET_B(rst_n),
      .Q(shift_register[10])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5336_state (
      .CLK(clk),
      .D(net_1514),
      .RESET_B(rst_n),
      .Q(shift_register[11])
  );

endmodule
