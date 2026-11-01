// Structural netlist recovered from a GDS backward DAG trace.
// Design logic contains wires and standard-cell instances only.
module recovered_success_logic_netlist (
    input wire [2:0] register_09,  // recovered register boundary
    output wire success
);

  // Recovered standard-cell instances.
  // Structural connections to module output ports.
  soft_netlist_buf u_output_success_2380 (
      .A(register_09[2]),
      .X(success)
  );

endmodule
