// Fully inlined RTL recovered from puzzle.gds.
// No includes, PDK cells, or helper modules are required.
// group_01: verified shift register; verified shift order.
module recovered_shift_register_standalone (
    input wire clk,  // clock root net_1608
    input wire rst_n,  // RESET_B / net_322
    input wire I,  // extracted net_520
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    output reg [11:0] shift_register_q,  // current register state
    output wire [11:0] shift_register_d  // recovered next state
);

  // Recovered register-bit mapping.
  // shift_register_q[0] = u_5000.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[1] = u_5401.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[2] = u_5093.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[3] = u_5399.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[4] = u_5004.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[5] = u_5342.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[6] = u_4993.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[7] = u_5569.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[8] = u_5343.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[9] = u_5344.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[10] = u_5339.Q (sky130_fd_sc_hd__dfrtp_2)
  // shift_register_q[11] = u_5336.Q (sky130_fd_sc_hd__dfrtp_2)

  // Recovered combinational nets.
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

  // Inlined Boolean functions of the recovered standard cells.
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!ff_4182_q&enable);
  // u_5007: sky130_fd_sc_hd__mux2_1
  assign net_1597 = (shift_register_q[2]&!net_604) | (shift_register_q[1]&net_604);
  // u_5008: sky130_fd_sc_hd__mux2_1
  assign net_1544 = (shift_register_q[1]&!net_604) | (shift_register_q[0]&net_604);
  // u_5011: sky130_fd_sc_hd__mux2_1
  assign net_1464 = (shift_register_q[3]&!net_604) | (shift_register_q[2]&net_604);
  // u_5205: sky130_fd_sc_hd__mux2_1
  assign net_1279 = (shift_register_q[5]&!net_604) | (shift_register_q[4]&net_604);
  // u_5263: sky130_fd_sc_hd__mux2_1
  assign net_1351 = (shift_register_q[6]&!net_604) | (shift_register_q[5]&net_604);
  // u_5265: sky130_fd_sc_hd__mux2_1
  assign net_1214 = (shift_register_q[7]&!net_604) | (shift_register_q[6]&net_604);
  // u_5340: sky130_fd_sc_hd__mux2_1
  assign net_1584 = (shift_register_q[0]&!net_604) | (I&net_604);
  // u_5347: sky130_fd_sc_hd__mux2_1
  assign net_1412 = (shift_register_q[10]&!net_604) | (shift_register_q[9]&net_604);
  // u_5400: sky130_fd_sc_hd__mux2_1
  assign net_1514 = (shift_register_q[11]&!net_604) | (shift_register_q[10]&net_604);
  // u_5403: sky130_fd_sc_hd__mux2_1
  assign net_1315 = (shift_register_q[9]&!net_604) | (shift_register_q[8]&net_604);
  // u_5433: sky130_fd_sc_hd__mux2_1
  assign net_1354 = (shift_register_q[4]&!net_604) | (shift_register_q[3]&net_604);
  // u_5537: sky130_fd_sc_hd__mux2_1
  assign net_1250 = (shift_register_q[8]&!net_604) | (shift_register_q[7]&net_604);

  // Destination D-pin vector.
  assign shift_register_d[0] = net_1584;  // u_5000.D / net_1584
  assign shift_register_d[1] = net_1544;  // u_5401.D / net_1544
  assign shift_register_d[2] = net_1597;  // u_5093.D / net_1597
  assign shift_register_d[3] = net_1464;  // u_5399.D / net_1464
  assign shift_register_d[4] = net_1354;  // u_5004.D / net_1354
  assign shift_register_d[5] = net_1279;  // u_5342.D / net_1279
  assign shift_register_d[6] = net_1351;  // u_4993.D / net_1351
  assign shift_register_d[7] = net_1214;  // u_5569.D / net_1214
  assign shift_register_d[8] = net_1250;  // u_5343.D / net_1250
  assign shift_register_d[9] = net_1315;  // u_5344.D / net_1315
  assign shift_register_d[10] = net_1412;  // u_5339.D / net_1412
  assign shift_register_d[11] = net_1514;  // u_5336.D / net_1514

  // Recovered sequential behavior.
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[0] <= 1'b0;
    else shift_register_q[0] <= shift_register_d[0];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[1] <= 1'b0;
    else shift_register_q[1] <= shift_register_d[1];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[2] <= 1'b0;
    else shift_register_q[2] <= shift_register_d[2];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[3] <= 1'b0;
    else shift_register_q[3] <= shift_register_d[3];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[4] <= 1'b0;
    else shift_register_q[4] <= shift_register_d[4];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[5] <= 1'b0;
    else shift_register_q[5] <= shift_register_d[5];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[6] <= 1'b0;
    else shift_register_q[6] <= shift_register_d[6];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[7] <= 1'b0;
    else shift_register_q[7] <= shift_register_d[7];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[8] <= 1'b0;
    else shift_register_q[8] <= shift_register_d[8];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[9] <= 1'b0;
    else shift_register_q[9] <= shift_register_d[9];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[10] <= 1'b0;
    else shift_register_q[10] <= shift_register_d[10];
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) shift_register_q[11] <= 1'b0;
    else shift_register_q[11] <= shift_register_d[11];
  end
endmodule
