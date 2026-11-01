`timescale 1ns/1ps

module tb_net_1131;
  reg clk = 0;
  reg rst_n = 1;
  reg enable = 0;
  reg serial_in = 0;
  reg register_16 = 0;
  reg [3:0] register_03;
  reg [3:0] register_04;
  wire [7:0] register_10;

  integer row;
  integer column;

  recovered_register_10 dut (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .serial_in(serial_in),
    .register_03(register_03),
    .register_04(register_04),
    .register_16(register_16),
    .register_10(register_10)
  );

  initial begin
    $display("net_1131 map:");
    $display("    01234567890");

    for (row = 0; row < 11; row = row + 1) begin
      $write("%2d: ", row);

      for (column = 0; column < 11; column = column + 1) begin
        // Logical coordinate -> recovered physical register-bit order.
        register_03 = {
          column[1], column[0], column[3], column[2]
        };
        register_04 = {
          row[1], row[0], row[2], row[3]
        };

        #1;
        $write("%s", dut.net_1131 ? "1" : ".");
      end

      $write("\n");
    end

    $finish;
  end
endmodule
