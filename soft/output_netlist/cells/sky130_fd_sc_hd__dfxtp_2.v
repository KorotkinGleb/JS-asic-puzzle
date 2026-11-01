// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__dfxtp_2
module sky130_fd_sc_hd__dfxtp_2 (
    input wire CLK,
    input wire D,
    output wire Q
);

  reg IQ;

  always @(posedge CLK) begin
    IQ <= D;
  end

  assign Q = IQ;
endmodule
