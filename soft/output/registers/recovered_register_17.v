// Stateful RTL recovered by merging every FF.D backward cone.
// register_17: 1 bit(s), ungrouped one-bit register.
module recovered_register_17 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    input wire [11:0] shift_register,  // recovered register boundary
    output reg register_17  // recovered current state
);

  // Physical-bit mapping.
  // register_17[0] = u_5337.Q / net_1360; D=net_1466

  // Extracted combinational nets.
  wire net_604;
  wire net_978;
  wire net_1002;
  wire net_1029;
  wire net_1454;
  wire net_1456;
  wire net_1466;

  // Liberty Boolean functions recovered from standard cells.
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_5680: sky130_fd_sc_hd__or4bb_2
  assign net_1002 = (register_03[2]) | (register_03[0]) | (!register_03[1]) | (!register_03[3]);
  // u_5681: sky130_fd_sc_hd__or4_2
  assign net_1029 = (register_03[2]) | (register_03[3]) | (register_03[0]) | (register_03[1]);
  // u_5789: sky130_fd_sc_hd__buf_2
  assign net_978 = (net_1029);
  // u_4999: sky130_fd_sc_hd__a22o_2
  assign net_1456 = (net_978&shift_register[11]) | (net_1029&shift_register[0]);
  // u_5229: sky130_fd_sc_hd__a221o_2
  assign net_1454 = (1'b1&shift_register[10]) | (net_1002&shift_register[9]) | (net_1456);
  // u_5256: sky130_fd_sc_hd__a31o_2
  assign net_1466 = (I&net_604&net_1454) | (register_17);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_17: ungrouped one-bit register
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_17 <= 1'b0;
    else register_17 <= net_1466;
  end

endmodule
