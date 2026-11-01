// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_05: state/counter register candidate; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_05_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // RESET_B / net_322
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire [3:0] register_group_03_q,  // inferred register vector
    output reg [1:0] register_group_05_q,  // current register state
    output wire [1:0] register_group_05_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_05_q[0] = u_2293.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_05_q[1] = u_2372.Q (sky130_fd_sc_hd__dfrtp_2)

  // Recovered combinational nets.
  wire net_604;
  wire net_1752;
  wire net_1796;
  wire net_1800;
  wire net_1842;
  wire net_1876;

  // Inlined Boolean functions of the recovered standard cells.
  // u_2361: sky130_fd_sc_hd__a31o_2
  assign net_1842 = (I&net_604&net_1876) | (register_group_05_q[0]);
  // u_2363: sky130_fd_sc_hd__o21a_2
  assign net_1800 = (register_group_05_q[1]&net_1842) | (net_1796&net_1842);
  // u_2365: sky130_fd_sc_hd__nor4_2
  assign net_1876 = (!register_group_03_q[3]&!register_group_03_q[2]&!register_group_03_q[1]&!register_group_03_q[0]);
  // u_2369: sky130_fd_sc_hd__nand4_2
  assign net_1796 = (!I) | (!net_604) | (!register_group_05_q[0]) | (!net_1876);
  // u_2437: sky130_fd_sc_hd__nand2b_2
  assign net_1752 = (register_group_05_q[1]) | (!net_1796);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!ff_4182_q&enable);

  // Destination D-pin vector.
  assign register_group_05_d[0] = net_1800;  // u_2293.D / net_1800
  assign register_group_05_d[1] = net_1752;  // u_2372.D / net_1752

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_05_q[0] <= 1'b0;
    else register_group_05_q[0] <= register_group_05_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_05_q[1] <= 1'b0;
    else register_group_05_q[1] <= register_group_05_d[1];
  end
endmodule
