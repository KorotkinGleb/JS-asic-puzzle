`timescale 1ns / 1ps

module tb_recovered_register_group_02_embedded;
    reg clk;
    reg done;
    reg [3:0] reference_state;
    reg [2:0] reference_group_09;
    wire [3:0] character_index;
    wire [3:0] reference_next;
    integer state;
    integer done_value;
    integer expected_index;
    integer errors;

    recovered_character_index_counter dut (
        .clk(clk),
        .done(done),
        .character_index(character_index)
    );

    // Previously verified, direct translation of the extracted gate cone.
    recovered_register_group_02_next_state_rtl reference (
        .register_group_09_q(reference_group_09),
        .register_group_02_q(reference_state),
        .register_group_02_d(reference_next)
    );

    task rising_edge;
        begin
            #5 clk = 1'b1;
            #1;
            #4 clk = 1'b0;
        end
    endtask

    initial begin
        clk = 1'b0;
        done = 1'b0;
        reference_state = 4'd0;
        reference_group_09 = 3'd0;
        errors = 0;

        // Exhaustively compare the new internal next-state expression against
        // the recovered group-02 equations for both values of done.
        for (done_value = 0; done_value < 2; done_value = done_value + 1) begin
            done = done_value[0];
            reference_group_09 = {2'b00, done_value[0]};
            for (state = 0; state < 16; state = state + 1) begin
                reference_state = state[3:0];
                dut.physical_state = state[3:0];
                #1;
                if (dut.physical_next !== reference_next) begin
                    $display(
                        "MISMATCH done=%b physical_q=%b new_d=%b recovered_d=%b",
                        done, state[3:0], dut.physical_next, reference_next
                    );
                    errors = errors + 1;
                end
            end
        end

        // Exercise the actual clocked representation.  done=0 synchronously
        // establishes state zero because the physical FFs have no reset pins.
        done = 1'b0;
        rising_edge;
        if (character_index !== 4'd0) begin
            $display("MISMATCH clear: expected 0, got %0d", character_index);
            errors = errors + 1;
        end

        done = 1'b1;
        for (expected_index = 1; expected_index <= 15; expected_index = expected_index + 1) begin
            rising_edge;
            if (character_index !== expected_index[3:0]) begin
                $display(
                    "MISMATCH count: expected %0d, got %0d",
                    expected_index, character_index
                );
                errors = errors + 1;
            end
        end

        // The recovered counter saturates rather than wrapping.
        repeat (3) begin
            rising_edge;
            if (character_index !== 4'd15) begin
                $display("MISMATCH saturation: expected 15, got %0d", character_index);
                errors = errors + 1;
            end
        end

        if (errors == 0)
            $display("PASS: embedded group-02 state matches all recovered equations");
        else
            $fatal(1, "FAIL: %0d error(s)", errors);
        $finish;
    end
endmodule

