`timescale 1ns/1ps

// Standalone test for the recovered output decoder.
//
// register_02 is the recovered output-character counter. register_12 is
// driven here with the recovered output-mode transition so this test remains
// focused on the decoder and does not need to replay the complete input phase.
module guess;

    reg         clk;
    reg  [2:0]  register_09;
    reg  [7:0]  register_07;
    reg  [7:0]  register_12;
    wire        net_806;

    wire [3:0]  register_02;
    wire [3:0]  output_index;
    wire [7:0]  O;
    wire        success;
    integer i;
    integer candidate;
    reg     match;
    // The recovered register bits are in physical FF order. This permutation
    // converts register_02 to the ordinary binary character index.
    assign output_index = {
        register_02[3],
        register_02[0],
        register_02[2],
        register_02[1]
    };

    // Recovered missing connection in the output-index decoder.
    assign net_806 = ~register_02[3];

    recovered_register_02 dut_register_02 (
        .clk(clk),
        .register_09(register_09),
        .register_02(register_02)
    );

    recovered_output_logic dut_output_logic (
        .net_806(net_806),
        .register_02(register_02),
        .register_07(register_07),
        .register_09(register_09),
        .register_12(register_12),
        .success(success),
        .O(O)
    );

    always #5 clk = ~clk;

    // Physical register_12 update during output mode. All right-hand sides
    // use the old value, matching simultaneous flip-flop updates.
    function [7:0] next_register_12;
        input [7:0] q;
        begin
            next_register_12[7] = q[3] ^ q[1] ^ q[5] ^ q[7];
            next_register_12[6] = q[2] ^ q[4] ^ q[5];
            next_register_12[5] = q[4] ^ q[5] ^ q[1] ^ q[0];
            next_register_12[4] = q[5] ^ q[7] ^ q[6] ^ q[2];
            next_register_12[3] = q[4] ^ q[0] ^ q[6] ^ q[3];
            next_register_12[2] = q[4] ^ q[2] ^ q[3] ^ q[1];
            next_register_12[1] = q[3] ^ q[5] ^ q[7] ^ q[6] ^ q[0];
            next_register_12[0] = q[2] ^ q[1] ^ q[7];
        end
    endfunction

    function [7:0] expected_output;
        input integer index;
        begin
            case (index)
                 0: expected_output = 8'h28; // (
                 1: expected_output = 8'h2a; // *
                 2: expected_output = 8'h20; // space
                 3: expected_output = 8'h54; // T
                 4: expected_output = 8'h57; // W
                 5: expected_output = 8'h4f; // O
                 6: expected_output = 8'h20; // space
                 7: expected_output = 8'h53; // S
                 8: expected_output = 8'h54; // T
                 9: expected_output = 8'h41; // A
                10: expected_output = 8'h52; // R
                11: expected_output = 8'h53; // S
                12: expected_output = 8'h20; // space
                13: expected_output = 8'h2a; // *
                14: expected_output = 8'h29; // )
                default: expected_output = 8'h00;
            endcase
        end
    endfunction

    initial begin
        clk = 0;
        register_09 = 0;
        register_07 = 0;
        register_12 = 8'h74;

        // The first clock with register_09[0] low initializes register_02.
        @(negedge clk);

        // candidate is an integer so 255 + 1 becomes 256 instead of wrapping
        // back to zero as it would in an 8-bit register.
        for (candidate = 0; candidate < 256; candidate = candidate + 1) begin
            // Restart the physical output counter for this candidate.
            register_09 = 3'b000;
            register_07 = candidate[7:0];
            @(posedge clk);
            @(negedge clk);

            register_09 = 3'b101;
            match = 1'b1;
            //$write("initial register_12=%02x: \"", candidate[7:0]);
            register_12 = 8'h74;
            // Indices 0..14 contain characters. Index 15 disables O.
            for (i = 0; i < 15; i = i + 1) begin
                #1;
                
                if (O !== expected_output(i))
                    match = 1'b0;

                if ((O >= 8'h20) && (O <= 8'h7e))
                    $write("%c", O);
                else
                    $write(".");

                @(posedge clk);
                register_12 = next_register_12(register_12);
                @(negedge clk);
            end

            $write(" ");
            if (match)
                $write("  <-- MATCH");
            $display("");
        end

        $finish;
    end
endmodule
