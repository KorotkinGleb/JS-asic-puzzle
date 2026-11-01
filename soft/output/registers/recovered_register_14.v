// Stateful RTL recovered by merging every FF.D backward cone.
// register_14: 6 bit(s), state/counter register candidate.
module recovered_register_14 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output reg [5:0] register_14  // recovered current state
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

  // Liberty Boolean functions recovered from standard cells.
  // u_1246: sky130_fd_sc_hd__and4bb_2
  assign net_2419 = (!register_03[2]&!register_03[1]&register_03[0]&register_03[3]);
  // u_1248: sky130_fd_sc_hd__and4b_2
  assign net_2418 = (!register_03[1]&register_03[0]&register_03[2]&register_03[3]);
  // u_1807: sky130_fd_sc_hd__and4bb_2
  assign net_2277 = (!register_03[3]&!register_03[1]&register_03[0]&register_03[2]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_1232: sky130_fd_sc_hd__a31o_2
  assign net_2301 = (I&net_604&net_2277) | (register_14[0]);
  // u_1234: sky130_fd_sc_hd__a31o_2
  assign net_2377 = (I&net_604&net_2419) | (register_14[1]);
  // u_1381: sky130_fd_sc_hd__nand4_2
  assign net_2441 = (!I) | (!net_604) | (!register_14[2]) | (!net_2418);
  // u_1635: sky130_fd_sc_hd__a31o_2
  assign net_2440 = (I&net_604&net_2418) | (register_14[2]);
  // u_1641: sky130_fd_sc_hd__nand4_2
  assign net_2344 = (!I) | (!net_604) | (!register_14[1]) | (!net_2419);
  // u_1772: sky130_fd_sc_hd__nand4_2
  assign net_2275 = (!I) | (!net_604) | (!register_14[0]) | (!net_2277);
  // u_1675: sky130_fd_sc_hd__nand2b_2
  assign net_2464 = (register_14[3]) | (!net_2441);
  // u_1611: sky130_fd_sc_hd__o21a_2
  assign net_2438 = (register_14[3]&net_2440) | (net_2441&net_2440);
  // u_1235: sky130_fd_sc_hd__o21a_2
  assign net_2354 = (register_14[5]&net_2377) | (net_2344&net_2377);
  // u_1240: sky130_fd_sc_hd__nand2b_2
  assign net_2345 = (register_14[5]) | (!net_2344);
  // u_1790: sky130_fd_sc_hd__o21a_2
  assign net_2307 = (register_14[4]&net_2301) | (net_2275&net_2301);
  // u_1959: sky130_fd_sc_hd__nand2b_2
  assign net_2274 = (register_14[4]) | (!net_2275);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_14: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[0] <= 1'b0;
    else register_14[0] <= net_2307;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[1] <= 1'b0;
    else register_14[1] <= net_2354;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[2] <= 1'b0;
    else register_14[2] <= net_2438;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[3] <= 1'b0;
    else register_14[3] <= net_2464;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[4] <= 1'b0;
    else register_14[4] <= net_2274;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_14[5] <= 1'b0;
    else register_14[5] <= net_2345;
  end

endmodule
