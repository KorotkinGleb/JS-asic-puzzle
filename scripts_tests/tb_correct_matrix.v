`timescale 1ns/1ps

module tb_correct_matrix;
  reg clk;
  reg rst_n;
  reg enable;
  reg serial_in;

  wire [7:0] O;
  wire success;

  // Unpacked array: matrix[row][column].
  reg matrix [0:10][0:10];
  integer row;
  integer column;

  puzzle dut (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .I(serial_in),
    .O(O),
    .success(success)
  );

  // GDS extraction left this isolated conductor ambiguous. Both constant
  // interpretations were verified to produce identical visible behavior.
  initial force dut.net_806 = 1'b0;

  task tick;
    begin
      #5 clk = 1'b1;
      #5 clk = 1'b0;
    end
  endtask

  initial begin
    $dumpfile("correct_matrix.vcd");
    $dumpvars(0, tb_correct_matrix);

    clk = 0;
    rst_n = 0;
    enable = 0;
    serial_in = 0;

    // Start with an empty 11x11 matrix.
    for (row = 0; row < 11; row = row + 1)
      for (column = 0; column < 11; column = column + 1)
        matrix[row][column] = 1'b0;

    // Verified solution: two stars per row, column, and irregular region.
    matrix[0][7] = 1;   matrix[0][9] = 1;
    matrix[1][0] = 1;   matrix[1][5] = 1;
    matrix[2][7] = 1;   matrix[2][9] = 1;
    matrix[3][0] = 1;   matrix[3][2] = 1;
    matrix[4][4] = 1;   matrix[4][6] = 1;
    matrix[5][2] = 1;   matrix[5][8] = 1;
    matrix[6][4] = 1;   matrix[6][10] = 1;
    matrix[7][1] = 1;   matrix[7][6] = 1;
    matrix[8][3] = 1;   matrix[8][10] = 1;
    matrix[9][5] = 1;   matrix[9][8] = 1;
    matrix[10][1] = 1;  matrix[10][3] = 1;

    // Reset protocol used by the original waveform.
    repeat (3) tick;
    rst_n = 1;
    tick;

    // Send one matrix cell per rising clock edge, row-major.
    enable = 1;
    for (row = 0; row < 11; row = row + 1) begin
      for (column = 0; column < 11; column = column + 1) begin
        serial_in = matrix[row][column];
        if (serial_in)
          $display("star: row=%0d column=%0d", row, column);
        tick;
      end
    end

    enable = 0;
    serial_in = 0;

    // One clock allows the final decision register to capture the result.
    tick;

    if (success)
      $display("PASS: success=%b", success);
    else
      $display("FAIL: success=%b", success);

    // Keep a few output-generator cycles in the VCD.
    repeat (16) tick;
    $finish;
  end
endmodule
