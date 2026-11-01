// Stateful RTL recovered by merging every FF.D backward cone.
// shift_register: 12 bit(s), verified shift register.
module recovered_shift_register (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire register_16,  // recovered register boundary
    output reg [11:0] shift_register  // recovered current state
);

  // Physical-bit mapping.
  // shift_register[0] = u_5000.Q / net_1577; D=net_1584
  // shift_register[1] = u_5401.Q / net_1547; D=net_1544
  // shift_register[2] = u_5093.Q / net_1596; D=net_1597
  // shift_register[3] = u_5399.Q / net_1458; D=net_1464
  // shift_register[4] = u_5004.Q / net_1402; D=net_1354
  // shift_register[5] = u_5342.Q / net_1349; D=net_1279
  // shift_register[6] = u_4993.Q / net_1309; D=net_1351
  // shift_register[7] = u_5569.Q / net_1212; D=net_1214
  // shift_register[8] = u_5343.Q / net_1248; D=net_1250
  // shift_register[9] = u_5344.Q / net_1308; D=net_1315
  // shift_register[10] = u_5339.Q / net_1358; D=net_1412
  // shift_register[11] = u_5336.Q / net_1512; D=net_1514

  // Extracted combinational nets.
  wire net_604;
  wire net_1214;
  wire net_1250;
  wire net_1279;
  wire net_1315;
  wire net_1351;
  wire net_1354;
  wire net_1412;
  wire net_1464;
  wire net_1514;
  wire net_1544;
  wire net_1584;
  wire net_1597;

  // Liberty Boolean functions recovered from standard cells.
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_5007: sky130_fd_sc_hd__mux2_1
  assign net_1597 = (shift_register[2]&!net_604) | (shift_register[1]&net_604);
  // u_5008: sky130_fd_sc_hd__mux2_1
  assign net_1544 = (shift_register[1]&!net_604) | (shift_register[0]&net_604);
  // u_5011: sky130_fd_sc_hd__mux2_1
  assign net_1464 = (shift_register[3]&!net_604) | (shift_register[2]&net_604);
  // u_5205: sky130_fd_sc_hd__mux2_1
  assign net_1279 = (shift_register[5]&!net_604) | (shift_register[4]&net_604);
  // u_5263: sky130_fd_sc_hd__mux2_1
  assign net_1351 = (shift_register[6]&!net_604) | (shift_register[5]&net_604);
  // u_5265: sky130_fd_sc_hd__mux2_1
  assign net_1214 = (shift_register[7]&!net_604) | (shift_register[6]&net_604);
  // u_5340: sky130_fd_sc_hd__mux2_1
  assign net_1584 = (shift_register[0]&!net_604) | (I&net_604);
  // u_5347: sky130_fd_sc_hd__mux2_1
  assign net_1412 = (shift_register[10]&!net_604) | (shift_register[9]&net_604);
  // u_5400: sky130_fd_sc_hd__mux2_1
  assign net_1514 = (shift_register[11]&!net_604) | (shift_register[10]&net_604);
  // u_5403: sky130_fd_sc_hd__mux2_1
  assign net_1315 = (shift_register[9]&!net_604) | (shift_register[8]&net_604);
  // u_5433: sky130_fd_sc_hd__mux2_1
  assign net_1354 = (shift_register[4]&!net_604) | (shift_register[3]&net_604);
  // u_5537: sky130_fd_sc_hd__mux2_1
  assign net_1250 = (shift_register[8]&!net_604) | (shift_register[7]&net_604);

  // Recovered state updates; physical CTS buffers are normalized away.
  // shift_register: verified shift register
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[0] <= 1'b0;
    else shift_register[0] <= net_1584;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[1] <= 1'b0;
    else shift_register[1] <= net_1544;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[2] <= 1'b0;
    else shift_register[2] <= net_1597;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[3] <= 1'b0;
    else shift_register[3] <= net_1464;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[4] <= 1'b0;
    else shift_register[4] <= net_1354;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[5] <= 1'b0;
    else shift_register[5] <= net_1279;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[6] <= 1'b0;
    else shift_register[6] <= net_1351;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[7] <= 1'b0;
    else shift_register[7] <= net_1214;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[8] <= 1'b0;
    else shift_register[8] <= net_1250;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[9] <= 1'b0;
    else shift_register[9] <= net_1315;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[10] <= 1'b0;
    else shift_register[10] <= net_1412;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register[11] <= 1'b0;
    else shift_register[11] <= net_1514;
  end

endmodule
