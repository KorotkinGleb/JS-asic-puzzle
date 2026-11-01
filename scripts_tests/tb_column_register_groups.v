`timescale 1ns/1ps

module tb_column_register_groups;
  reg clk = 0;
  reg rst_n = 1;
  reg enable = 1;
  reg serial_in = 1;
  reg register_16 = 0;
  reg [3:0] register_03;
  wire [1:0] register_05;
  wire [5:0] register_13;
  wire [5:0] register_14;
  wire [7:0] register_15;
  integer column;

  recovered_register_05 dut05 (
    .clk(clk), .rst_n(rst_n), .enable(enable),
    .serial_in(serial_in), .register_03(register_03),
    .register_16(register_16), .register_05(register_05)
  );

  recovered_register_13 dut13 (
    .clk(clk), .rst_n(rst_n), .enable(enable),
    .serial_in(serial_in), .register_03(register_03),
    .register_16(register_16), .register_13(register_13)
  );

  recovered_register_14 dut14 (
    .clk(clk), .rst_n(rst_n), .enable(enable),
    .serial_in(serial_in), .register_03(register_03),
    .register_16(register_16), .register_14(register_14)
  );

  recovered_register_15 dut15 (
    .clk(clk), .rst_n(rst_n), .enable(enable),
    .serial_in(serial_in), .register_03(register_03),
    .register_16(register_16), .register_15(register_15)
  );

  task pulse_clock;
    begin
      #1 clk = 1;
      #1 clk = 0;
    end
  endtask

  initial begin
    $display("col : after one star -> after two stars");

    for (column = 0; column < 11; column = column + 1) begin
      rst_n = 0;
      #1;
      rst_n = 1;

      // Logical column -> recovered physical register-bit order.
      register_03 = {
        column[1], column[0], column[3], column[2]
      };

      pulse_clock();
      $write(
        "%2d: r05=%02b r13=%06b r14=%06b r15=%08b -> ",
        column, register_05, register_13, register_14, register_15
      );

      pulse_clock();
      $display(
        "r05=%02b r13=%06b r14=%06b r15=%08b",
        register_05, register_13, register_14, register_15
      );
    end

    $finish;
  end
endmodule
