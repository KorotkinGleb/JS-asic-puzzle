// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__and4b_2
module sky130_fd_sc_hd__and4b_2 (
    input wire A_N,
    input wire B,
    input wire C,
    input wire D,
    output wire X
);

  assign X = (!A_N&B&C&D);
endmodule
