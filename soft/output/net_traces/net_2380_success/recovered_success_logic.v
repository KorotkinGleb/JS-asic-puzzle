// Combinational RTL recovered from a GDS backward DAG trace.
// Inputs stop only at recovered register Q pins or pure top inputs.
module recovered_success_logic (
    input wire [2:0] register_09,  // recovered register boundary
    output wire success
);

  // Liberty Boolean functions recovered from standard cells.

  assign success = register_09[2];  // net_2380
endmodule
