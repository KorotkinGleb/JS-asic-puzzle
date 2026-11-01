`timescale 1ns/1ps

module tb_register_11_regions;
  reg clk = 0;
  reg rst_n = 1;
  reg enable = 0;
  reg serial_in = 0;
  reg register_16 = 0;
  reg [3:0] register_03;
  reg [3:0] register_04;
  wire [7:0] register_11;

  integer row;
  integer column;

  recovered_register_11 dut (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .serial_in(serial_in),
    .register_03(register_03),
    .register_04(register_04),
    .register_16(register_16),
    .register_11(register_11)
  );

  initial begin
    $display("Register 11 region selectors:");
    $display("    01234567890");

    for (row = 0; row < 11; row = row + 1) begin
      $write("%2d: ", row);

      for (column = 0; column < 11; column = column + 1) begin
        register_03 = {
          column[1], column[0], column[3], column[2]
        };
        register_04 = {
          row[1], row[0], row[2], row[3]
        };

        #1;

        if (dut.net_583)
          $write("H");
        else if (dut.net_678)
          $write("I");
        else if (!dut.net_684)
          $write("J");
        else if (!dut.net_638)
          $write("K");
        else
          $write(".");
      end

      $write("\n");
    end

    $finish;
  end
endmodule
