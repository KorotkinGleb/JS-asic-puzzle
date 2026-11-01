// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__nor4_2
module sky130_fd_sc_hd__nor4_2 (
    input wire A,
    input wire B,
    input wire C,
    input wire D,
    output wire Y
);

  assign Y = (!A&!B&!C&!D);
endmodule
