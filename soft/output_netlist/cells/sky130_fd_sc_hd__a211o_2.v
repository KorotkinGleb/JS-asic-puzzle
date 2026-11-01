// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__a211o_2
module sky130_fd_sc_hd__a211o_2 (
    input wire A1,
    input wire A2,
    input wire B1,
    input wire C1,
    output wire X
);

  assign X = (A1&A2) | (B1) | (C1);
endmodule
