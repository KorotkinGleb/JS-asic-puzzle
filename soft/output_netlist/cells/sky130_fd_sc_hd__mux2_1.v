// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__mux2_1
module sky130_fd_sc_hd__mux2_1 (
    input wire A0,
    input wire A1,
    input wire S,
    output wire X
);

  assign X = (A0&!S) | (A1&S);
endmodule
