// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__o2bb2a_2
module sky130_fd_sc_hd__o2bb2a_2 (
    input wire A1_N,
    input wire A2_N,
    input wire B1,
    input wire B2,
    output wire X
);

  assign X = (!A1_N&B1) | (!A2_N&B1) | (!A1_N&B2) | (!A2_N&B2);
endmodule
