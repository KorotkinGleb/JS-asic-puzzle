// Stateful RTL recovered by merging every FF.D backward cone.
// register_06: 3 bit(s), state/counter register candidate.
module recovered_register_06 (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire [3:0] register_03,  // recovered register boundary
    input wire register_16,  // recovered register boundary
    output reg [2:0] register_06  // recovered current state
);

  // Physical-bit mapping.
  // register_06[0] = u_5634.Q / net_974; D=net_928
  // register_06[1] = u_5638.Q / net_828; D=net_831
  // register_06[2] = u_5639.Q / net_1006; D=net_1007

  // Extracted combinational nets.
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

  // Liberty Boolean functions recovered from standard cells.
  // u_4705: sky130_fd_sc_hd__and4bb_2
  assign net_873 = (!register_03[2]&!register_03[0]&register_03[1]&register_03[3]);
  // u_4722: sky130_fd_sc_hd__and2b_2
  assign net_604 = (!register_16&enable);
  // u_5636: sky130_fd_sc_hd__inv_2
  assign net_929 = (!register_06[0]);
  // u_5684: sky130_fd_sc_hd__or2_2
  assign net_976 = (register_06[2]) | (I);
  // u_5711: sky130_fd_sc_hd__nand2_2
  assign net_930 = (!register_06[2]) | (!I);
  // u_5630: sky130_fd_sc_hd__inv_2
  assign net_907 = (!net_873);
  // u_5775: sky130_fd_sc_hd__inv_2
  assign net_1005 = (!net_604);
  // u_5677: sky130_fd_sc_hd__o211a_2
  assign net_1004 = (register_06[0]&net_976&net_604) | (net_930&net_976&net_604);
  // u_5683: sky130_fd_sc_hd__mux2_1
  assign net_882 = (net_930&!register_06[0]) | (net_976&register_06[0]);
  // u_5778: sky130_fd_sc_hd__mux2_1
  assign net_927 = (net_873&!net_1005) | (net_929&net_1005);
  // u_5781: sky130_fd_sc_hd__a22o_2
  assign net_1007 = (net_1004&net_907) | (net_1005&register_06[2]);
  // u_5640: sky130_fd_sc_hd__a31o_2
  assign net_831 = (net_873&net_604&net_882) | (register_06[1]);
  // u_5682: sky130_fd_sc_hd__a21oi_2
  assign net_928 = (!net_929&!net_927) | (!net_930&!net_927);

  // Recovered state updates; physical CTS buffers are normalized away.
  // register_06: state/counter register candidate
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_06[0] <= 1'b0;
    else register_06[0] <= net_928;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_06[1] <= 1'b0;
    else register_06[1] <= net_831;
  end
  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) register_06[2] <= 1'b0;
    else register_06[2] <= net_1007;
  end

endmodule
