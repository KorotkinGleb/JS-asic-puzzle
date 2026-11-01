// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__nand2b_2
module sky130_fd_sc_hd__nand2b_2 (
    input wire A_N,
    input wire B,
    output wire Y
);

  assign Y = (A_N) | (!B);
endmodule
