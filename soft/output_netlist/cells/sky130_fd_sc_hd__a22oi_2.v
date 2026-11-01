// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__a22oi_2
module sky130_fd_sc_hd__a22oi_2 (
    input wire A1,
    input wire A2,
    input wire B1,
    input wire B2,
    output wire Y
);

  assign Y = (!A1&!B1) | (!A1&!B2) | (!A2&!B1) | (!A2&!B2);
endmodule
