// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__a22o_2
module sky130_fd_sc_hd__a22o_2 (
    input wire A1,
    input wire A2,
    input wire B1,
    input wire B2,
    output wire X
);

  assign X = (B1&B2) | (A1&A2);
endmodule
