// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_07: state/counter register candidate; heuristic bit order: sorted physical instance IDs.
module recovered_register_group_07_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // RESET_B / net_322
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    output reg [7:0] register_group_07_q,  // current register state
    output wire [7:0] register_group_07_d  // recovered next state
);

  // Recovered register-bit mapping.
  // register_group_07_q[0] = u_6095.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_07_q[1] = u_6106.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_07_q[2] = u_6109.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_07_q[3] = u_6111.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_07_q[4] = u_6159.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_07_q[5] = u_6197.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_07_q[6] = u_6198.Q (sky130_fd_sc_hd__dfrtp_2)
  // register_group_07_q[7] = u_6199.Q (sky130_fd_sc_hd__dfrtp_2)

  // Recovered combinational nets.
  wire net_263;
  wire net_272;
  wire net_274;
  wire net_297;
  wire net_341;
  wire net_347;
  wire net_384;
  wire net_386;
  wire net_430;
  wire net_457;
  wire net_458;
  wire net_459;
  wire net_477;
  wire net_478;
  wire net_488;
  wire net_519;
  wire net_533;
  wire net_555;
  wire net_571;
  wire net_573;
  wire net_578;
  wire net_604;

  // Inlined Boolean functions of the recovered standard cells.
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!ff_4182_q&enable);
  // u_5603: sky130_fd_sc_hd__and2b_2
  assign net_263 = (!net_272&net_274);
  // u_5613: sky130_fd_sc_hd__and4_2
  assign net_573 = (register_group_07_q[7]&net_457&net_477&net_478);
  // u_5614: sky130_fd_sc_hd__nor2_2
  assign net_555 = (!net_477&!net_533);
  // u_5615: sky130_fd_sc_hd__and2b_2
  assign net_519 = (!net_573&net_571);
  // u_5626: sky130_fd_sc_hd__inv_2
  assign net_459 = (!net_477);
  // u_5627: sky130_fd_sc_hd__o21a_2
  assign net_384 = (net_341&net_386) | (net_430&net_386);
  // u_5628: sky130_fd_sc_hd__nand2_2
  assign net_341 = (!register_group_07_q[6]) | (!register_group_07_q[5]);
  // u_5947: sky130_fd_sc_hd__a31o_2
  assign net_571 = (net_457&net_477&net_478) | (register_group_07_q[7]);
  // u_6017: sky130_fd_sc_hd__a31o_2
  assign net_386 = (register_group_07_q[6]&net_477&net_478) | (register_group_07_q[5]);
  // u_6032: sky130_fd_sc_hd__and2_2
  assign net_457 = (register_group_07_q[6]&register_group_07_q[5]);
  // u_6033: sky130_fd_sc_hd__and3_2
  assign net_272 = (register_group_07_q[2]&register_group_07_q[1]&net_477);
  // u_6041: sky130_fd_sc_hd__o21a_2
  assign net_458 = (register_group_07_q[0]&net_430) | (net_272&net_430);
  // u_6067: sky130_fd_sc_hd__nand2_2
  assign net_430 = (!net_477) | (!net_478);
  // u_6094: sky130_fd_sc_hd__and2b_2
  assign net_488 = (!register_group_07_q[2]&register_group_07_q[3]);
  // u_6103: sky130_fd_sc_hd__a32o_2
  assign net_347 = (I&net_604&net_488) | (net_459&register_group_07_q[2]);
  // u_6110: sky130_fd_sc_hd__xor2_2
  assign net_578 = (register_group_07_q[4]&!net_573) | (!register_group_07_q[4]&net_573);
  // u_6160: sky130_fd_sc_hd__a21oi_2
  assign net_533 = (!I&!register_group_07_q[3]) | (!net_604&!register_group_07_q[3]);
  // u_6166: sky130_fd_sc_hd__and3_2
  assign net_477 = (register_group_07_q[3]&I&net_604);
  // u_6195: sky130_fd_sc_hd__xnor2_2
  assign net_297 = (!register_group_07_q[6]&!net_430) | (register_group_07_q[6]&net_430);
  // u_6350: sky130_fd_sc_hd__and3_2
  assign net_478 = (register_group_07_q[2]&register_group_07_q[1]&register_group_07_q[0]);
  // u_6356: sky130_fd_sc_hd__a21o_2
  assign net_274 = (register_group_07_q[2]&net_477) | (register_group_07_q[1]);

  // Destination D-pin vector.
  assign register_group_07_d[0] = net_458;  // u_6095.D / net_458
  assign register_group_07_d[1] = net_263;  // u_6106.D / net_263
  assign register_group_07_d[2] = net_347;  // u_6109.D / net_347
  assign register_group_07_d[3] = net_555;  // u_6111.D / net_555
  assign register_group_07_d[4] = net_578;  // u_6159.D / net_578
  assign register_group_07_d[5] = net_384;  // u_6197.D / net_384
  assign register_group_07_d[6] = net_297;  // u_6198.D / net_297
  assign register_group_07_d[7] = net_519;  // u_6199.D / net_519

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_07_q[0] <= 1'b0;
    else register_group_07_q[0] <= register_group_07_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_07_q[1] <= 1'b0;
    else register_group_07_q[1] <= register_group_07_d[1];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_07_q[2] <= 1'b0;
    else register_group_07_q[2] <= register_group_07_d[2];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_07_q[3] <= 1'b0;
    else register_group_07_q[3] <= register_group_07_d[3];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_07_q[4] <= 1'b0;
    else register_group_07_q[4] <= register_group_07_d[4];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_07_q[5] <= 1'b0;
    else register_group_07_q[5] <= register_group_07_d[5];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_07_q[6] <= 1'b0;
    else register_group_07_q[6] <= register_group_07_d[6];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_group_07_q[7] <= 1'b0;
    else register_group_07_q[7] <= register_group_07_d[7];
  end
endmodule
