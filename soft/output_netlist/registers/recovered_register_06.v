// Structural state block recovered from GDS connectivity.
// register_06: 3 bit(s), state/counter register candidate.
module recovered_register_06 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output wire [2:0] register_06  // recovered current state
);

  // Physical-bit mapping.
  // register_06[0] = u_5634.Q / net_974; D=net_928
  // register_06[1] = u_5638.Q / net_828; D=net_831
  // register_06[2] = u_5639.Q / net_1006; D=net_1007

  // Extracted combinational nets.
  wire net_604;
  wire net_831;
  wire net_873;
  wire net_882;
  wire net_907;
  wire net_927;
  wire net_928;
  wire net_929;
  wire net_930;
  wire net_976;
  wire net_1004;
  wire net_1005;
  wire net_1007;

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

  sky130_fd_sc_hd__inv_2 u_5636 (
      .A(register_06[0]),
      .Y(net_929)
  );

  sky130_fd_sc_hd__or2_2 u_5684 (
      .A(register_06[2]),
      .B(I),
      .X(net_976)
  );

  sky130_fd_sc_hd__nand2_2 u_5711 (
      .A(register_06[2]),
      .B(I),
      .Y(net_930)
  );

  sky130_fd_sc_hd__inv_2 u_5630 (
      .A(net_873),
      .Y(net_907)
  );

  sky130_fd_sc_hd__inv_2 u_5775 (
      .A(net_604),
      .Y(net_1005)
  );

  sky130_fd_sc_hd__o211a_2 u_5677 (
      .A1(register_06[0]),
      .A2(net_930),
      .B1(net_976),
      .C1(net_604),
      .X(net_1004)
  );

  sky130_fd_sc_hd__mux2_1 u_5683 (
      .A0(net_930),
      .A1(net_976),
      .S(register_06[0]),
      .X(net_882)
  );

  sky130_fd_sc_hd__mux2_1 u_5778 (
      .A0(net_873),
      .A1(net_929),
      .S(net_1005),
      .X(net_927)
  );

  sky130_fd_sc_hd__a22o_2 u_5781 (
      .A1(net_1005),
      .A2(register_06[2]),
      .B1(net_1004),
      .B2(net_907),
      .X(net_1007)
  );

  sky130_fd_sc_hd__a31o_2 u_5640 (
      .A1(net_873),
      .A2(net_604),
      .A3(net_882),
      .B1(register_06[1]),
      .X(net_831)
  );

  sky130_fd_sc_hd__a21oi_2 u_5682 (
      .A1(net_929),
      .A2(net_930),
      .B1(net_927),
      .Y(net_928)
  );

  // Recovered sequential standard-cell instances.
  // register_06: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_5634_state (
      .CLK(clk),
      .D(net_928),
      .RESET_B(rst_n),
      .Q(register_06[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5638_state (
      .CLK(clk),
      .D(net_831),
      .RESET_B(rst_n),
      .Q(register_06[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_5639_state (
      .CLK(clk),
      .D(net_1007),
      .RESET_B(rst_n),
      .Q(register_06[2])
  );

endmodule
