`timescale 1ns / 1ps

// Exhaustively compare the recovered RTL equation against the recovered
// SKY130 structural cell cone.  The test also writes a VCD for GTKWave/Surfer.
module tb_recovered_register_group_02;
    reg  [3:0] register_group_02_q;
    reg  [2:0] register_group_09_q;
    wire [3:0] rtl_d;
    wire [3:0] structural_d;
    integer state;
    integer source_value;
    integer errors;

    recovered_register_group_02_next_state_rtl rtl (
        .register_group_09_q(register_group_09_q),
        .register_group_02_q(register_group_02_q),
        .register_group_02_d(rtl_d)
    );

    recovered_register_group_02_input_logic_grouped structural (
        .register_group_09_q(register_group_09_q),
        .register_group_02_q(register_group_02_q),
        .register_group_02_d(structural_d)
    );

    initial begin
        $dumpfile("scripts/register_groups/register_group_02_equivalence.vcd");
        $dumpvars(0, tb_recovered_register_group_02);
        errors = 0;

        // Check every current state and every value of the three-bit source
        // vector: 16 * 8 = 128 combinations.
        for (source_value = 0; source_value < 8; source_value = source_value + 1) begin
            for (state = 0; state < 16; state = state + 1) begin
                register_group_09_q = source_value[2:0];
                register_group_02_q = state[3:0];
                #1;
                if (rtl_d !== structural_d) begin
                    errors = errors + 1;
                    $display(
                        "MISMATCH group09_q=%b group02_q=%b rtl_d=%b structural_d=%b",
                        register_group_09_q,
                        register_group_02_q,
                        rtl_d,
                        structural_d
                    );
                end
            end
        end

        if (errors == 0)
            $display("PASS: all 128 group-02 combinations match");
        else
            $fatal(1, "FAIL: %0d mismatches", errors);
        $finish;
    end
endmodule

