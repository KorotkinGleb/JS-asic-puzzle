// Structural state block recovered from GDS connectivity.
// register_04: 4 bit(s), state/counter register candidate.
module recovered_register_04 (
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output wire [3:0] register_04  // recovered current state
);

  // Physical-bit mapping.
  // register_04[0] = u_6435.Q / net_206; D=net_921
  // register_04[1] = u_6436.Q / net_173; D=net_1059
  // register_04[2] = u_6442.Q / net_171; D=net_827
  // register_04[3] = u_6451.Q / net_205; D=net_972

  // Extracted combinational nets.
  wire net_604;
  wire net_820;
  wire net_827;
  wire net_873;
  wire net_874;
  wire net_876;
  wire net_878;
  wire net_879;
  wire net_918;
  wire net_921;
  wire net_968;
  wire net_970;
  wire net_972;
  wire net_1059;

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

  sky130_fd_sc_hd__a31o_2 u_6403 (
      .A1(net_873),
      .A2(net_604),
      .A3(register_04[2]),
      .B1(register_04[3]),
      .X(net_918)
  );

  sky130_fd_sc_hd__and4_2 u_6404 (
      .A(net_873),
      .B(net_604),
      .C(register_04[3]),
      .D(register_04[2]),
      .X(net_968)
  );

  sky130_fd_sc_hd__nand2_2 u_6445 (
      .A(net_873),
      .B(net_604),
      .Y(net_879)
  );

  sky130_fd_sc_hd__and3_2 u_6441 (
      .A(net_873),
      .B(net_604),
      .C(net_820),
      .X(net_876)
  );

  sky130_fd_sc_hd__nand3_2 u_6473 (
      .A(register_04[1]),
      .B(register_04[0]),
      .C(net_968),
      .Y(net_878)
  );

  sky130_fd_sc_hd__a21o_2 u_6474 (
      .A1(register_04[1]),
      .A2(net_968),
      .B1(register_04[0]),
      .X(net_874)
  );

  sky130_fd_sc_hd__inv_2 u_6478 (
      .A(net_968),
      .Y(net_970)
  );

  sky130_fd_sc_hd__xor2_2 u_6481 (
      .A(register_04[1]),
      .B(net_968),
      .X(net_1059)
  );

  sky130_fd_sc_hd__mux2_1 u_6444 (
      .A0(net_876),
      .A1(net_879),
      .S(register_04[2]),
      .X(net_827)
  );

  sky130_fd_sc_hd__o311a_2 u_6437 (
      .A1(register_04[2]),
      .A2(net_820),
      .A3(net_879),
      .B1(net_878),
      .C1(net_874),
      .X(net_921)
  );

  sky130_fd_sc_hd__o211a_2 u_6446 (
      .A1(net_820),
      .A2(net_879),
      .B1(net_918),
      .C1(net_970),
      .X(net_972)
  );

  // Recovered sequential standard-cell instances.
  // register_04: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_6435_state (
      .CLK(clk),
      .D(net_921),
      .RESET_B(rst_n),
      .Q(register_04[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6436_state (
      .CLK(clk),
      .D(net_1059),
      .RESET_B(rst_n),
      .Q(register_04[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6442_state (
      .CLK(clk),
      .D(net_827),
      .RESET_B(rst_n),
      .Q(register_04[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_6451_state (
      .CLK(clk),
      .D(net_972),
      .RESET_B(rst_n),
      .Q(register_04[3])
  );

endmodule
