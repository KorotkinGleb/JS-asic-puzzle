// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_03: state/counter register candidate; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_03_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // RESET_B / net_322
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    output reg [3:0] register_group_03_q,  // current register state
    output wire [3:0] register_group_03_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_03_q[0] = u_4659.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_03_q[1] = u_4661.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_03_q[2] = u_4662.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_03_q[3] = u_4838.Q (sky130_fd_sc_hd__dfrtp_2)

  // Recovered combinational nets.
  wire net_604;
  wire net_873;
  wire net_1303;
  wire net_1307;
  wire net_1391;
  wire net_1394;
  wire net_1448;
  wire net_1453;
  wire net_1497;
  wire net_1535;
  wire net_1568;

  // Inlined Boolean functions of the recovered standard cells.
  // u_4660: sky130_fd_sc_hd__and3_2
  assign net_1303 = (register_group_03_q[3]&register_group_03_q[2]&net_604);
  // u_4663: sky130_fd_sc_hd__a221oi_2
  assign net_1568 = (!net_604&!net_1391&!net_1535) | (!net_604&!register_group_03_q[1]&!net_1535) | (!net_873&!net_1391&!net_1535) | (!net_873&!register_group_03_q[1]&!net_1535);
  // u_4705: sky130_fd_sc_hd__and4bb_2
  assign net_873 = (!register_group_03_q[2]&!register_group_03_q[0]&register_group_03_q[1]&register_group_03_q[3]);
  // u_4710: sky130_fd_sc_hd__nor2_2
  assign net_1448 = (!net_873&!net_1497);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!ff_4182_q&enable);
  // u_4835: sky130_fd_sc_hd__a211oi_2
  assign net_1394 = (!net_604&!net_1453&!net_1303) | (!net_873&!net_1453&!net_1303);
  // u_4837: sky130_fd_sc_hd__a21oi_2
  assign net_1453 = (!register_group_03_q[2]&!register_group_03_q[3]) | (!net_604&!register_group_03_q[3]);
  // u_4859: sky130_fd_sc_hd__xnor2_2
  assign net_1497 = (!register_group_03_q[2]&!net_604) | (register_group_03_q[2]&net_604);
  // u_4862: sky130_fd_sc_hd__xor2_2
  assign net_1307 = (register_group_03_q[0]&!net_1303) | (!register_group_03_q[0]&net_1303);
  // u_4863: sky130_fd_sc_hd__a41oi_2
  assign net_1535 = (!register_group_03_q[3]&!register_group_03_q[1]) | (!register_group_03_q[2]&!register_group_03_q[1]) | (!register_group_03_q[0]&!register_group_03_q[1]) | (!net_604&!register_group_03_q[1]);
  // u_4949: sky130_fd_sc_hd__and4_2
  assign net_1391 = (register_group_03_q[3]&register_group_03_q[2]&register_group_03_q[0]&net_604);

  // Destination D-pin vector.
  assign register_group_03_d[0] = net_1307;  // u_4659.D / net_1307
  assign register_group_03_d[1] = net_1568;  // u_4661.D / net_1568
  assign register_group_03_d[2] = net_1448;  // u_4662.D / net_1448
  assign register_group_03_d[3] = net_1394;  // u_4838.D / net_1394

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_03_q[0] <= 1'b0;
    else register_group_03_q[0] <= register_group_03_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_03_q[1] <= 1'b0;
    else register_group_03_q[1] <= register_group_03_d[1];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_03_q[2] <= 1'b0;
    else register_group_03_q[2] <= register_group_03_d[2];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_03_q[3] <= 1'b0;
    else register_group_03_q[3] <= register_group_03_d[3];
  end
endmodule
