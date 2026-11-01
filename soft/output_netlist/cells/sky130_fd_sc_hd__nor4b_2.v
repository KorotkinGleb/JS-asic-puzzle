// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__nor4b_2
module sky130_fd_sc_hd__nor4b_2 (
    input wire A,
    input wire B,
    input wire C,
    input wire D_N,
    output wire Y
);

  assign Y = (!A&!B&!C&D_N);
endmodule
