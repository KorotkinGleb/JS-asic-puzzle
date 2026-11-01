`timescale 1ns / 1ps

// Probe the result-message decoder independently of the input-processing
// pipeline.  These hierarchical forces expose the recovered state boundary;
// they are intended for reverse-engineering, not for synthesis.
module tb_probe_output_generator;
  reg clk = 1'b0;
  reg rst_n = 1'b1;
  reg enable = 1'b0;
  reg I = 1'b0;
  wire [7:0] O;
  wire success;
  integer mode;
  integer index;

  puzzle dut (
      .clk(clk), .rst_n(rst_n), .enable(enable), .I(I),
      .O(O), .success(success)
  );

  task force_result_mode;
    input integer selected_mode;
    begin
      // group_09 = {success/u_228, alternate/u_227, done/u_226}
      force dut.net_2329 = 1'b1;
      force dut.net_2403 = (selected_mode == 1);
      force dut.net_2380 = (selected_mode == 2);
    end
  endtask

  task force_character_index;
    input [3:0] logical_index;
    begin
      // Physical group_02 order is scrambled.  The recovered logical counter
      // is {u_237.Q, u_234.Q, u_236.Q, u_235.Q}.
      force dut.net_848 = logical_index[3];
      force dut.net_751 = logical_index[2];
      force dut.net_749 = logical_index[1];
      force dut.net_762 = logical_index[0];
    end
  endtask

  initial begin
    force dut.net_806 = 1'b0;
    // The complete O cone also has group_07 and group_12 on its structural
    // boundary.  Hold them known while probing the result/index decode.
    force dut.net_433 = 1'b0;
    force dut.net_342 = 1'b1;
    force dut.net_338 = 1'b1;
    force dut.net_603 = 1'b0;
    force dut.net_534 = 1'b0;
    force dut.net_415 = 1'b0;
    force dut.net_339 = 1'b1;
    force dut.net_484 = 1'b0;
    force dut.net_1950 = 1'b0;
    force dut.net_1812 = 1'b0;
    force dut.net_1715 = 1'b0;
    force dut.net_1763 = 1'b0;
    force dut.net_1806 = 1'b0;
    force dut.net_1813 = 1'b0;
    force dut.net_1675 = 1'b0;
    force dut.net_1740 = 1'b0;
    for (mode = 0; mode < 3; mode = mode + 1) begin
      force_result_mode(mode);
      $write("mode %0d: ", mode);
      for (index = 0; index < 16; index = index + 1) begin
        force_character_index(index[3:0]);
        #1;
        if (^O === 1'bx)
          $write("<xx>");
        else if (O == 8'h00)
          $write("<00>");
        else
          $write("%c", O);
      end
      $write("\n");
    end
    $finish;
  end
endmodule
