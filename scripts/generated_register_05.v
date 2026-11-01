// Stateful RTL recovered from puzzle.gds.
// The first source-register layer is the module boundary.
module recovered_register_05 (
    input wire clk,
    input wire rst_n,
    input wire enable,
    input wire [3:0] register_03,  // source register at backtrace boundary
    input wire register_16,  // u_4182.Q at backtrace boundary
    input wire serial_in,
    output reg [1:0] register_05  // recovered register state
);

  // Physical flip-flop to RTL-bit mapping.
  // register_05[0] = u_2293.Q
  // register_05[1] = u_2372.Q

  // Recovered combinational nets.
  wire net_604;
  wire net_1752;
  wire net_1796;
  wire net_1800;
  wire net_1842;
  wire net_1876;

  // Recovered combinational next-state logic.
  // u_2361: sky130_fd_sc_hd__a31o_2
  assign net_1842 = (serial_in&net_604&net_1876) | (register_05[0]);
  // u_2363: sky130_fd_sc_hd__o21a_2
  assign net_1800 = (register_05[1]&net_1842) | (net_1796&net_1842);
  // u_2365: sky130_fd_sc_hd__nor4_2
  assign net_1876 = (!register_03[3]&!register_03[2]&!register_03[1]&!register_03[0]);
  // u_2369: sky130_fd_sc_hd__nand4_2
  assign net_1796 = (!serial_in) | (!net_604) | (!register_05[0]) | (!net_1876);
  // u_2437: sky130_fd_sc_hd__nand2b_2
  assign net_1752 = (register_05[1]) | (!net_1796);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);

  // Recovered registers; D logic is used directly.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_05 <= 2'b00;
    else begin
      register_05[0] <= net_1800;
      register_05[1] <= net_1752;
    end
  end
endmodule
