// Hierarchical structural top assembled from recovered blocks.
// Compile with recovered_output_logic.v, registers/*.v, and cells/*.v.
module recovered_block_top (
    input wire I,
    input wire clk,
    input wire enable,
    input wire rst_n,
    input wire net_806,  // unlabeled extracted input
    output wire success,
    output wire [7:0] O
);

  // Recovered register-state interconnect.
  wire [11:0] shift_register;
  wire [3:0] register_02;
  wire [3:0] register_03;
  wire [3:0] register_04;
  wire [1:0] register_05;
  wire [2:0] register_06;
  wire [7:0] register_07;
  wire [5:0] register_08;
  wire [2:0] register_09;
  wire [7:0] register_10;
  wire [7:0] register_11;
  wire [7:0] register_12;
  wire [5:0] register_13;
  wire [5:0] register_14;
  wire [7:0] register_15;
  wire register_16;
  wire register_17;

  recovered_shift_register u_shift_register (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_16(register_16),
      .shift_register(shift_register)
  );

  recovered_register_02 u_register_02 (
      .clk(clk),
      .register_09(register_09),
      .register_02(register_02)
  );

  recovered_register_03 u_register_03 (
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_16(register_16),
      .register_03(register_03)
  );

  recovered_register_04 u_register_04 (
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_16(register_16),
      .register_04(register_04)
  );

  recovered_register_05 u_register_05 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_16(register_16),
      .register_05(register_05)
  );

  recovered_register_06 u_register_06 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_16(register_16),
      .register_06(register_06)
  );

  recovered_register_07 u_register_07 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_16(register_16),
      .register_07(register_07)
  );

  recovered_register_08 u_register_08 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_04(register_04),
      .register_16(register_16),
      .register_08(register_08)
  );

  recovered_register_09 u_register_09 (
      .clk(clk),
      .rst_n(rst_n),
      .register_05(register_05),
      .register_06(register_06),
      .register_07(register_07),
      .register_08(register_08),
      .register_10(register_10),
      .register_11(register_11),
      .register_13(register_13),
      .register_14(register_14),
      .register_15(register_15),
      .register_16(register_16),
      .register_17(register_17),
      .register_09(register_09)
  );

  recovered_register_10 u_register_10 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_04(register_04),
      .register_16(register_16),
      .register_10(register_10)
  );

  recovered_register_11 u_register_11 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_04(register_04),
      .register_16(register_16),
      .register_11(register_11)
  );

  recovered_register_12 u_register_12 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_02(register_02),
      .register_09(register_09),
      .register_16(register_16),
      .register_12(register_12)
  );

  recovered_register_13 u_register_13 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_16(register_16),
      .register_13(register_13)
  );

  recovered_register_14 u_register_14 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_16(register_16),
      .register_14(register_14)
  );

  recovered_register_15 u_register_15 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_16(register_16),
      .register_15(register_15)
  );

  recovered_register_16 u_register_16 (
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_04(register_04),
      .register_16(register_16)
  );

  recovered_register_17 u_register_17 (
      .I(I),
      .clk(clk),
      .enable(enable),
      .rst_n(rst_n),
      .register_03(register_03),
      .register_16(register_16),
      .shift_register(shift_register),
      .register_17(register_17)
  );

  recovered_output_logic u_output_logic (
      .net_806(net_806),
      .register_02(register_02),
      .register_07(register_07),
      .register_09(register_09),
      .register_12(register_12),
      .success(success),
      .O(O)
  );
endmodule
