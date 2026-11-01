// Stateful RTL recovered by merging every FF.D backward cone.
// register_16: 1 bit(s), ungrouped one-bit register.
module recovered_register_16 (
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire [3:0] register_04,  // recovered register boundary
    output reg register_16  // recovered current state
);

  // Physical-bit mapping.
  // register_16[0] = u_4182.Q / net_1968; D=net_2007

  // Extracted combinational nets.
  wire net_604;
  wire net_820;
  wire net_821;
  wire net_873;
  wire net_2007;

  // Liberty Boolean functions recovered from standard cells.
  // u_4705: sky130_fd_sc_hd__and4bb_2
  assign net_873 = (!register_03[2]&!register_03[0]&register_03[1]&register_03[3]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_6472: sky130_fd_sc_hd__nand3b_2
  assign net_820 = (register_04[1]) | (!register_04[0]) | (!register_04[3]);
  // u_6609: sky130_fd_sc_hd__nor2_2
  assign net_821 = (!register_04[2]&!net_820);
  // u_4602: sky130_fd_sc_hd__a31o_2
  assign net_2007 = (net_873&net_821&net_604) | (register_16);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_16: ungrouped one-bit register
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_16 <= 1'b0;
    else register_16 <= net_2007;
  end

endmodule
