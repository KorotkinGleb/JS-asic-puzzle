// Structural state block recovered from GDS connectivity.
// register_12: 8 bit(s), state/counter register candidate.
module recovered_register_12 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_02,  // recovered register boundary
    input wire [2:0] register_09,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output wire [7:0] register_12  // recovered current state
);

  // Physical-bit mapping.
  // register_12[0] = u_2944.Q / net_1950; D=net_1913
  // register_12[1] = u_2946.Q / net_1812; D=net_1927
  // register_12[2] = u_2947.Q / net_1715; D=net_1713
  // register_12[3] = u_2948.Q / net_1763; D=net_1767
  // register_12[4] = u_2957.Q / net_1806; D=net_1850
  // register_12[5] = u_2958.Q / net_1813; D=net_1851
  // register_12[6] = u_2959.Q / net_1675; D=net_1844
  // register_12[7] = u_2960.Q / net_1740; D=net_1730

  // Extracted combinational nets.
  wire net_604;
  wire net_1612;
  wire net_1613;
  wire net_1621;
  wire net_1626;
  wire net_1634;
  wire net_1635;
  wire net_1671;
  wire net_1673;
  wire net_1683;
  wire net_1684;
  wire net_1713;
  wire net_1725;
  wire net_1726;
  wire net_1730;
  wire net_1731;
  wire net_1732;
  wire net_1767;
  wire net_1781;
  wire net_1782;
  wire net_1787;
  wire net_1788;
  wire net_1789;
  wire net_1808;
  wire net_1814;
  wire net_1817;
  wire net_1844;
  wire net_1846;
  wire net_1848;
  wire net_1849;
  wire net_1850;
  wire net_1851;
  wire net_1880;
  wire net_1882;
  wire net_1894;
  wire net_1911;
  wire net_1912;
  wire net_1913;
  wire net_1915;
  wire net_1927;
  wire net_1947;
  wire net_1958;
  wire net_1978;
  wire net_2016;
  wire net_2302;

  // Recovered standard-cell instances.
  sky130_fd_sc_hd__xor2_2 u_240 (
      .A(register_12[1]),
      .B(register_12[0]),
      .X(net_1947)
  );

  sky130_fd_sc_hd__nand4_2 u_353 (
      .A(register_02[3]),
      .B(register_02[0]),
      .C(register_02[2]),
      .D(register_02[1]),
      .Y(net_2302)
  );

  sky130_fd_sc_hd__xor2_2 u_2967 (
      .A(register_12[1]),
      .B(register_12[7]),
      .X(net_1732)
  );

  sky130_fd_sc_hd__xor2_2 u_3167 (
      .A(register_12[6]),
      .B(register_12[3]),
      .X(net_1683)
  );

  sky130_fd_sc_hd__xnor2_2 u_3282 (
      .A(register_12[4]),
      .B(register_12[5]),
      .Y(net_1726)
  );

  sky130_fd_sc_hd__xnor2_2 u_3289 (
      .A(register_12[3]),
      .B(register_12[1]),
      .Y(net_1814)
  );

  sky130_fd_sc_hd__xnor2_2 u_3295 (
      .A(register_12[5]),
      .B(register_12[7]),
      .Y(net_1817)
  );

  sky130_fd_sc_hd__xor2_2 u_3296 (
      .A(register_12[4]),
      .B(register_12[0]),
      .X(net_1978)
  );

  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(register_16),
      .B(enable),
      .X(net_604)
  );

  sky130_fd_sc_hd__xnor2_2 u_3012 (
      .A(register_12[6]),
      .B(net_1947),
      .Y(net_1635)
  );

  sky130_fd_sc_hd__and2_2 u_198 (
      .A(register_09[0]),
      .B(net_2302),
      .X(net_1911)
  );

  sky130_fd_sc_hd__xnor2_2 u_2963 (
      .A(register_12[2]),
      .B(net_1732),
      .Y(net_1731)
  );

  sky130_fd_sc_hd__xnor2_2 u_3278 (
      .A(register_12[2]),
      .B(net_1726),
      .Y(net_1725)
  );

  sky130_fd_sc_hd__xnor2_2 u_3283 (
      .A(net_1726),
      .B(net_1947),
      .Y(net_1912)
  );

  sky130_fd_sc_hd__xnor2_2 u_3017 (
      .A(register_12[2]),
      .B(net_1814),
      .Y(net_1808)
  );

  sky130_fd_sc_hd__xnor2_2 u_2949 (
      .A(net_1814),
      .B(net_1817),
      .Y(net_1612)
  );

  sky130_fd_sc_hd__nand2b_2 u_743 (
      .A_N(net_604),
      .B(net_1911),
      .Y(net_2016)
  );

  sky130_fd_sc_hd__or2_2 u_882 (
      .A(net_1911),
      .B(net_604),
      .X(net_1846)
  );

  sky130_fd_sc_hd__nor2_2 u_3483 (
      .A(net_1911),
      .B(net_604),
      .Y(net_1882)
  );

  sky130_fd_sc_hd__and2b_2 u_3518 (
      .A_N(net_604),
      .B(net_1911),
      .X(net_1787)
  );

  sky130_fd_sc_hd__or2_2 u_142 (
      .A(register_12[4]),
      .B(net_1808),
      .X(net_1782)
  );

  sky130_fd_sc_hd__nand2_2 u_173 (
      .A(register_12[4]),
      .B(net_1808),
      .Y(net_1788)
  );

  sky130_fd_sc_hd__xor2_2 u_3014 (
      .A(register_12[6]),
      .B(net_1808),
      .X(net_1673)
  );

  sky130_fd_sc_hd__nor3b_2 u_2954 (
      .A(net_604),
      .B(net_1635),
      .C_N(net_1612),
      .Y(net_1634)
  );

  sky130_fd_sc_hd__a21boi_2 u_2956 (
      .A1(I),
      .A2(net_1612),
      .B1_N(net_604),
      .Y(net_1621)
  );

  sky130_fd_sc_hd__nor2_2 u_3821 (
      .A(net_604),
      .B(net_1612),
      .Y(net_1613)
  );

  sky130_fd_sc_hd__a21oi_2 u_171 (
      .A1(net_1978),
      .A2(net_1683),
      .B1(net_2016),
      .Y(net_1958)
  );

  sky130_fd_sc_hd__nor2_2 u_1166 (
      .A(net_2016),
      .B(net_1731),
      .Y(net_1915)
  );

  sky130_fd_sc_hd__nor2_2 u_3191 (
      .A(net_1612),
      .B(net_2016),
      .Y(net_1684)
  );

  sky130_fd_sc_hd__a21o_2 u_3281 (
      .A1(net_604),
      .A2(register_12[0]),
      .B1(net_1882),
      .X(net_1848)
  );

  sky130_fd_sc_hd__a22o_2 u_3477 (
      .A1(net_604),
      .A2(register_12[3]),
      .B1(register_12[5]),
      .B2(net_1882),
      .X(net_1880)
  );

  sky130_fd_sc_hd__a22o_2 u_3487 (
      .A1(net_604),
      .A2(register_12[5]),
      .B1(net_1882),
      .B2(register_12[2]),
      .X(net_1781)
  );

  sky130_fd_sc_hd__and3b_2 u_3277 (
      .A_N(net_604),
      .B(net_1612),
      .C(net_1673),
      .X(net_1671)
  );

  sky130_fd_sc_hd__o21ai_2 u_3164 (
      .A1(I),
      .A2(net_1612),
      .B1(net_1621),
      .Y(net_1626)
  );

  sky130_fd_sc_hd__and2b_2 u_2966 (
      .A_N(net_1673),
      .B(net_1613),
      .X(net_1849)
  );

  sky130_fd_sc_hd__a221o_2 u_2972 (
      .A1(net_604),
      .A2(register_12[4]),
      .B1(net_1613),
      .B2(net_1635),
      .C1(net_1882),
      .X(net_1789)
  );

  sky130_fd_sc_hd__o21a_2 u_2974 (
      .A1(net_1978),
      .A2(net_1683),
      .B1(net_1958),
      .X(net_1894)
  );

  sky130_fd_sc_hd__a221o_2 u_3285 (
      .A1(net_604),
      .A2(register_12[6]),
      .B1(register_12[0]),
      .B2(net_1882),
      .C1(net_1915),
      .X(net_1913)
  );

  sky130_fd_sc_hd__a221o_2 u_2965 (
      .A1(net_604),
      .A2(register_12[2]),
      .B1(register_12[7]),
      .B2(net_1882),
      .C1(net_1684),
      .X(net_1730)
  );

  sky130_fd_sc_hd__a21o_2 u_3516 (
      .A1(net_1787),
      .A2(net_1912),
      .B1(net_1880),
      .X(net_1851)
  );

  sky130_fd_sc_hd__a31o_2 u_3489 (
      .A1(net_1787),
      .A2(net_1788),
      .A3(net_1782),
      .B1(net_1781),
      .X(net_1713)
  );

  sky130_fd_sc_hd__o221a_2 u_3587 (
      .A1(register_12[6]),
      .A2(net_1846),
      .B1(net_2016),
      .B2(net_1725),
      .C1(net_1626),
      .X(net_1844)
  );

  sky130_fd_sc_hd__o32a_2 u_3284 (
      .A1(net_1849),
      .A2(net_1671),
      .A3(net_1848),
      .B1(net_1846),
      .B2(register_12[4]),
      .X(net_1850)
  );

  sky130_fd_sc_hd__o22a_2 u_2973 (
      .A1(register_12[1]),
      .A2(net_1846),
      .B1(net_1634),
      .B2(net_1789),
      .X(net_1927)
  );

  sky130_fd_sc_hd__a221o_2 u_2969 (
      .A1(net_604),
      .A2(register_12[1]),
      .B1(net_1882),
      .B2(register_12[3]),
      .C1(net_1894),
      .X(net_1767)
  );

  // Recovered sequential standard-cell instances.
  // register_12: state/counter register candidate
  sky130_fd_sc_hd__dfrtp_2 u_2944_state (
      .CLK(clk),
      .D(net_1913),
      .RESET_B(rst_n),
      .Q(register_12[0])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2946_state (
      .CLK(clk),
      .D(net_1927),
      .RESET_B(rst_n),
      .Q(register_12[1])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2947_state (
      .CLK(clk),
      .D(net_1713),
      .RESET_B(rst_n),
      .Q(register_12[2])
  );

  sky130_fd_sc_hd__dfrtp_2 u_2948_state (
      .CLK(clk),
      .D(net_1767),
      .RESET_B(rst_n),
      .Q(register_12[3])
  );

  sky130_fd_sc_hd__dfstp_2 u_2957_state (
      .CLK(clk),
      .D(net_1850),
      .SET_B(rst_n),
      .Q(register_12[4])
  );

  sky130_fd_sc_hd__dfstp_2 u_2958_state (
      .CLK(clk),
      .D(net_1851),
      .SET_B(rst_n),
      .Q(register_12[5])
  );

  sky130_fd_sc_hd__dfstp_2 u_2959_state (
      .CLK(clk),
      .D(net_1844),
      .SET_B(rst_n),
      .Q(register_12[6])
  );

  sky130_fd_sc_hd__dfstp_2 u_2960_state (
      .CLK(clk),
      .D(net_1730),
      .SET_B(rst_n),
      .Q(register_12[7])
  );

endmodule
