// Complete register-to-register cone recovered from puzzle.gds.
// Forward search: selected root nets -> destination sequential pins.
// Backward search: destination pins -> all required source signals.
module recovered_ff_4182_input_logic (
    input wire enable,  // extracted net_1186
    input wire ff_4182_q,  // extracted net_1968
    input wire ff_4659_q,  // extracted net_1001
    input wire ff_4661_q,  // extracted net_547
    input wire ff_4662_q,  // extracted net_169
    input wire ff_4838_q,  // extracted net_114
    input wire ff_6435_q,  // extracted net_206
    input wire ff_6436_q,  // extracted net_173
    input wire ff_6442_q,  // extracted net_171
    input wire ff_6451_q,  // extracted net_205
    output wire to_ff_4182_d   // extracted net_2007
);

  wire net_604;
  wire net_820;
  wire net_821;
  wire net_873;

  // to_ff_4182_d drives u_4182.D

  // a31o_2: X=(A1&A2&A3) | (B1)
  sky130_fd_sc_hd__a31o_2 u_4602 (
      .A1(net_873),
      .A2(net_821),
      .A3(net_604),
      .B1(ff_4182_q),
      .X(to_ff_4182_d)
  );

  // and4bb_2: X=(!A_N&!B_N&C&D)
  sky130_fd_sc_hd__and4bb_2 u_4705 (
      .A_N(ff_4662_q),
      .B_N(ff_4659_q),
      .C(ff_4661_q),
      .D(ff_4838_q),
      .X(net_873)
  );

  // and2b_2: X=(!A_N&B)
  sky130_fd_sc_hd__and2b_2 u_4722 (
      .A_N(ff_4182_q),
      .B(enable),
      .X(net_604)
  );

  // nand3b_2: Y=(A_N) | (!B) | (!C)
  sky130_fd_sc_hd__nand3b_2 u_6472 (
      .A_N(ff_6436_q),
      .B(ff_6435_q),
      .C(ff_6451_q),
      .Y(net_820)
  );

  // nor2_2: Y=(!A&!B)
  sky130_fd_sc_hd__nor2_2 u_6609 (
      .A(ff_6442_q),
      .B(net_820),
      .Y(net_821)
  );

endmodule
