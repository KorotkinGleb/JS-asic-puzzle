// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__o21ai_2
module sky130_fd_sc_hd__o21ai_2 (
    input wire A1,
    input wire A2,
    input wire B1,
    output wire Y
);

  assign Y = (!A1&!A2) | (!B1);
endmodule
