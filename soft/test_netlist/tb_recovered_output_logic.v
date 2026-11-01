`timescale 1ns/1ps

module tb_recovered_output_logic_netlist;
  reg  [3:0] register_02;
  reg  [7:0] register_07;
  reg  [2:0] register_09;
  reg  [7:0] register_12;
  wire       net_806;
  wire       success;
  wire [7:0] O;
  integer i;
  integer errors;

  // Inferred missing connection in the physical output-index decoder.
  assign net_806 = ~register_02[3];

  recovered_output_logic dut (
      .net_806(net_806),
      .register_02(register_02),
      .register_07(register_07),
      .register_09(register_09),
      .register_12(register_12),
      .success(success),
      .O(O)
  );

  function [3:0] physical_index;
    input [3:0] logical_index;
    begin
      physical_index[3] = logical_index[3];
      physical_index[0] = logical_index[2];
      physical_index[2] = logical_index[1];
      physical_index[1] = logical_index[0];
    end
  endfunction

  function [7:0] register_12_state;
    input integer index;
    begin
      case (index)
         0: register_12_state = 8'h74;
         1: register_12_state = 8'hd1;
         2: register_12_state = 8'hcf;
         3: register_12_state = 8'hdd;
         4: register_12_state = 8'h14;
         5: register_12_state = 8'h39;
         6: register_12_state = 8'h3a;
         7: register_12_state = 8'hb5;
         8: register_12_state = 8'h72;
         9: register_12_state = 8'h21;
        10: register_12_state = 8'hd8;
        11: register_12_state = 8'h6b;
        12: register_12_state = 8'he9;
        13: register_12_state = 8'hdf;
        14: register_12_state = 8'hb1;
        default: register_12_state = 8'h27;
      endcase
    end
  endfunction

  function [7:0] expected_output;
    input integer index;
    begin
      case (index)
         0: expected_output = 8'h28;
         1: expected_output = 8'h2a;
         2: expected_output = 8'h20;
         3: expected_output = 8'h54;
         4: expected_output = 8'h57;
         5: expected_output = 8'h4f;
         6: expected_output = 8'h20;
         7: expected_output = 8'h53;
         8: expected_output = 8'h54;
         9: expected_output = 8'h41;
        10: expected_output = 8'h52;
        11: expected_output = 8'h53;
        12: expected_output = 8'h20;
        13: expected_output = 8'h2a;
        14: expected_output = 8'h29;
        default: expected_output = 8'h00;
      endcase
    end
  endfunction

  initial begin
    register_07 = 8'h46;
    register_09 = 3'b101;
    errors = 0;
    $dumpfile("./test_netlist/recovered_output_logic.vcd");
    $dumpvars(0, tb_recovered_output_logic_netlist);

    $write("Decoded text: \"");
    for (i = 0; i < 16; i = i + 1) begin
      register_02 = physical_index(i[3:0]);
      register_12 = register_12_state(i);
      #1;
      if (success !== 1'b1 || O !== expected_output(i)) begin
        $display("\nERROR index=%0d success=%b expected=%02x actual=%02x",
                 i, success, expected_output(i), O);
        errors = errors + 1;
      end
      if (i < 15)
        $write("%c", O);
    end
    $display("\"");

    if (errors == 0)
      $display("PASS: structural output logic emitted '(* TWO STARS *)'");
    else
      $fatal(1, "FAIL: %0d output mismatch(es)", errors);
    $finish;
  end
endmodule
