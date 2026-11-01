`timescale 1ns/1ps

// Exhaustive state-space test for recovered_output_logic.
//
// For every possible register_09, register_07, and initial register_12
// state, the test visits all 16 output-character indices.  register_12 is
// advanced between indices with the recovered output-mode transformation.
//
// Full run:
//   iverilog -g2012 -o soft/tests/tb_output_logic_exhaustive.out \
//     soft/tests/tb_output_logic_exhaustive.v \
//     soft/output/recovered_output_logic.v
//   vvp soft/tests/tb_output_logic_exhaustive.out
//
// Optional short run:
//   vvp soft/tests/tb_output_logic_exhaustive.out \
//     +MAX_REGISTER_09=2 +MAX_REGISTER_07=8 +MAX_REGISTER_12=16
//
// Add +PRINT_MATCHES or +PRINT_HISTOGRAM for detailed terminal output.
// Add +LOG_ALL to write every 15-byte sequence to:
//   soft/tests/exhaustive_output_sequences.csv
module tb_output_logic_exhaustive;

    reg  [3:0] register_02;
    reg  [7:0] register_07;
    reg  [2:0] register_09;
    reg  [7:0] register_12;
    wire       net_806;
    wire       success;
    wire [7:0] O;

    integer state_09;
    integer state_07;
    integer state_12;
    integer output_index;
    integer byte_value;
    integer errors;
    integer evaluations;
    integer message_matches;
    integer unique_output_bytes;
    integer first_match_09;
    integer first_match_07;
    integer first_match_12;
    integer csv_file;
    integer max_register_09;
    integer max_register_07;
    integer max_register_12;
    integer output_count [0:255];
    reg     sequence_matches;
    reg     log_all;
    reg     print_matches;
    reg     print_histogram;

    // net_806 has no recognized driver in the extracted GDS.  This is the
    // relation inferred for the physical output-index decoder and used by the
    // existing focused output test.  To investigate net_806 independently,
    // change this wire into a reg and add a two-value outer loop.
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

    // Convert a normal binary character index into the physical FF ordering
    // used by recovered register_02.
    function [3:0] physical_index;
        input [3:0] logical_index;
        begin
            physical_index[3] = logical_index[3];
            physical_index[0] = logical_index[2];
            physical_index[2] = logical_index[1];
            physical_index[1] = logical_index[0];
        end
    endfunction

    // Recovered register_12 state transition used during output mode.
    // Every right-hand side uses the old state, just as parallel FFs do.
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

    function [7:0] known_message_byte;
        input integer index;
        begin
            case (index)
                 0: known_message_byte = 8'h28; // (
                 1: known_message_byte = 8'h2a; // *
                 2: known_message_byte = 8'h20; // space
                 3: known_message_byte = 8'h54; // T
                 4: known_message_byte = 8'h57; // W
                 5: known_message_byte = 8'h4f; // O
                 6: known_message_byte = 8'h20; // space
                 7: known_message_byte = 8'h53; // S
                 8: known_message_byte = 8'h54; // T
                 9: known_message_byte = 8'h41; // A
                10: known_message_byte = 8'h52; // R
                11: known_message_byte = 8'h53; // S
                12: known_message_byte = 8'h20; // space
                13: known_message_byte = 8'h2a; // *
                14: known_message_byte = 8'h29; // )
                default: known_message_byte = 8'h00;
            endcase
        end
    endfunction

    initial begin
        errors = 0;
        evaluations = 0;
        message_matches = 0;
        log_all = $test$plusargs("LOG_ALL");
        print_matches = $test$plusargs("PRINT_MATCHES");
        print_histogram = $test$plusargs("PRINT_HISTOGRAM");

        max_register_09 = 8;
        max_register_07 = 256;
        max_register_12 = 256;
        if ($value$plusargs("MAX_REGISTER_09=%d", max_register_09)) begin end
        if ($value$plusargs("MAX_REGISTER_07=%d", max_register_07)) begin end
        if ($value$plusargs("MAX_REGISTER_12=%d", max_register_12)) begin end

        if (max_register_09 < 1 || max_register_09 > 8)
            $fatal(1, "MAX_REGISTER_09 must be in 1..8");
        if (max_register_07 < 1 || max_register_07 > 256)
            $fatal(1, "MAX_REGISTER_07 must be in 1..256");
        if (max_register_12 < 1 || max_register_12 > 256)
            $fatal(1, "MAX_REGISTER_12 must be in 1..256");

        for (byte_value = 0; byte_value < 256; byte_value = byte_value + 1)
            output_count[byte_value] = 0;

        if (log_all) begin
            csv_file = $fopen("soft/tests/exhaustive_output_sequences.csv", "w");
            if (csv_file == 0)
                $fatal(1, "could not create exhaustive_output_sequences.csv");
            $fwrite(csv_file,
                "register_09,register_07,initial_register_12,success,O_0_to_O_14_hex\n");
        end

        for (state_09 = 0; state_09 < max_register_09;
             state_09 = state_09 + 1) begin
            for (state_07 = 0; state_07 < max_register_07;
                 state_07 = state_07 + 1) begin
                for (state_12 = 0; state_12 < max_register_12;
                     state_12 = state_12 + 1) begin

                    register_09 = state_09[2:0];
                    register_07 = state_07[7:0];
                    register_12 = state_12[7:0];
                    sequence_matches = 1'b1;

                    if (log_all)
                        $fwrite(csv_file, "%01x,%02x,%02x,%b,",
                            register_09, register_07, register_12,
                            register_09[2]);

                    // Indices 0..14 carry output bytes.  Index 15 must gate O
                    // to zero and is checked as well, but is not part of CSV's
                    // 15-byte message field.
                    for (output_index = 0; output_index < 16;
                         output_index = output_index + 1) begin
                        register_02 = physical_index(output_index[3:0]);
                        #1;
                        evaluations = evaluations + 1;

                        if ((success !== 1'b0) && (success !== 1'b1)) begin
                            $display("ERROR: success is unknown: r09=%x r07=%02x r12=%02x index=%0d",
                                register_09, register_07, register_12,
                                output_index);
                            errors = errors + 1;
                        end else if (success !== register_09[2]) begin
                            $display("ERROR: success mismatch: r09=%x r07=%02x r12=%02x index=%0d got=%b expected=%b",
                                register_09, register_07, register_12,
                                output_index, success, register_09[2]);
                            errors = errors + 1;
                        end

                        if ((^O) === 1'bx) begin
                            $display("ERROR: O contains X/Z: r09=%x r07=%02x r12=%02x index=%0d O=%b",
                                register_09, register_07, register_12,
                                output_index, O);
                            errors = errors + 1;
                            sequence_matches = 1'b0;
                        end else begin
                            output_count[O] = output_count[O] + 1;

                            // O is disabled unless register_09[0] enables
                            // output mode, and index 15 is always disabled.
                            if ((!register_09[0] || output_index == 15) &&
                                O !== 8'h00) begin
                                $display("ERROR: O not gated: r09=%x r07=%02x r12=%02x index=%0d O=%02x",
                                    register_09, register_07, register_12,
                                    output_index, O);
                                errors = errors + 1;
                            end

                            if (output_index < 15) begin
                                if (O !== known_message_byte(output_index))
                                    sequence_matches = 1'b0;
                                if (log_all)
                                    $fwrite(csv_file, "%02x", O);
                            end
                        end

                        if (output_index < 15)
                            register_12 = next_register_12(register_12);
                    end

                    if (sequence_matches && success === 1'b1) begin
                        if (message_matches == 0) begin
                            first_match_09 = state_09;
                            first_match_07 = state_07;
                            first_match_12 = state_12;
                        end
                        message_matches = message_matches + 1;
                        if (print_matches)
                            $display("MATCH: register_09=%03b register_07=%02x initial_register_12=%02x -> (* TWO STARS *)",
                                state_09[2:0], state_07[7:0], state_12[7:0]);
                    end

                    if (log_all)
                        $fwrite(csv_file, "\n");
                end
            end
        end

        if (log_all)
            $fclose(csv_file);

        $display("");
        $display("Evaluated %0d decoder states.", evaluations);
        $display("Known successful-message states: %0d", message_matches);
        if (message_matches != 0)
            $display("First match: register_09=%03b register_07=%02x initial_register_12=%02x",
                first_match_09[2:0], first_match_07[7:0],
                first_match_12[7:0]);

        unique_output_bytes = 0;
        for (byte_value = 0; byte_value < 256; byte_value = byte_value + 1) begin
            if (output_count[byte_value] != 0) begin
                unique_output_bytes = unique_output_bytes + 1;
                if (print_histogram)
                    $display("  O=0x%02x count=%0d", byte_value[7:0],
                        output_count[byte_value]);
            end
        end
        $display("Unique O byte values observed: %0d", unique_output_bytes);

        if (errors == 0)
            $display("PASS: every evaluated success/O output was defined and satisfied decoder invariants.");
        else
            $fatal(1, "FAIL: %0d output error(s)", errors);

        $finish;
    end

endmodule
