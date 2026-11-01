// Stateful RTL recovered by merging every FF.D backward cone.
// register_03: 4 bit(s), state/counter register candidate.
module recovered_register_03 (
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire register_16,  // recovered register boundary
    output reg [3:0] register_03  // recovered current state
);

  // Physical-bit mapping.
  // register_03[0] = u_4659.Q / net_1001; D=net_1307
  // register_03[1] = u_4661.Q / net_547; D=net_1568
  // register_03[2] = u_4662.Q / net_169; D=net_1448
  // register_03[3] = u_4838.Q / net_114; D=net_1394

  // Extracted combinational nets.
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

  // Liberty Boolean functions recovered from standard cells.
  // u_4705: sky130_fd_sc_hd__and4bb_2
  assign net_873 = (!register_03[2]&!register_03[0]&register_03[1]&register_03[3]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_4660: sky130_fd_sc_hd__and3_2
  assign net_1303 = (register_03[3]&register_03[2]&net_604);
  // u_4837: sky130_fd_sc_hd__a21oi_2
  assign net_1453 = (!register_03[2]&!register_03[3]) | (!net_604&!register_03[3]);
  // u_4859: sky130_fd_sc_hd__xnor2_2
  assign net_1497 = (!register_03[2]&!net_604) | (register_03[2]&net_604);
  // u_4863: sky130_fd_sc_hd__a41oi_2
  assign net_1535 = (!register_03[3]&!register_03[1]) | (!register_03[2]&!register_03[1]) | (!register_03[0]&!register_03[1]) | (!net_604&!register_03[1]);
  // u_4949: sky130_fd_sc_hd__and4_2
  assign net_1391 = (register_03[3]&register_03[2]&register_03[0]&net_604);
  // u_4862: sky130_fd_sc_hd__xor2_2
  assign net_1307 = (register_03[0]&!net_1303) | (!register_03[0]&net_1303);
  // u_4835: sky130_fd_sc_hd__a211oi_2
  assign net_1394 = (!net_604&!net_1453&!net_1303) | (!net_873&!net_1453&!net_1303);
  // u_4710: sky130_fd_sc_hd__nor2_2
  assign net_1448 = (!net_873&!net_1497);
  // u_4663: sky130_fd_sc_hd__a221oi_2
  assign net_1568 = (!net_604&!net_1391&!net_1535) | (!net_604&!register_03[1]&!net_1535) | (!net_873&!net_1391&!net_1535) | (!net_873&!register_03[1]&!net_1535);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_03: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_03[0] <= 1'b0;
    else register_03[0] <= net_1307;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_03[1] <= 1'b0;
    else register_03[1] <= net_1568;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_03[2] <= 1'b0;
    else register_03[2] <= net_1448;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_03[3] <= 1'b0;
    else register_03[3] <= net_1394;
  end

endmodule
