// Stateful RTL recovered by merging every FF.D backward cone.
// register_04: 4 bit(s), state/counter register candidate.
module recovered_register_04 (
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output reg [3:0] register_04  // recovered current state
);

  // Physical-bit mapping.
  // register_04[0] = u_6435.Q / net_206; D=net_921
  // register_04[1] = u_6436.Q / net_173; D=net_1059
  // register_04[2] = u_6442.Q / net_171; D=net_827
  // register_04[3] = u_6451.Q / net_205; D=net_972

  // Extracted combinational nets.
  wire net_604;
  wire net_820;
  wire net_827;
  wire net_873;
  wire net_874;
  wire net_876;
  wire net_878;
  wire net_879;
  wire net_918;
  wire net_921;
  wire net_968;
  wire net_970;
  wire net_972;
  wire net_1059;

  // Liberty Boolean functions recovered from standard cells.
  // u_4705: sky130_fd_sc_hd__and4bb_2
  assign net_873 = (!register_03[2]&!register_03[0]&register_03[1]&register_03[3]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_6472: sky130_fd_sc_hd__nand3b_2
  assign net_820 = (register_04[1]) | (!register_04[0]) | (!register_04[3]);
  // u_6403: sky130_fd_sc_hd__a31o_2
  assign net_918 = (net_873&net_604&register_04[2]) | (register_04[3]);
  // u_6404: sky130_fd_sc_hd__and4_2
  assign net_968 = (net_873&net_604&register_04[3]&register_04[2]);
  // u_6445: sky130_fd_sc_hd__nand2_2
  assign net_879 = (!net_873) | (!net_604);
  // u_6441: sky130_fd_sc_hd__and3_2
  assign net_876 = (net_873&net_604&net_820);
  // u_6473: sky130_fd_sc_hd__nand3_2
  assign net_878 = (!register_04[1]) | (!register_04[0]) | (!net_968);
  // u_6474: sky130_fd_sc_hd__a21o_2
  assign net_874 = (register_04[1]&net_968) | (register_04[0]);
  // u_6478: sky130_fd_sc_hd__inv_2
  assign net_970 = (!net_968);
  // u_6481: sky130_fd_sc_hd__xor2_2
  assign net_1059 = (register_04[1]&!net_968) | (!register_04[1]&net_968);
  // u_6444: sky130_fd_sc_hd__mux2_1
  assign net_827 = (net_876&!register_04[2]) | (net_879&register_04[2]);
  // u_6437: sky130_fd_sc_hd__o311a_2
  assign net_921 = (register_04[2]&net_878&net_874) | (net_820&net_878&net_874) | (net_879&net_878&net_874);
  // u_6446: sky130_fd_sc_hd__o211a_2
  assign net_972 = (net_820&net_918&net_970) | (net_879&net_918&net_970);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_04: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_04[0] <= 1'b0;
    else register_04[0] <= net_921;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_04[1] <= 1'b0;
    else register_04[1] <= net_1059;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_04[2] <= 1'b0;
    else register_04[2] <= net_827;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_04[3] <= 1'b0;
    else register_04[3] <= net_972;
  end

endmodule
