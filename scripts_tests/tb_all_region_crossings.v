`timescale 1ns/1ps

module tb_all_region_crossings;
  reg clk = 0;
  reg rst_n = 1;
  reg enable = 0;
  reg serial_in = 0;
  reg register_16 = 0;
  reg [3:0] register_03;
  reg [3:0] register_04;
  wire [5:0] register_08;
  wire [7:0] register_10;
  wire [7:0] register_11;

  integer row;
  integer column;
  integer hits;
  integer gaps;
  integer crossings;

  recovered_register_08 dut08 (
    .clk(clk), .rst_n(rst_n), .enable(enable),
    .serial_in(serial_in), .register_03(register_03),
    .register_04(register_04), .register_16(register_16),
    .register_08(register_08)
  );

  recovered_register_10 dut10 (
    .clk(clk), .rst_n(rst_n), .enable(enable),
    .serial_in(serial_in), .register_03(register_03),
    .register_04(register_04), .register_16(register_16),
    .register_10(register_10)
  );

  recovered_register_11 dut11 (
    .clk(clk), .rst_n(rst_n), .enable(enable),
    .serial_in(serial_in), .register_03(register_03),
    .register_04(register_04), .register_16(register_16),
    .register_11(register_11)
  );

  initial begin
    gaps = 0;
    crossings = 0;
    $display("All region selectors:");
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

        hits = 0;
        if (dut08.net_1189) hits = hits + 1;  // A
        if (dut08.net_1323) hits = hits + 1;  // B
        if (!dut08.net_1220) hits = hits + 1; // C
        if (dut10.net_1131) hits = hits + 1;  // D
        if (!dut10.net_767) hits = hits + 1;  // E
        if (dut10.net_776) hits = hits + 1;   // F
        if (dut10.net_979) hits = hits + 1;   // G
        if (dut11.net_583) hits = hits + 1;   // H
        if (dut11.net_678) hits = hits + 1;   // I
        if (!dut11.net_684) hits = hits + 1;  // J
        if (!dut11.net_638) hits = hits + 1;  // K

        if (hits == 0) begin
          gaps = gaps + 1;
          $write(".");
        end else if (hits > 1) begin
          crossings = crossings + 1;
          $write("X");
        end else if (dut08.net_1189) begin
          $write("A");
        end else if (dut08.net_1323) begin
          $write("B");
        end else if (!dut08.net_1220) begin
          $write("C");
        end else if (dut10.net_1131) begin
          $write("D");
        end else if (!dut10.net_767) begin
          $write("E");
        end else if (dut10.net_776) begin
          $write("F");
        end else if (dut10.net_979) begin
          $write("G");
        end else if (dut11.net_583) begin
          $write("H");
        end else if (dut11.net_678) begin
          $write("I");
        end else if (!dut11.net_684) begin
          $write("J");
        end else begin
          $write("K");
        end
      end

      $write("\n");
    end

    $display("gaps=%0d crossings=%0d", gaps, crossings);
    $finish;
  end
endmodule
