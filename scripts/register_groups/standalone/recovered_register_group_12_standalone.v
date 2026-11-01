// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_12: state/counter register candidate; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_12_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // SET_B / net_322
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_02_q,  // inferred register vector
    input wire [2:0] register_group_09_q,  // inferred register vector
    output reg [7:0] register_group_12_q,  // current register state
    output wire [7:0] register_group_12_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_12_q[0] = u_2944.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_12_q[1] = u_2946.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_12_q[2] = u_2947.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_12_q[3] = u_2948.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_12_q[4] = u_2957.Q (sky130_fd_sc_hd__dfstp_2)
  // register_group_12_q[5] = u_2958.Q (sky130_fd_sc_hd__dfstp_2)
  // register_group_12_q[6] = u_2959.Q (sky130_fd_sc_hd__dfstp_2)
  // register_group_12_q[7] = u_2960.Q (sky130_fd_sc_hd__dfstp_2)

  // Recovered combinational nets.
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

  // Inlined Boolean functions of the recovered standard cells.
  // u_142: sky130_fd_sc_hd__or2_2
  assign net_1782 = (register_group_12_q[4]) | (net_1808);
  // u_171: sky130_fd_sc_hd__a21oi_2
  assign net_1958 = (!net_1978&!net_2016) | (!net_1683&!net_2016);
  // u_173: sky130_fd_sc_hd__nand2_2
  assign net_1788 = (!register_group_12_q[4]) | (!net_1808);
  // u_198: sky130_fd_sc_hd__and2_2
  assign net_1911 = (register_group_09_q[0]&net_2302);
  // u_240: sky130_fd_sc_hd__xor2_2
  assign net_1947 = (register_group_12_q[1]&!register_group_12_q[0]) | (!register_group_12_q[1]&register_group_12_q[0]);
  // u_353: sky130_fd_sc_hd__nand4_2
  assign net_2302 = (!register_group_02_q[3]) | (!register_group_02_q[0]) | (!register_group_02_q[2]) | (!register_group_02_q[1]);
  // u_743: sky130_fd_sc_hd__nand2b_2
  assign net_2016 = (net_604) | (!net_1911);
  // u_882: sky130_fd_sc_hd__or2_2
  assign net_1846 = (net_1911) | (net_604);
  // u_1166: sky130_fd_sc_hd__nor2_2
  assign net_1915 = (!net_2016&!net_1731);
  // u_2949: sky130_fd_sc_hd__xnor2_2
  assign net_1612 = (!net_1814&!net_1817) | (net_1814&net_1817);
  // u_2954: sky130_fd_sc_hd__nor3b_2
  assign net_1634 = (!net_604&!net_1635&net_1612);
  // u_2956: sky130_fd_sc_hd__a21boi_2
  assign net_1621 = (!I&net_604) | (!net_1612&net_604);
  // u_2963: sky130_fd_sc_hd__xnor2_2
  assign net_1731 = (!register_group_12_q[2]&!net_1732) | (register_group_12_q[2]&net_1732);
  // u_2965: sky130_fd_sc_hd__a221o_2
  assign net_1730 = (register_group_12_q[7]&net_1882) | (net_604&register_group_12_q[2]) | (net_1684);
  // u_2966: sky130_fd_sc_hd__and2b_2
  assign net_1849 = (!net_1673&net_1613);
  // u_2967: sky130_fd_sc_hd__xor2_2
  assign net_1732 = (register_group_12_q[1]&!register_group_12_q[7]) | (!register_group_12_q[1]&register_group_12_q[7]);
  // u_2969: sky130_fd_sc_hd__a221o_2
  assign net_1767 = (net_1882&register_group_12_q[3]) | (net_604&register_group_12_q[1]) | (net_1894);
  // u_2972: sky130_fd_sc_hd__a221o_2
  assign net_1789 = (net_1613&net_1635) | (net_604&register_group_12_q[4]) | (net_1882);
  // u_2973: sky130_fd_sc_hd__o22a_2
  assign net_1927 = (register_group_12_q[1]&net_1634) | (net_1846&net_1634) | (register_group_12_q[1]&net_1789) | (net_1846&net_1789);
  // u_2974: sky130_fd_sc_hd__o21a_2
  assign net_1894 = (net_1978&net_1958) | (net_1683&net_1958);
  // u_3012: sky130_fd_sc_hd__xnor2_2
  assign net_1635 = (!register_group_12_q[6]&!net_1947) | (register_group_12_q[6]&net_1947);
  // u_3014: sky130_fd_sc_hd__xor2_2
  assign net_1673 = (register_group_12_q[6]&!net_1808) | (!register_group_12_q[6]&net_1808);
  // u_3017: sky130_fd_sc_hd__xnor2_2
  assign net_1808 = (!register_group_12_q[2]&!net_1814) | (register_group_12_q[2]&net_1814);
  // u_3164: sky130_fd_sc_hd__o21ai_2
  assign net_1626 = (!I&!net_1612) | (!net_1621);
  // u_3167: sky130_fd_sc_hd__xor2_2
  assign net_1683 = (register_group_12_q[6]&!register_group_12_q[3]) | (!register_group_12_q[6]&register_group_12_q[3]);
  // u_3191: sky130_fd_sc_hd__nor2_2
  assign net_1684 = (!net_1612&!net_2016);
  // u_3277: sky130_fd_sc_hd__and3b_2
  assign net_1671 = (!net_604&net_1612&net_1673);
  // u_3278: sky130_fd_sc_hd__xnor2_2
  assign net_1725 = (!register_group_12_q[2]&!net_1726) | (register_group_12_q[2]&net_1726);
  // u_3281: sky130_fd_sc_hd__a21o_2
  assign net_1848 = (net_604&register_group_12_q[0]) | (net_1882);
  // u_3282: sky130_fd_sc_hd__xnor2_2
  assign net_1726 = (!register_group_12_q[4]&!register_group_12_q[5]) | (register_group_12_q[4]&register_group_12_q[5]);
  // u_3283: sky130_fd_sc_hd__xnor2_2
  assign net_1912 = (!net_1726&!net_1947) | (net_1726&net_1947);
  // u_3284: sky130_fd_sc_hd__o32a_2
  assign net_1850 = (net_1849&net_1846) | (net_1849&register_group_12_q[4]) | (net_1671&net_1846) | (net_1848&net_1846) | (net_1671&register_group_12_q[4]) | (net_1848&register_group_12_q[4]);
  // u_3285: sky130_fd_sc_hd__a221o_2
  assign net_1913 = (register_group_12_q[0]&net_1882) | (net_604&register_group_12_q[6]) | (net_1915);
  // u_3289: sky130_fd_sc_hd__xnor2_2
  assign net_1814 = (!register_group_12_q[3]&!register_group_12_q[1]) | (register_group_12_q[3]&register_group_12_q[1]);
  // u_3295: sky130_fd_sc_hd__xnor2_2
  assign net_1817 = (!register_group_12_q[5]&!register_group_12_q[7]) | (register_group_12_q[5]&register_group_12_q[7]);
  // u_3296: sky130_fd_sc_hd__xor2_2
  assign net_1978 = (register_group_12_q[4]&!register_group_12_q[0]) | (!register_group_12_q[4]&register_group_12_q[0]);
  // u_3477: sky130_fd_sc_hd__a22o_2
  assign net_1880 = (register_group_12_q[5]&net_1882) | (net_604&register_group_12_q[3]);
  // u_3483: sky130_fd_sc_hd__nor2_2
  assign net_1882 = (!net_1911&!net_604);
  // u_3487: sky130_fd_sc_hd__a22o_2
  assign net_1781 = (net_1882&register_group_12_q[2]) | (net_604&register_group_12_q[5]);
  // u_3489: sky130_fd_sc_hd__a31o_2
  assign net_1713 = (net_1787&net_1788&net_1782) | (net_1781);
  // u_3516: sky130_fd_sc_hd__a21o_2
  assign net_1851 = (net_1787&net_1912) | (net_1880);
  // u_3518: sky130_fd_sc_hd__and2b_2
  assign net_1787 = (!net_604&net_1911);
  // u_3587: sky130_fd_sc_hd__o221a_2
  assign net_1844 = (register_group_12_q[6]&net_2016&net_1626) | (net_1846&net_2016&net_1626) | (register_group_12_q[6]&net_1725&net_1626) | (net_1846&net_1725&net_1626);
  // u_3821: sky130_fd_sc_hd__nor2_2
  assign net_1613 = (!net_604&!net_1612);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!ff_4182_q&enable);

  // Destination D-pin vector.
  assign register_group_12_d[0] = net_1913;  // u_2944.D / net_1913
  assign register_group_12_d[1] = net_1927;  // u_2946.D / net_1927
  assign register_group_12_d[2] = net_1713;  // u_2947.D / net_1713
  assign register_group_12_d[3] = net_1767;  // u_2948.D / net_1767
  assign register_group_12_d[4] = net_1850;  // u_2957.D / net_1850
  assign register_group_12_d[5] = net_1851;  // u_2958.D / net_1851
  assign register_group_12_d[6] = net_1844;  // u_2959.D / net_1844
  assign register_group_12_d[7] = net_1730;  // u_2960.D / net_1730

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_12_q[0] <= 1'b0;
    else register_group_12_q[0] <= register_group_12_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_12_q[1] <= 1'b0;
    else register_group_12_q[1] <= register_group_12_d[1];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_12_q[2] <= 1'b0;
    else register_group_12_q[2] <= register_group_12_d[2];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_12_q[3] <= 1'b0;
    else register_group_12_q[3] <= register_group_12_d[3];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_12_q[4] <= 1'b1;
    else register_group_12_q[4] <= register_group_12_d[4];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_12_q[5] <= 1'b1;
    else register_group_12_q[5] <= register_group_12_d[5];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_12_q[6] <= 1'b1;
    else register_group_12_q[6] <= register_group_12_d[6];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_12_q[7] <= 1'b1;
    else register_group_12_q[7] <= register_group_12_d[7];
  end
endmodule
