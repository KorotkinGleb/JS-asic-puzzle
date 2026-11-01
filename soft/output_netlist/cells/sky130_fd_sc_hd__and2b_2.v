// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__and2b_2
module sky130_fd_sc_hd__and2b_2 (
    input wire A_N,
    input wire B,
    output wire X
);

  assign X = (!A_N&B);
endmodule
