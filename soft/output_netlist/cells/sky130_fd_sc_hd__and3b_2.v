// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__and3b_2
module sky130_fd_sc_hd__and3b_2 (
    input wire A_N,
    input wire B,
    input wire C,
    output wire X
);

  assign X = (!A_N&B&C);
endmodule
