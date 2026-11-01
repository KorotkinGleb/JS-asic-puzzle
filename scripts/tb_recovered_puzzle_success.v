`timescale 1ns / 1ps

// Replay the serial input found by bounded SAT against the event-driven RTL.
module tb_recovered_puzzle_success;
  reg clk;
  reg rst_n;
  reg enable;
  reg I;

  wire [7:0] O_tie0;
  wire [7:0] O_tie1;
  wire success_tie0;
  wire success_tie1;

  integer i;
  integer errors;

  // Bits are transmitted from left to right (SERIAL_BITS[120] first).
  localparam [120:0] SERIAL_BITS =
      121'b0000000101010000100000000000010101010000000000001010000001000001000000100000101000010000000100000010000010010001010000000;

  function [7:0] expected_output;
    input integer cycle;
    begin
      case (cycle)
         0: expected_output = 8'h28; // (
         1: expected_output = 8'h2a; // *
         2: expected_output = 8'h20; // space
         3: expected_output = 8'h54; // T
         4: expected_output = 8'h57; // W
         5: expected_output = 8'h4f; // O
         6: expected_output = 8'h20; // space
         7: expected_output = 8'h53; // S
         8: expected_output = 8'h54; // T
         9: expected_output = 8'h41; // A
        10: expected_output = 8'h52; // R
        11: expected_output = 8'h53; // S
        12: expected_output = 8'h20; // space
        13: expected_output = 8'h2a; // *
        14: expected_output = 8'h29; // )
        default: expected_output = 8'h00;
      endcase
    end
  endfunction

  puzzle dut_tie0 (
      .clk(clk), .rst_n(rst_n), .enable(enable), .I(I),
      .O(O_tie0), .success(success_tie0)
  );

  puzzle dut_tie1 (
      .clk(clk), .rst_n(rst_n), .enable(enable), .I(I),
      .O(O_tie1), .success(success_tie1)
  );

  // Extraction found net_806 as an isolated conductor.  Check both Boolean
  // interpretations so the reported solution does not depend on that ambiguity.
  initial begin
    force dut_tie0.net_806 = 1'b0;
    force dut_tie1.net_806 = 1'b1;
  end

  task tick;
    begin
      #5 clk = 1'b1;
      #1;
      if ({success_tie0, O_tie0} !== {success_tie1, O_tie1}) begin
        $display("ERROR: net_806 interpretations disagree: tie0=%b/%02x tie1=%b/%02x",
                 success_tie0, O_tie0, success_tie1, O_tie1);
        errors = errors + 1;
      end
      #4 clk = 1'b0;
    end
  endtask

  initial begin
    $dumpfile("scripts/recovered_puzzle_success.vcd");
    $dumpvars(0, tb_recovered_puzzle_success);

    clk = 1'b0;
    rst_n = 1'b0;
    enable = 1'b0;
    I = 1'b0;
    errors = 0;

    // Match the protocol in example_inputs.vcd: three reset clocks, one idle
    // clock after reset release, 121 enabled serial clocks, then read output.
    repeat (3) tick;
    rst_n = 1'b1;
    tick;

    enable = 1'b1;
    for (i = 120; i >= 0; i = i - 1) begin
      I = SERIAL_BITS[i];
      tick;
    end

    enable = 1'b0;
    I = 1'b0;
    for (i = 0; i < 20; i = i + 1) begin
      tick;
      $display("output_cycle=%0d success=%b O=0x%02x char='%c'",
               i, success_tie0, O_tie0,
               ((O_tie0 >= 8'h20) && (O_tie0 <= 8'h7e)) ? O_tie0 : 8'h2e);
      if (success_tie0 !== 1'b1) begin
        $display("ERROR: success is not high at output cycle %0d", i);
        errors = errors + 1;
      end
      if (O_tie0 !== expected_output(i)) begin
        $display("ERROR: output cycle %0d: expected 0x%02x, got 0x%02x",
                 i, expected_output(i), O_tie0);
        errors = errors + 1;
      end
    end

    if (!success_tie0) begin
      $display("ERROR: success was not high at the end of replay");
      errors = errors + 1;
    end

    if (errors == 0)
      $display("PASS: satisfying serial stream reproduced in event-driven RTL");
    else
      $display("FAIL: %0d error(s)", errors);

    $finish;
  end
endmodule
