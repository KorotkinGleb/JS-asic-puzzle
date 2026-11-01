// Stateful RTL recovered from puzzle.gds.
// The first source-register layer is the module boundary.
module recovered_register_15 (
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire [3:0] register_03,  // source register at backtrace boundary
    input wire register_16,  // u_4182.Q at backtrace boundary
    input wire serial_in,
    output reg [7:0] register_15  // recovered register state
);

  // Physical flip-flop to RTL-bit mapping.
  // register_15[0] = u_1229.Q
  // register_15[1] = u_1249.Q
  // register_15[2] = u_1250.Q
  // register_15[3] = u_1264.Q
  // register_15[4] = u_1809.Q
  // register_15[5] = u_2036.Q
  // register_15[6] = u_2037.Q
  // register_15[7] = u_2039.Q

  // Recovered combinational nets.
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

  // Recovered combinational next-state logic.
  // u_144: sky130_fd_sc_hd__or4_2
  assign net_2010 = (register_15[7]) | (net_2008) | (net_1972) | (net_1971);
  // u_145: sky130_fd_sc_hd__a21o_2
  assign net_2011 = (register_15[2]&net_1970) | (register_15[7]);
  // u_147: sky130_fd_sc_hd__o21a_2
  assign net_1997 = (register_15[2]&net_2010) | (net_1970&net_2010);
  // u_1231: sky130_fd_sc_hd__nand2_2
  assign net_2280 = (!serial_in) | (!net_604);
  // u_1244: sky130_fd_sc_hd__or4_2
  assign net_2245 = (register_15[0]) | (net_2261) | (net_2229) | (net_2280);
  // u_1252: sky130_fd_sc_hd__or4_2
  assign net_2072 = (register_15[1]) | (net_2129) | (net_2074) | (net_2073);
  // u_1255: sky130_fd_sc_hd__nand2_2
  assign net_2073 = (!serial_in) | (!net_604);
  // u_1770: sky130_fd_sc_hd__or4b_2
  assign net_2074 = (register_03[2]) | (register_03[1]) | (register_03[0]) | (!register_03[3]);
  // u_1777: sky130_fd_sc_hd__a21o_2
  assign net_2240 = (register_15[4]&net_2242) | (register_15[0]);
  // u_1780: sky130_fd_sc_hd__o21a_2
  assign net_2160 = (register_15[5]&net_2184) | (net_2154&net_2184);
  // u_1781: sky130_fd_sc_hd__o21a_2
  assign net_2243 = (register_15[4]&net_2245) | (net_2242&net_2245);
  // u_1788: sky130_fd_sc_hd__and4bb_2
  assign net_2185 = (!register_03[1]&!register_03[0]&register_03[2]&register_03[3]);
  // u_1792: sky130_fd_sc_hd__nand2b_2
  assign net_2132 = (register_15[5]) | (!net_2154);
  // u_1795: sky130_fd_sc_hd__o21a_2
  assign net_2097 = (register_15[6]&net_2072) | (net_2070&net_2072);
  // u_1796: sky130_fd_sc_hd__a21o_2
  assign net_2075 = (register_15[6]&net_2070) | (register_15[1]);
  // u_1798: sky130_fd_sc_hd__nor2_2
  assign net_2242 = (!net_2229&!net_2280);
  // u_1803: sky130_fd_sc_hd__or4b_2
  assign net_2229 = (register_03[3]) | (register_03[2]) | (register_03[1]) | (!register_03[0]);
  // u_1968: sky130_fd_sc_hd__inv_2
  assign net_2261 = (!register_15[4]);
  // u_2012: sky130_fd_sc_hd__inv_2
  assign net_2129 = (!register_15[6]);
  // u_2013: sky130_fd_sc_hd__inv_2
  assign net_2008 = (!register_15[2]);
  // u_2034: sky130_fd_sc_hd__nand4_2
  assign net_2154 = (!serial_in) | (!net_604) | (!register_15[3]) | (!net_2185);
  // u_2049: sky130_fd_sc_hd__a31o_2
  assign net_2184 = (serial_in&net_604&net_2185) | (register_15[3]);
  // u_2143: sky130_fd_sc_hd__nor2_2
  assign net_2070 = (!net_2074&!net_2073);
  // u_2359: sky130_fd_sc_hd__nor2_2
  assign net_1970 = (!net_1972&!net_1971);
  // u_2370: sky130_fd_sc_hd__nand2_2
  assign net_1971 = (!serial_in) | (!net_604);
  // u_2396: sky130_fd_sc_hd__or4b_2
  assign net_1972 = (register_03[3]) | (register_03[1]) | (register_03[0]) | (!register_03[2]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);

  // Recovered registers; D logic is used directly.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_15 <= 8'b00000000;
    else begin
      register_15[0] <= net_2240;
      register_15[1] <= net_2075;
      register_15[2] <= net_1997;
      register_15[3] <= net_2160;
      register_15[4] <= net_2243;
      register_15[5] <= net_2132;
      register_15[6] <= net_2097;
      register_15[7] <= net_2011;
    end
  end
endmodule
