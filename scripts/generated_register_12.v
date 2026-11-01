// Stateful RTL recovered from puzzle.gds.
// The first source-register layer is the module boundary.
module recovered_register_12 (
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire [3:0] register_02,  // source register at backtrace boundary
    input wire [2:0] register_09,  // source register at backtrace boundary
    input wire register_16,  // u_4182.Q at backtrace boundary
    input wire serial_in,
    output reg [7:0] register_12  // recovered register state
);

  // Physical flip-flop to RTL-bit mapping.
  // register_12[0] = u_2944.Q
  // register_12[1] = u_2946.Q
  // register_12[2] = u_2947.Q
  // register_12[3] = u_2948.Q
  // register_12[4] = u_2957.Q
  // register_12[5] = u_2958.Q
  // register_12[6] = u_2959.Q
  // register_12[7] = u_2960.Q

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

  // Recovered combinational next-state logic.
  // u_142: sky130_fd_sc_hd__or2_2
  assign net_1782 = (register_12[4]) | (net_1808);
  // u_171: sky130_fd_sc_hd__a21oi_2
  assign net_1958 = (!net_1978&!net_2016) | (!net_1683&!net_2016);
  // u_173: sky130_fd_sc_hd__nand2_2
  assign net_1788 = (!register_12[4]) | (!net_1808);
  // u_198: sky130_fd_sc_hd__and2_2
  assign net_1911 = (register_09[0]&net_2302);
  // u_240: sky130_fd_sc_hd__xor2_2
  assign net_1947 = (register_12[1]&!register_12[0]) | (!register_12[1]&register_12[0]);
  // u_353: sky130_fd_sc_hd__nand4_2
  assign net_2302 = (!register_02[3]) | (!register_02[0]) | (!register_02[2]) | (!register_02[1]);
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
  assign net_1621 = (!serial_in&net_604) | (!net_1612&net_604);
  // u_2963: sky130_fd_sc_hd__xnor2_2
  assign net_1731 = (!register_12[2]&!net_1732) | (register_12[2]&net_1732);
  // u_2965: sky130_fd_sc_hd__a221o_2
  assign net_1730 = (register_12[7]&net_1882) | (net_604&register_12[2]) | (net_1684);
  // u_2966: sky130_fd_sc_hd__and2b_2
  assign net_1849 = (!net_1673&net_1613);
  // u_2967: sky130_fd_sc_hd__xor2_2
  assign net_1732 = (register_12[1]&!register_12[7]) | (!register_12[1]&register_12[7]);
  // u_2969: sky130_fd_sc_hd__a221o_2
  assign net_1767 = (net_1882&register_12[3]) | (net_604&register_12[1]) | (net_1894);
  // u_2972: sky130_fd_sc_hd__a221o_2
  assign net_1789 = (net_1613&net_1635) | (net_604&register_12[4]) | (net_1882);
  // u_2973: sky130_fd_sc_hd__o22a_2
  assign net_1927 = (register_12[1]&net_1634) | (net_1846&net_1634) | (register_12[1]&net_1789) | (net_1846&net_1789);
  // u_2974: sky130_fd_sc_hd__o21a_2
  assign net_1894 = (net_1978&net_1958) | (net_1683&net_1958);
  // u_3012: sky130_fd_sc_hd__xnor2_2
  assign net_1635 = (!register_12[6]&!net_1947) | (register_12[6]&net_1947);
  // u_3014: sky130_fd_sc_hd__xor2_2
  assign net_1673 = (register_12[6]&!net_1808) | (!register_12[6]&net_1808);
  // u_3017: sky130_fd_sc_hd__xnor2_2
  assign net_1808 = (!register_12[2]&!net_1814) | (register_12[2]&net_1814);
  // u_3164: sky130_fd_sc_hd__o21ai_2
  assign net_1626 = (!serial_in&!net_1612) | (!net_1621);
  // u_3167: sky130_fd_sc_hd__xor2_2
  assign net_1683 = (register_12[6]&!register_12[3]) | (!register_12[6]&register_12[3]);
  // u_3191: sky130_fd_sc_hd__nor2_2
  assign net_1684 = (!net_1612&!net_2016);
  // u_3277: sky130_fd_sc_hd__and3b_2
  assign net_1671 = (!net_604&net_1612&net_1673);
  // u_3278: sky130_fd_sc_hd__xnor2_2
  assign net_1725 = (!register_12[2]&!net_1726) | (register_12[2]&net_1726);
  // u_3281: sky130_fd_sc_hd__a21o_2
  assign net_1848 = (net_604&register_12[0]) | (net_1882);
  // u_3282: sky130_fd_sc_hd__xnor2_2
  assign net_1726 = (!register_12[4]&!register_12[5]) | (register_12[4]&register_12[5]);
  // u_3283: sky130_fd_sc_hd__xnor2_2
  assign net_1912 = (!net_1726&!net_1947) | (net_1726&net_1947);
  // u_3284: sky130_fd_sc_hd__o32a_2
  assign net_1850 = (net_1849&net_1846) | (net_1849&register_12[4]) | (net_1671&net_1846) | (net_1848&net_1846) | (net_1671&register_12[4]) | (net_1848&register_12[4]);
  // u_3285: sky130_fd_sc_hd__a221o_2
  assign net_1913 = (register_12[0]&net_1882) | (net_604&register_12[6]) | (net_1915);
  // u_3289: sky130_fd_sc_hd__xnor2_2
  assign net_1814 = (!register_12[3]&!register_12[1]) | (register_12[3]&register_12[1]);
  // u_3295: sky130_fd_sc_hd__xnor2_2
  assign net_1817 = (!register_12[5]&!register_12[7]) | (register_12[5]&register_12[7]);
  // u_3296: sky130_fd_sc_hd__xor2_2
  assign net_1978 = (register_12[4]&!register_12[0]) | (!register_12[4]&register_12[0]);
  // u_3477: sky130_fd_sc_hd__a22o_2
  assign net_1880 = (register_12[5]&net_1882) | (net_604&register_12[3]);
  // u_3483: sky130_fd_sc_hd__nor2_2
  assign net_1882 = (!net_1911&!net_604);
  // u_3487: sky130_fd_sc_hd__a22o_2
  assign net_1781 = (net_1882&register_12[2]) | (net_604&register_12[5]);
  // u_3489: sky130_fd_sc_hd__a31o_2
  assign net_1713 = (net_1787&net_1788&net_1782) | (net_1781);
  // u_3516: sky130_fd_sc_hd__a21o_2
  assign net_1851 = (net_1787&net_1912) | (net_1880);
  // u_3518: sky130_fd_sc_hd__and2b_2
  assign net_1787 = (!net_604&net_1911);
  // u_3587: sky130_fd_sc_hd__o221a_2
  assign net_1844 = (register_12[6]&net_2016&net_1626) | (net_1846&net_2016&net_1626) | (register_12[6]&net_1725&net_1626) | (net_1846&net_1725&net_1626);
  // u_3821: sky130_fd_sc_hd__nor2_2
  assign net_1613 = (!net_604&!net_1612);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);

  // Recovered registers; D logic is used directly.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[0] <= 1'b0;
    else register_12[0] <= net_1913;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[1] <= 1'b0;
    else register_12[1] <= net_1927;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[2] <= 1'b0;
    else register_12[2] <= net_1713;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[3] <= 1'b0;
    else register_12[3] <= net_1767;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[4] <= 1'b1;
    else register_12[4] <= net_1850;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[5] <= 1'b1;
    else register_12[5] <= net_1851;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[6] <= 1'b1;
    else register_12[6] <= net_1844;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_12[7] <= 1'b1;
    else register_12[7] <= net_1730;
  end
endmodule
