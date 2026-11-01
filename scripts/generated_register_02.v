// Stateful RTL recovered from puzzle.gds.
// The first source-register layer is the module boundary.
module recovered_register_02 (
    input wire clk,
    input wire [2:0] register_09,  // source register at backtrace boundary
    output reg [3:0] register_02  // recovered register state
);

  // Physical flip-flop to RTL-bit mapping.
  // register_02[0] = u_234.Q
  // register_02[1] = u_235.Q
  // register_02[2] = u_236.Q
  // register_02[3] = u_237.Q

  // Recovered combinational nets.
  wire net_2302;
  wire net_2311;
  wire net_2316;
  wire net_2317;
  wire net_2330;
  wire net_2332;
  wire net_2359;
  wire net_2388;
  wire net_2411;

  // Recovered combinational next-state logic.
  // u_199: sky130_fd_sc_hd__a21boi_2
  assign net_2388 = (!register_02[1]&register_09[0]) | (!net_2302&register_09[0]);
  // u_202: sky130_fd_sc_hd__xnor2_2
  assign net_2359 = (!register_02[2]&!register_02[1]) | (register_02[2]&register_02[1]);
  // u_215: sky130_fd_sc_hd__a21boi_2
  assign net_2317 = (!net_2311&register_09[0]) | (!net_2316&register_09[0]);
  // u_341: sky130_fd_sc_hd__a21boi_2
  assign net_2411 = (!net_2302&register_09[0]) | (!net_2359&register_09[0]);
  // u_353: sky130_fd_sc_hd__nand4_2
  assign net_2302 = (!register_02[3]) | (!register_02[0]) | (!register_02[2]) | (!register_02[1]);
  // u_494: sky130_fd_sc_hd__nand3_2
  assign net_2316 = (!register_02[0]) | (!register_02[2]) | (!register_02[1]);
  // u_500: sky130_fd_sc_hd__a21o_2
  assign net_2330 = (register_02[2]&register_02[1]) | (register_02[0]);
  // u_608: sky130_fd_sc_hd__o211a_2
  assign net_2332 = (register_02[3]&net_2330&register_09[0]) | (net_2316&net_2330&register_09[0]);
  // u_624: sky130_fd_sc_hd__inv_2
  assign net_2311 = (!register_02[3]);

  // Recovered registers; D logic is used directly.
  always @(posedge clk) begin
    register_02[0] <= net_2332;
    register_02[1] <= net_2388;
    register_02[2] <= net_2411;
    register_02[3] <= net_2317;
  end
endmodule
