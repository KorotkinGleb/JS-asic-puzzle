// Stateful RTL recovered by merging every FF.D backward cone.
// register_05: 2 bit(s), state/counter register candidate.
module recovered_register_05 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output reg [1:0] register_05  // recovered current state
);

  // Physical-bit mapping.
  // register_05[0] = u_2293.Q / net_1805; D=net_1800
  // register_05[1] = u_2372.Q / net_1797; D=net_1752

  // Extracted combinational nets.
  wire net_604;
  wire net_1752;
  wire net_1796;
  wire net_1800;
  wire net_1842;
  wire net_1876;

  // Liberty Boolean functions recovered from standard cells.
  // u_2365: sky130_fd_sc_hd__nor4_2
  assign net_1876 = (!register_03[3]&!register_03[2]&!register_03[1]&!register_03[0]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_2361: sky130_fd_sc_hd__a31o_2
  assign net_1842 = (I&net_604&net_1876) | (register_05[0]);
  // u_2369: sky130_fd_sc_hd__nand4_2
  assign net_1796 = (!I) | (!net_604) | (!register_05[0]) | (!net_1876);
  // u_2363: sky130_fd_sc_hd__o21a_2
  assign net_1800 = (register_05[1]&net_1842) | (net_1796&net_1842);
  // u_2437: sky130_fd_sc_hd__nand2b_2
  assign net_1752 = (register_05[1]) | (!net_1796);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_05: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_05[0] <= 1'b0;
    else register_05[0] <= net_1800;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_05[1] <= 1'b0;
    else register_05[1] <= net_1752;
  end

endmodule
