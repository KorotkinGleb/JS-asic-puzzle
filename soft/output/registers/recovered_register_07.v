// Stateful RTL recovered by merging every FF.D backward cone.
// register_07: 8 bit(s), state/counter register candidate.
module recovered_register_07 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire register_16,  // recovered register boundary
    output reg [7:0] register_07  // recovered current state
);

  // Physical-bit mapping.
  // register_07[0] = u_6095.Q / net_433; D=net_458
  // register_07[1] = u_6106.Q / net_342; D=net_263
  // register_07[2] = u_6109.Q / net_338; D=net_347
  // register_07[3] = u_6111.Q / net_603; D=net_555
  // register_07[4] = u_6159.Q / net_534; D=net_578
  // register_07[5] = u_6197.Q / net_415; D=net_384
  // register_07[6] = u_6198.Q / net_339; D=net_297
  // register_07[7] = u_6199.Q / net_484; D=net_519

  // Extracted combinational nets.
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

  // Liberty Boolean functions recovered from standard cells.
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_5628: sky130_fd_sc_hd__nand2_2
  assign net_341 = (!register_07[6]) | (!register_07[5]);
  // u_6032: sky130_fd_sc_hd__and2_2
  assign net_457 = (register_07[6]&register_07[5]);
  // u_6094: sky130_fd_sc_hd__and2b_2
  assign net_488 = (!register_07[2]&register_07[3]);
  // u_6350: sky130_fd_sc_hd__and3_2
  assign net_478 = (register_07[2]&register_07[1]&register_07[0]);
  // u_6160: sky130_fd_sc_hd__a21oi_2
  assign net_533 = (!I&!register_07[3]) | (!net_604&!register_07[3]);
  // u_6166: sky130_fd_sc_hd__and3_2
  assign net_477 = (register_07[3]&I&net_604);
  // u_5613: sky130_fd_sc_hd__and4_2
  assign net_573 = (register_07[7]&net_457&net_477&net_478);
  // u_5614: sky130_fd_sc_hd__nor2_2
  assign net_555 = (!net_477&!net_533);
  // u_5626: sky130_fd_sc_hd__inv_2
  assign net_459 = (!net_477);
  // u_5947: sky130_fd_sc_hd__a31o_2
  assign net_571 = (net_457&net_477&net_478) | (register_07[7]);
  // u_6017: sky130_fd_sc_hd__a31o_2
  assign net_386 = (register_07[6]&net_477&net_478) | (register_07[5]);
  // u_6033: sky130_fd_sc_hd__and3_2
  assign net_272 = (register_07[2]&register_07[1]&net_477);
  // u_6067: sky130_fd_sc_hd__nand2_2
  assign net_430 = (!net_477) | (!net_478);
  // u_6356: sky130_fd_sc_hd__a21o_2
  assign net_274 = (register_07[2]&net_477) | (register_07[1]);
  // u_6110: sky130_fd_sc_hd__xor2_2
  assign net_578 = (register_07[4]&!net_573) | (!register_07[4]&net_573);
  // u_6103: sky130_fd_sc_hd__a32o_2
  assign net_347 = (I&net_604&net_488) | (net_459&register_07[2]);
  // u_5615: sky130_fd_sc_hd__and2b_2
  assign net_519 = (!net_573&net_571);
  // u_5627: sky130_fd_sc_hd__o21a_2
  assign net_384 = (net_341&net_386) | (net_430&net_386);
  // u_6041: sky130_fd_sc_hd__o21a_2
  assign net_458 = (register_07[0]&net_430) | (net_272&net_430);
  // u_6195: sky130_fd_sc_hd__xnor2_2
  assign net_297 = (!register_07[6]&!net_430) | (register_07[6]&net_430);
  // u_5603: sky130_fd_sc_hd__and2b_2
  assign net_263 = (!net_272&net_274);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_07: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[0] <= 1'b0;
    else register_07[0] <= net_458;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[1] <= 1'b0;
    else register_07[1] <= net_263;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[2] <= 1'b0;
    else register_07[2] <= net_347;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[3] <= 1'b0;
    else register_07[3] <= net_555;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[4] <= 1'b0;
    else register_07[4] <= net_578;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[5] <= 1'b0;
    else register_07[5] <= net_384;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[6] <= 1'b0;
    else register_07[6] <= net_297;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_07[7] <= 1'b0;
    else register_07[7] <= net_519;
  end

endmodule
