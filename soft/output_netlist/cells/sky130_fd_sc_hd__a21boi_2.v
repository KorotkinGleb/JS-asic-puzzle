// PDK-free functional simulation model generated from Liberty.
// Original master: sky130_fd_sc_hd__a21boi_2
module sky130_fd_sc_hd__a21boi_2 (
    input wire A1,
    input wire A2,
    input wire B1_N,
    output wire Y
);

  assign Y = (!A1&B1_N) | (!A2&B1_N);
endmodule
