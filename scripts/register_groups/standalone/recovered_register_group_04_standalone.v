// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_04: state/counter register candidate; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_04_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // RESET_B / net_322
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred register vector
    output reg [3:0] register_group_04_q,  // current register state
    output wire [3:0] register_group_04_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_04_q[0] = u_6435.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_04_q[1] = u_6436.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_04_q[2] = u_6442.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_04_q[3] = u_6451.Q (sky130_fd_sc_hd__dfrtp_2)

  // Recovered combinational nets.
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

  // Inlined Boolean functions of the recovered standard cells.
  // u_4705: sky130_fd_sc_hd__and4bb_2
  assign net_873 = (!register_group_03_q[2]&!register_group_03_q[0]&register_group_03_q[1]&register_group_03_q[3]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!ff_4182_q&enable);
  // u_6403: sky130_fd_sc_hd__a31o_2
  assign net_918 = (net_873&net_604&register_group_04_q[2]) | (register_group_04_q[3]);
  // u_6404: sky130_fd_sc_hd__and4_2
  assign net_968 = (net_873&net_604&register_group_04_q[3]&register_group_04_q[2]);
  // u_6437: sky130_fd_sc_hd__o311a_2
  assign net_921 = (register_group_04_q[2]&net_878&net_874) | (net_820&net_878&net_874) | (net_879&net_878&net_874);
  // u_6441: sky130_fd_sc_hd__and3_2
  assign net_876 = (net_873&net_604&net_820);
  // u_6444: sky130_fd_sc_hd__mux2_1
  assign net_827 = (net_876&!register_group_04_q[2]) | (net_879&register_group_04_q[2]);
  // u_6445: sky130_fd_sc_hd__nand2_2
  assign net_879 = (!net_873) | (!net_604);
  // u_6446: sky130_fd_sc_hd__o211a_2
  assign net_972 = (net_820&net_918&net_970) | (net_879&net_918&net_970);
  // u_6472: sky130_fd_sc_hd__nand3b_2
  assign net_820 = (register_group_04_q[1]) | (!register_group_04_q[0]) | (!register_group_04_q[3]);
  // u_6473: sky130_fd_sc_hd__nand3_2
  assign net_878 = (!register_group_04_q[1]) | (!register_group_04_q[0]) | (!net_968);
  // u_6474: sky130_fd_sc_hd__a21o_2
  assign net_874 = (register_group_04_q[1]&net_968) | (register_group_04_q[0]);
  // u_6478: sky130_fd_sc_hd__inv_2
  assign net_970 = (!net_968);
  // u_6481: sky130_fd_sc_hd__xor2_2
  assign net_1059 = (register_group_04_q[1]&!net_968) | (!register_group_04_q[1]&net_968);

  // Destination D-pin vector.
  assign register_group_04_d[0] = net_921;  // u_6435.D / net_921
  assign register_group_04_d[1] = net_1059;  // u_6436.D / net_1059
  assign register_group_04_d[2] = net_827;  // u_6442.D / net_827
  assign register_group_04_d[3] = net_972;  // u_6451.D / net_972

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_04_q[0] <= 1'b0;
    else register_group_04_q[0] <= register_group_04_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_04_q[1] <= 1'b0;
    else register_group_04_q[1] <= register_group_04_d[1];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_04_q[2] <= 1'b0;
    else register_group_04_q[2] <= register_group_04_d[2];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_04_q[3] <= 1'b0;
    else register_group_04_q[3] <= register_group_04_d[3];
  end
endmodule
