// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__nand2_2
module sky130_fd_sc_hd__nand2_2 (
    input wire A,
    input wire B,
    output wire Y
);

  assign Y = (!A) | (!B);
endmodule
