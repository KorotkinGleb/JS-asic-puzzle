// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__a2111oi_2
module sky130_fd_sc_hd__a2111oi_2 (
    input wire A1,
    input wire A2,
    input wire B1,
    input wire C1,
    input wire D1,
    output wire Y
);

  assign Y = (!A1&!B1&!C1&!D1) | (!A2&!B1&!C1&!D1);
endmodule
