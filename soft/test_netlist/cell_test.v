`timescale 1ns/1ps

module cell_test;

    reg A1 = 0;
    reg A2 = 0;
    reg B1 = 0;
    reg B2 = 0;
    reg C1 = 0;
    wire X;

    sky130_fd_sc_hd__a221o_2 dut(
        .A1(A1),
        .A2(A2),
        .B1(B1),
        .B2(B2),
        .C1(C1),
        .X(X)
    );

    reg [5:0] input_data;
    
    initial begin
        for(input_data = 0; input_data < 32; input_data = input_data + 1) begin
            A1 = input_data[0];
            A2 = input_data[1];
            B1 = input_data[2];
            B2 = input_data[3];
            C1 = input_data[4];   
            #1;
            $display("input = %b output = %b", input_data, X);    
        end
        $finish;
    end
endmodule