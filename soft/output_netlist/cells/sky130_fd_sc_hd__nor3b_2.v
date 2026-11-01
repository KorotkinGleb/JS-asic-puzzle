// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__nor3b_2
module sky130_fd_sc_hd__nor3b_2 (
    input wire A,
    input wire B,
    input wire C_N,
    output wire Y
);

  assign Y = (!A&!B&C_N);
endmodule
