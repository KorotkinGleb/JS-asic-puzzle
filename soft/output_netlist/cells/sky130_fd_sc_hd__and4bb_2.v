// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__and4bb_2
module sky130_fd_sc_hd__and4bb_2 (
    input wire A_N,
    input wire B_N,
    input wire C,
    input wire D,
    output wire X
);

  assign X = (!A_N&!B_N&C&D);
endmodule
