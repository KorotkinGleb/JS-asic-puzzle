// Structural state block recovered from GDS connectivity.
// register_15: 8 bit(s), state/counter register candidate.
module recovered_register_15 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output wire [7:0] register_15  // recovered current state
);

  // Physical-bit mapping.
  // register_15[0] = u_1229.Q / net_2226; D=net_2240
  // register_15[1] = u_1249.Q / net_2101; D=net_2075
  // register_15[2] = u_1250.Q / net_1996; D=net_1997
  // register_15[3] = u_1264.Q / net_2157; D=net_2160
  // register_15[4] = u_1809.Q / net_2241; D=net_2243
  // register_15[5] = u_2036.Q / net_2155; D=net_2132
  // register_15[6] = u_2037.Q / net_2069; D=net_2097
  // register_15[7] = u_2039.Q / net_1998; D=net_2011

  // Extracted combinational nets.
  wire net_604;
  wire net_1970;
  wire net_1971;
  wire net_1972;
  wire net_1997;
  wire net_2008;
  wire net_2010;
  wire net_2011;
  wire net_2070;
  wire net_2072;
  wire net_2073;
  wire net_2074;
  wire net_2075;
  wire net_2097;
  wire net_2129;
  wire net_2132;
  wire net_2154;
  wire net_2160;
  wire net_2184;
  wire net_2185;
  wire net_2229;
  wire net_2240;
  wire net_2242;
  wire net_2243;
  wire net_2245;
  wire net_2261;
  wire net_2280;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__or4b_2 u_1770 (
      .A(register_03[2]),
      .B(register_03[1]),
      .C(register_03[0]),
      .D_N(register_03[3]),
      .X(net_2074)
  );

  sky130_fd_sc_hd__and4bb_2 u_1788 (
      .A_N(register_03[1]),
      .B_N(register_03[0]),
      .C(register_03[2]),
      .D(register_03[3]),
      .X(net_2185)
  );

  sky130_fd_sc_hd__or4b_2 u_1803 (
      .A(register_03[3]),
      .B(register_03[2]),
      .C(register_03[1]),
      .D_N(register_03[0]),
      .X(net_2229)
  );

  sky130_fd_sc_hd__inv_2 u_1968 (
      .A(register_15[4]),
      .Y(net_2261)
  );

  sky130_fd_sc_hd__inv_2 u_2012 (
      .A(register_15[6]),
      .Y(net_2129)
  );

  sky130_fd_sc_hd__inv_2 u_2013 (
      .A(register_15[2]),
      .Y(net_2008)
  );

  sky130_fd_sc_hd__or4b_2 u_2396 (
      .A(register_03[3]),
      .B(register_03[1]),
      .C(register_03[0]),
      .D_N(register_03[2]),
      .X(net_1972)
  );

  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(register_16),
      .B(enable),
      .X(net_604)
  );

  sky130_fd_sc_hd__nand2_2 u_1231 (
      .A(I),
      .B(net_604),
      .Y(net_2280)
  );

  sky130_fd_sc_hd__nand2_2 u_1255 (
      .A(I),
      .B(net_604),
      .Y(net_2073)
  );

  sky130_fd_sc_hd__nand4_2 u_2034 (
      .A(I),
      .B(net_604),
      .C(register_15[3]),
      .D(net_2185),
      .Y(net_2154)
  );

  sky130_fd_sc_hd__a31o_2 u_2049 (
      .A1(I),
      .A2(net_604),
      .A3(net_2185),
      .B1(register_15[3]),
      .X(net_2184)
  );

  sky130_fd_sc_hd__nand2_2 u_2370 (
      .A(I),
      .B(net_604),
      .Y(net_1971)
  );

  sky130_fd_sc_hd__or4_2 u_1244 (
      .A(register_15[0]),
      .B(net_2261),
      .C(net_2229),
      .D(net_2280),
      .X(net_2245)
  );

  sky130_fd_sc_hd__nor2_2 u_1798 (
      .A(net_2229),
      .B(net_2280),
      .Y(net_2242)
  );

  sky130_fd_sc_hd__or4_2 u_1252 (
      .A(register_15[1]),
      .B(net_2129),
      .C(net_2074),
      .D(net_2073),
      .X(net_2072)
  );

  sky130_fd_sc_hd__nor2_2 u_2143 (
      .A(net_2074),
      .B(net_2073),
      .Y(net_2070)
  );

  sky130_fd_sc_hd__nand2b_2 u_1792 (
      .A_N(register_15[5]),
      .B(net_2154),
      .Y(net_2132)
  );

  sky130_fd_sc_hd__o21a_2 u_1780 (
      .A1(register_15[5]),
      .A2(net_2154),
      .B1(net_2184),
      .X(net_2160)
  );

  sky130_fd_sc_hd__or4_2 u_144 (
      .A(register_15[7]),
      .B(net_2008),
      .C(net_1972),
      .D(net_1971),
      .X(net_2010)
  );

  sky130_fd_sc_hd__nor2_2 u_2359 (
      .A(net_1972),
      .B(net_1971),
      .Y(net_1970)
  );

  sky130_fd_sc_hd__a21o_2 u_1777 (
      .A1(register_15[4]),
      .A2(net_2242),
      .B1(register_15[0]),
      .X(net_2240)
  );

  sky130_fd_sc_hd__o21a_2 u_1781 (
      .A1(register_15[4]),
      .A2(net_2242),
      .B1(net_2245),
      .X(net_2243)
  );

  sky130_fd_sc_hd__o21a_2 u_1795 (
      .A1(register_15[6]),
      .A2(net_2070),
      .B1(net_2072),
      .X(net_2097)
  );

  sky130_fd_sc_hd__a21o_2 u_1796 (
      .A1(register_15[6]),
      .A2(net_2070),
      .B1(register_15[1]),
      .X(net_2075)
  );

  sky130_fd_sc_hd__a21o_2 u_145 (
      .A1(register_15[2]),
      .A2(net_1970),
      .B1(register_15[7]),
      .X(net_2011)
  );

  sky130_fd_sc_hd__o21a_2 u_147 (
      .A1(register_15[2]),
      .A2(net_1970),
      .B1(net_2010),
      .X(net_1997)
  );

  // Recovered sequential standard-cell instances.
  // register_15: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_1229_state (
      .CLK(clk),
      .D(net_2240),
      .RESET_B(rst_n),
      .Q(register_15[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1249_state (
      .CLK(clk),
      .D(net_2075),
      .RESET_B(rst_n),
      .Q(register_15[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1250_state (
      .CLK(clk),
      .D(net_1997),
      .RESET_B(rst_n),
      .Q(register_15[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1264_state (
      .CLK(clk),
      .D(net_2160),
      .RESET_B(rst_n),
      .Q(register_15[3])
  );

  sky130_fd_sc_hd__dfrtp_2 u_1809_state (
      .CLK(clk),
      .D(net_2243),
      .RESET_B(rst_n),
      .Q(register_15[4])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2036_state (
      .CLK(clk),
      .D(net_2132),
      .RESET_B(rst_n),
      .Q(register_15[5])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2037_state (
      .CLK(clk),
      .D(net_2097),
      .RESET_B(rst_n),
      .Q(register_15[6])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2039_state (
      .CLK(clk),
      .D(net_2011),
      .RESET_B(rst_n),
      .Q(register_15[7])
  );

endmodule
