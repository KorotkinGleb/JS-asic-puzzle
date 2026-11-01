`timescale 1ns/1ps

module tb_02;
    recovered_register_02 dut (
        .clk(clk),
        .register_09(register_09),
        .register_02(register_02)
    );
    reg clk = 0;
    reg [2:0] register_09 = 3'b000;
    wire [3:0] register_02;

    always begin
        #5 clk = ~clk;
    end
    integer i;
    initial begin
        @(negedge clk);
        register_09 = 3'b001;
        for(i = 0; i < 16; i = i + 1) begin
            @(posedge clk);
            $display(register_02);

        end
        $finish;
    end

endmodule