// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_06: state/counter register candidate; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_06_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // RESET_B / net_322
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred register vector
    output reg [2:0] register_group_06_q,  // current register state
    output wire [2:0] register_group_06_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_06_q[0] = u_5634.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_06_q[1] = u_5638.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_06_q[2] = u_5639.Q (sky130_fd_sc_hd__dfrtp_2)

  // Recovered combinational nets.
  wire net_604;
  wire net_831;
  wire net_873;
  wire net_882;
  wire net_907;
  wire net_927;
  wire net_928;
  wire net_929;
  wire net_930;
  wire net_976;
  wire net_1004;
  wire net_1005;
  wire net_1007;

  // Inlined Boolean functions of the recovered standard cells.
  // u_4705: sky130_fd_sc_hd__and4bb_2
  assign net_873 = (!register_group_03_q[2]&!register_group_03_q[0]&register_group_03_q[1]&register_group_03_q[3]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!ff_4182_q&enable);
  // u_5630: sky130_fd_sc_hd__inv_2
  assign net_907 = (!net_873);
  // u_5636: sky130_fd_sc_hd__inv_2
  assign net_929 = (!register_group_06_q[0]);
  // u_5640: sky130_fd_sc_hd__a31o_2
  assign net_831 = (net_873&net_604&net_882) | (register_group_06_q[1]);
  // u_5677: sky130_fd_sc_hd__o211a_2
  assign net_1004 = (register_group_06_q[0]&net_976&net_604) | (net_930&net_976&net_604);
  // u_5682: sky130_fd_sc_hd__a21oi_2
  assign net_928 = (!net_929&!net_927) | (!net_930&!net_927);
  // u_5683: sky130_fd_sc_hd__mux2_1
  assign net_882 = (net_930&!register_group_06_q[0]) | (net_976&register_group_06_q[0]);
  // u_5684: sky130_fd_sc_hd__or2_2
  assign net_976 = (register_group_06_q[2]) | (I);
  // u_5711: sky130_fd_sc_hd__nand2_2
  assign net_930 = (!register_group_06_q[2]) | (!I);
  // u_5775: sky130_fd_sc_hd__inv_2
  assign net_1005 = (!net_604);
  // u_5778: sky130_fd_sc_hd__mux2_1
  assign net_927 = (net_873&!net_1005) | (net_929&net_1005);
  // u_5781: sky130_fd_sc_hd__a22o_2
  assign net_1007 = (net_1004&net_907) | (net_1005&register_group_06_q[2]);

  // Destination D-pin vector.
  assign register_group_06_d[0] = net_928;  // u_5634.D / net_928
  assign register_group_06_d[1] = net_831;  // u_5638.D / net_831
  assign register_group_06_d[2] = net_1007;  // u_5639.D / net_1007

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_06_q[0] <= 1'b0;
    else register_group_06_q[0] <= register_group_06_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_06_q[1] <= 1'b0;
    else register_group_06_q[1] <= register_group_06_d[1];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_06_q[2] <= 1'b0;
    else register_group_06_q[2] <= register_group_06_d[2];
  end
endmodule
