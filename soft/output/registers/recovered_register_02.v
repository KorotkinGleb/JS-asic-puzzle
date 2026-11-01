// Stateful RTL recovered by merging every FF.D backward cone.
// register_02: 4 bit(s), state/counter register candidate.
module recovered_register_02 (
    input wire clk,
    input wire [2:0] register_09,  // recovered register boundary
    output reg [3:0] register_02  // recovered current state
);

  // Physical-bit mapping.
  // register_02[0] = u_234.Q / net_751; D=net_2332
  // register_02[1] = u_235.Q / net_762; D=net_2388
  // register_02[2] = u_236.Q / net_749; D=net_2411
  // register_02[3] = u_237.Q / net_848; D=net_2317

  // Extracted combinational nets.
  wire net_2302;
  wire net_2311;
  wire net_2316;
  wire net_2317;
  wire net_2330;
  wire net_2332;
  wire net_2359;
  wire net_2388;
  wire net_2411;

  // Liberty Boolean functions recovered from standard cells.
  // u_202: sky130_fd_sc_hd__xnor2_2
  assign net_2359 = (!register_02[2]&!register_02[1]) | (register_02[2]&register_02[1]);
  // u_353: sky130_fd_sc_hd__nand4_2
  assign net_2302 = (!register_02[3]) | (!register_02[0]) | (!register_02[2]) | (!register_02[1]);
  // u_494: sky130_fd_sc_hd__nand3_2
  assign net_2316 = (!register_02[0]) | (!register_02[2]) | (!register_02[1]);
  // u_500: sky130_fd_sc_hd__a21o_2
  assign net_2330 = (register_02[2]&register_02[1]) | (register_02[0]);
  // u_624: sky130_fd_sc_hd__inv_2
  assign net_2311 = (!register_02[3]);
  // u_199: sky130_fd_sc_hd__a21boi_2
  assign net_2388 = (!register_02[1]&register_09[0]) | (!net_2302&register_09[0]);
  // u_341: sky130_fd_sc_hd__a21boi_2
  assign net_2411 = (!net_2302&register_09[0]) | (!net_2359&register_09[0]);
  // u_608: sky130_fd_sc_hd__o211a_2
  assign net_2332 = (register_02[3]&net_2330&register_09[0]) | (net_2316&net_2330&register_09[0]);
  // u_215: sky130_fd_sc_hd__a21boi_2
  assign net_2317 = (!net_2311&register_09[0]) | (!net_2316&register_09[0]);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_02: state/counter register candidate
  always @(posedge clk) begin
    register_02[0] <= net_2332;
  end
  always @(posedge clk) begin
    register_02[1] <= net_2388;
  end
  always @(posedge clk) begin
    register_02[2] <= net_2411;
  end
  always @(posedge clk) begin
    register_02[3] <= net_2317;
  end

endmodule
