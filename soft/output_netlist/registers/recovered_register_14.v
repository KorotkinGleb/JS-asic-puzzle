// Structural state block recovered from GDS connectivity.
// register_14: 6 bit(s), state/counter register candidate.
module recovered_register_14 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output wire [5:0] register_14  // recovered current state
);

  // Physical-bit mapping.
  // register_14[0] = u_1228.Q / net_2276; D=net_2307
  // register_14[1] = u_1230.Q / net_2347; D=net_2354
  // register_14[2] = u_1258.Q / net_2443; D=net_2438
  // register_14[3] = u_1626.Q / net_2442; D=net_2464
  // register_14[4] = u_1808.Q / net_2273; D=net_2274
  // register_14[5] = u_1810.Q / net_2346; D=net_2345

  // Extracted combinational nets.
  wire net_604;
  wire net_2274;
  wire net_2275;
  wire net_2277;
  wire net_2301;
  wire net_2307;
  wire net_2344;
  wire net_2345;
  wire net_2354;
  wire net_2377;
  wire net_2418;
  wire net_2419;
  wire net_2438;
  wire net_2440;
  wire net_2441;
  wire net_2464;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__and4bb_2 u_1246 (
      .A_N(register_03[2]),
      .B_N(register_03[1]),
      .C(register_03[0]),
      .D(register_03[3]),
      .X(net_2419)
  );

  sky130_fd_sc_hd__and4b_2 u_1248 (
      .A_N(register_03[1]),
      .B(register_03[0]),
      .C(register_03[2]),
      .D(register_03[3]),
      .X(net_2418)
  );

  sky130_fd_sc_hd__and4bb_2 u_1807 (
      .A_N(register_03[3]),
      .B_N(register_03[1]),
      .C(register_03[0]),
      .D(register_03[2]),
      .X(net_2277)
  );

  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(register_16),
      .B(enable),
      .X(net_604)
  );

  sky130_fd_sc_hd__a31o_2 u_1232 (
      .A1(I),
      .A2(net_604),
      .A3(net_2277),
      .B1(register_14[0]),
      .X(net_2301)
  );

  sky130_fd_sc_hd__a31o_2 u_1234 (
      .A1(I),
      .A2(net_604),
      .A3(net_2419),
      .B1(register_14[1]),
      .X(net_2377)
  );

  sky130_fd_sc_hd__nand4_2 u_1381 (
      .A(I),
      .B(net_604),
      .C(register_14[2]),
      .D(net_2418),
      .Y(net_2441)
  );

  sky130_fd_sc_hd__a31o_2 u_1635 (
      .A1(I),
      .A2(net_604),
      .A3(net_2418),
      .B1(register_14[2]),
      .X(net_2440)
  );

  sky130_fd_sc_hd__nand4_2 u_1641 (
      .A(I),
      .B(net_604),
      .C(register_14[1]),
      .D(net_2419),
      .Y(net_2344)
  );

  sky130_fd_sc_hd__nand4_2 u_1772 (
      .A(I),
      .B(net_604),
      .C(register_14[0]),
      .D(net_2277),
      .Y(net_2275)
  );

  sky130_fd_sc_hd__nand2b_2 u_1675 (
      .A_N(register_14[3]),
      .B(net_2441),
      .Y(net_2464)
  );

  sky130_fd_sc_hd__o21a_2 u_1611 (
      .A1(register_14[3]),
      .A2(net_2441),
      .B1(net_2440),
      .X(net_2438)
  );

  sky130_fd_sc_hd__o21a_2 u_1235 (
      .A1(register_14[5]),
      .A2(net_2344),
      .B1(net_2377),
      .X(net_2354)
  );

  sky130_fd_sc_hd__nand2b_2 u_1240 (
      .A_N(register_14[5]),
      .B(net_2344),
      .Y(net_2345)
  );

  sky130_fd_sc_hd__o21a_2 u_1790 (
      .A1(register_14[4]),
      .A2(net_2275),
      .B1(net_2301),
      .X(net_2307)
  );

  sky130_fd_sc_hd__nand2b_2 u_1959 (
      .A_N(register_14[4]),
      .B(net_2275),
      .Y(net_2274)
  );

  // Recovered sequential standard-cell instances.
  // register_14: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_1228_state (
      .CLK(clk),
      .D(net_2307),
      .RESET_B(rst_n),
      .Q(register_14[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1230_state (
      .CLK(clk),
      .D(net_2354),
      .RESET_B(rst_n),
      .Q(register_14[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1258_state (
      .CLK(clk),
      .D(net_2438),
      .RESET_B(rst_n),
      .Q(register_14[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1626_state (
      .CLK(clk),
      .D(net_2464),
      .RESET_B(rst_n),
      .Q(register_14[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1808_state (
      .CLK(clk),
      .D(net_2274),
      .RESET_B(rst_n),
      .Q(register_14[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1810_state (
      .CLK(clk),
      .D(net_2345),
      .RESET_B(rst_n),
      .Q(register_14[5])
  );

endmodule
