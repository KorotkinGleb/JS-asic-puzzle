// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__dfrtp_2
module sky130_fd_sc_hd__dfrtp_2 (
    input wire CLK,
    input wire D,
    input wire RESET_B,
    output wire Q
);

  reg IQ;

  always @(posedge CLK or negedge RESET_B) begin
    if (!RESET_B) IQ <= 1'b0;
    else IQ <= D;
  end

  assign Q = IQ;
endmodule
