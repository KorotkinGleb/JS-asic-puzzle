// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_15: state/counter register candidate; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_15_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // RESET_B / net_322
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred register vector
    output reg [7:0] register_group_15_q,  // current register state
    output wire [7:0] register_group_15_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_15_q[0] = u_1229.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_15_q[1] = u_1249.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_15_q[2] = u_1250.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_15_q[3] = u_1264.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_15_q[4] = u_1809.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_15_q[5] = u_2036.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_15_q[6] = u_2037.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_15_q[7] = u_2039.Q (sky130_fd_sc_hd__dfrtp_2)

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

  // Inlined Boolean functions of the recovered standard cells.
  // u_144: sky130_fd_sc_hd__or4_2
  assign net_2010 = (register_group_15_q[7]) | (net_2008) | (net_1972) | (net_1971);
  // u_145: sky130_fd_sc_hd__a21o_2
  assign net_2011 = (register_group_15_q[2]&net_1970) | (register_group_15_q[7]);
  // u_147: sky130_fd_sc_hd__o21a_2
  assign net_1997 = (register_group_15_q[2]&net_2010) | (net_1970&net_2010);
  // u_1231: sky130_fd_sc_hd__nand2_2
  assign net_2280 = (!I) | (!net_604);
  // u_1244: sky130_fd_sc_hd__or4_2
  assign net_2245 = (register_group_15_q[0]) | (net_2261) | (net_2229) | (net_2280);
  // u_1252: sky130_fd_sc_hd__or4_2
  assign net_2072 = (register_group_15_q[1]) | (net_2129) | (net_2074) | (net_2073);
  // u_1255: sky130_fd_sc_hd__nand2_2
  assign net_2073 = (!I) | (!net_604);
  // u_1770: sky130_fd_sc_hd__or4b_2
  assign net_2074 = (register_group_03_q[2]) | (register_group_03_q[1]) | (register_group_03_q[0]) | (!register_group_03_q[3]);
  // u_1777: sky130_fd_sc_hd__a21o_2
  assign net_2240 = (register_group_15_q[4]&net_2242) | (register_group_15_q[0]);
  // u_1780: sky130_fd_sc_hd__o21a_2
  assign net_2160 = (register_group_15_q[5]&net_2184) | (net_2154&net_2184);
  // u_1781: sky130_fd_sc_hd__o21a_2
  assign net_2243 = (register_group_15_q[4]&net_2245) | (net_2242&net_2245);
  // u_1788: sky130_fd_sc_hd__and4bb_2
  assign net_2185 = (!register_group_03_q[1]&!register_group_03_q[0]&register_group_03_q[2]&register_group_03_q[3]);
  // u_1792: sky130_fd_sc_hd__nand2b_2
  assign net_2132 = (register_group_15_q[5]) | (!net_2154);
  // u_1795: sky130_fd_sc_hd__o21a_2
  assign net_2097 = (register_group_15_q[6]&net_2072) | (net_2070&net_2072);
  // u_1796: sky130_fd_sc_hd__a21o_2
  assign net_2075 = (register_group_15_q[6]&net_2070) | (register_group_15_q[1]);
  // u_1798: sky130_fd_sc_hd__nor2_2
  assign net_2242 = (!net_2229&!net_2280);
  // u_1803: sky130_fd_sc_hd__or4b_2
  assign net_2229 = (register_group_03_q[3]) | (register_group_03_q[2]) | (register_group_03_q[1]) | (!register_group_03_q[0]);
  // u_1968: sky130_fd_sc_hd__inv_2
  assign net_2261 = (!register_group_15_q[4]);
  // u_2012: sky130_fd_sc_hd__inv_2
  assign net_2129 = (!register_group_15_q[6]);
  // u_2013: sky130_fd_sc_hd__inv_2
  assign net_2008 = (!register_group_15_q[2]);
  // u_2034: sky130_fd_sc_hd__nand4_2
  assign net_2154 = (!I) | (!net_604) | (!register_group_15_q[3]) | (!net_2185);
  // u_2049: sky130_fd_sc_hd__a31o_2
  assign net_2184 = (I&net_604&net_2185) | (register_group_15_q[3]);
  // u_2143: sky130_fd_sc_hd__nor2_2
  assign net_2070 = (!net_2074&!net_2073);
  // u_2359: sky130_fd_sc_hd__nor2_2
  assign net_1970 = (!net_1972&!net_1971);
  // u_2370: sky130_fd_sc_hd__nand2_2
  assign net_1971 = (!I) | (!net_604);
  // u_2396: sky130_fd_sc_hd__or4b_2
  assign net_1972 = (register_group_03_q[3]) | (register_group_03_q[1]) | (register_group_03_q[0]) | (!register_group_03_q[2]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!ff_4182_q&enable);

  // Destination D-pin vector.
  assign register_group_15_d[0] = net_2240;  // u_1229.D / net_2240
  assign register_group_15_d[1] = net_2075;  // u_1249.D / net_2075
  assign register_group_15_d[2] = net_1997;  // u_1250.D / net_1997
  assign register_group_15_d[3] = net_2160;  // u_1264.D / net_2160
  assign register_group_15_d[4] = net_2243;  // u_1809.D / net_2243
  assign register_group_15_d[5] = net_2132;  // u_2036.D / net_2132
  assign register_group_15_d[6] = net_2097;  // u_2037.D / net_2097
  assign register_group_15_d[7] = net_2011;  // u_2039.D / net_2011

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_15_q[0] <= 1'b0;
    else register_group_15_q[0] <= register_group_15_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_15_q[1] <= 1'b0;
    else register_group_15_q[1] <= register_group_15_d[1];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_15_q[2] <= 1'b0;
    else register_group_15_q[2] <= register_group_15_d[2];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_15_q[3] <= 1'b0;
    else register_group_15_q[3] <= register_group_15_d[3];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_15_q[4] <= 1'b0;
    else register_group_15_q[4] <= register_group_15_d[4];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_15_q[5] <= 1'b0;
    else register_group_15_q[5] <= register_group_15_d[5];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_15_q[6] <= 1'b0;
    else register_group_15_q[6] <= register_group_15_d[6];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_15_q[7] <= 1'b0;
    else register_group_15_q[7] <= register_group_15_d[7];
  end
endmodule
