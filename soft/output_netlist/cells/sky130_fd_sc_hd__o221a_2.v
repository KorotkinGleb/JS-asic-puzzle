// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__o221a_2
module sky130_fd_sc_hd__o221a_2 (
    input wire A1,
    input wire A2,
    input wire B1,
    input wire B2,
    input wire C1,
    output wire X
);

  assign X = (A1&B1&C1) | (A2&B1&C1) | (A1&B2&C1) | (A2&B2&C1);
endmodule
