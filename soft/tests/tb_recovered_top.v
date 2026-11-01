`timescale 1ns / 1ps

`ifndef DUT_MODULE
`define DUT_MODULE recovered_top
`endif

// End-to-end replay of the satisfying serial stream against soft/output RTL.
module tb_recovered_top;
  reg clk = 0;
  reg rst_n = 0;
  reg enable = 0;
  reg I = 0;
  reg net_806_a = 0;
  reg net_806_b = 1;
  wire [7:0] O_a;
  wire [7:0] O_b;
  wire success_a;
  wire success_b;
  integer i;
  integer errors = 0;

  localparam [120:0] SERIAL_BITS =
      121'b0000000101010000100000000000010101010000000000001010000001000001000000100000101000010000000100000010000010010001010000000;

  `DUT_MODULE dut_a (
      .clk(clk), .rst_n(rst_n), .enable(enable), .I(I), .net_806(net_806_a),
      .O(O_a), .success(success_a)
  );
  `DUT_MODULE dut_b (
      .clk(clk), .rst_n(rst_n), .enable(enable), .I(I), .net_806(net_806_b),
      .O(O_b), .success(success_b)
  );

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

  task tick;
    begin
      #5 clk = 1;
      #1;
      if ({success_a, O_a} !== {success_b, O_b}) begin
        $display("net_806 ambiguity changed outputs: %b/%02x vs %b/%02x",
                 success_a, O_a, success_b, O_b);
        errors = errors + 1;
      end
      #4 clk = 0;
    end
  endtask

  initial begin
    repeat (3) tick;
    rst_n = 1;
    tick;

    enable = 1;
    for (i = 120; i >= 0; i = i - 1) begin
      I = SERIAL_BITS[i];
      tick;
    end

    enable = 0;
    I = 0;
    for (i = 0; i < 20; i = i + 1) begin
      tick;
      if (success_a !== 1'b1 || O_a !== expected_output(i)) begin
        $display("cycle %0d expected success=1 O=%02x, got %b/%02x",
                 i, expected_output(i), success_a, O_a);
        errors = errors + 1;
      end
    end

    if (errors != 0)
      $fatal(1, "behavioral regression failed with %0d error(s)", errors);
    $display("PASS: success=1 and output is '(* TWO STARS *)'");
    $finish;
  end
endmodule
