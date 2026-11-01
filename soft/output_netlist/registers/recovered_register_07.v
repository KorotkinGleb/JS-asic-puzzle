// Structural state block recovered from GDS connectivity.
// register_07: 8 bit(s), state/counter register candidate.
module recovered_register_07 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire register_16,  // recovered register boundary
    output wire [7:0] register_07  // recovered current state
);

  // Physical-bit mapping.
  // register_07[0] = u_6095.Q / net_433; D=net_458
  // register_07[1] = u_6106.Q / net_342; D=net_263
  // register_07[2] = u_6109.Q / net_338; D=net_347
  // register_07[3] = u_6111.Q / net_603; D=net_555
  // register_07[4] = u_6159.Q / net_534; D=net_578
  // register_07[5] = u_6197.Q / net_415; D=net_384
  // register_07[6] = u_6198.Q / net_339; D=net_297
  // register_07[7] = u_6199.Q / net_484; D=net_519

  // Extracted combinational nets.
  wire net_263;
  wire net_272;
  wire net_274;
  wire net_297;
  wire net_341;
  wire net_347;
  wire net_384;
  wire net_386;
  wire net_430;
  wire net_457;
  wire net_458;
  wire net_459;
  wire net_477;
  wire net_478;
  wire net_488;
  wire net_519;
  wire net_533;
  wire net_555;
  wire net_571;
  wire net_573;
  wire net_578;
  wire net_604;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(register_16),
      .B(enable),
      .X(net_604)
  );

  sky130_fd_sc_hd__nand2_2 u_5628 (
      .A(register_07[6]),
      .B(register_07[5]),
      .Y(net_341)
  );

  sky130_fd_sc_hd__and2_2 u_6032 (
      .A(register_07[6]),
      .B(register_07[5]),
      .X(net_457)
  );

  sky130_fd_sc_hd__and2b_2 u_6094 (
      .A_N(register_07[2]),
      .B(register_07[3]),
      .X(net_488)
  );

  sky130_fd_sc_hd__and3_2 u_6350 (
      .A(register_07[2]),
      .B(register_07[1]),
      .C(register_07[0]),
      .X(net_478)
  );

  sky130_fd_sc_hd__a21oi_2 u_6160 (
      .A1(I),
      .A2(net_604),
      .B1(register_07[3]),
      .Y(net_533)
  );

  sky130_fd_sc_hd__and3_2 u_6166 (
      .A(register_07[3]),
      .B(I),
      .C(net_604),
      .X(net_477)
  );

  sky130_fd_sc_hd__and4_2 u_5613 (
      .A(register_07[7]),
      .B(net_457),
      .C(net_477),
      .D(net_478),
      .X(net_573)
  );

  sky130_fd_sc_hd__nor2_2 u_5614 (
      .A(net_477),
      .B(net_533),
      .Y(net_555)
  );

  sky130_fd_sc_hd__inv_2 u_5626 (
      .A(net_477),
      .Y(net_459)
  );

  sky130_fd_sc_hd__a31o_2 u_5947 (
      .A1(net_457),
      .A2(net_477),
      .A3(net_478),
      .B1(register_07[7]),
      .X(net_571)
  );

  sky130_fd_sc_hd__a31o_2 u_6017 (
      .A1(register_07[6]),
      .A2(net_477),
      .A3(net_478),
      .B1(register_07[5]),
      .X(net_386)
  );

  sky130_fd_sc_hd__and3_2 u_6033 (
      .A(register_07[2]),
      .B(register_07[1]),
      .C(net_477),
      .X(net_272)
  );

  sky130_fd_sc_hd__nand2_2 u_6067 (
      .A(net_477),
      .B(net_478),
      .Y(net_430)
  );

  sky130_fd_sc_hd__a21o_2 u_6356 (
      .A1(register_07[2]),
      .A2(net_477),
      .B1(register_07[1]),
      .X(net_274)
  );

  sky130_fd_sc_hd__xor2_2 u_6110 (
      .A(register_07[4]),
      .B(net_573),
      .X(net_578)
  );

  sky130_fd_sc_hd__a32o_2 u_6103 (
      .A1(I),
      .A2(net_604),
      .A3(net_488),
      .B1(net_459),
      .B2(register_07[2]),
      .X(net_347)
  );

  sky130_fd_sc_hd__and2b_2 u_5615 (
      .A_N(net_573),
      .B(net_571),
      .X(net_519)
  );

  sky130_fd_sc_hd__o21a_2 u_5627 (
      .A1(net_341),
      .A2(net_430),
      .B1(net_386),
      .X(net_384)
  );

  sky130_fd_sc_hd__o21a_2 u_6041 (
      .A1(register_07[0]),
      .A2(net_272),
      .B1(net_430),
      .X(net_458)
  );

  sky130_fd_sc_hd__xnor2_2 u_6195 (
      .A(register_07[6]),
      .B(net_430),
      .Y(net_297)
  );

  sky130_fd_sc_hd__and2b_2 u_5603 (
      .A_N(net_272),
      .B(net_274),
      .X(net_263)
  );

  // Recovered sequential standard-cell instances.
  // register_07: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_6095_state (
      .CLK(clk),
      .D(net_458),
      .RESET_B(rst_n),
      .Q(register_07[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6106_state (
      .CLK(clk),
      .D(net_263),
      .RESET_B(rst_n),
      .Q(register_07[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6109_state (
      .CLK(clk),
      .D(net_347),
      .RESET_B(rst_n),
      .Q(register_07[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6111_state (
      .CLK(clk),
      .D(net_555),
      .RESET_B(rst_n),
      .Q(register_07[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6159_state (
      .CLK(clk),
      .D(net_578),
      .RESET_B(rst_n),
      .Q(register_07[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6197_state (
      .CLK(clk),
      .D(net_384),
      .RESET_B(rst_n),
      .Q(register_07[5])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6198_state (
      .CLK(clk),
      .D(net_297),
      .RESET_B(rst_n),
      .Q(register_07[6])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6199_state (
      .CLK(clk),
      .D(net_519),
      .RESET_B(rst_n),
      .Q(register_07[7])
  );

endmodule
