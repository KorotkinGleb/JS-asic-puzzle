// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__dfstp_2
module sky130_fd_sc_hd__dfstp_2 (
    input wire CLK,
    input wire D,
    input wire SET_B,
    output wire Q
);

  reg IQ;

  always @(posedge CLK or negedge SET_B) begin
    if (!SET_B) IQ <= 1'b1;
    else IQ <= D;
  end

  assign Q = IQ;
endmodule
