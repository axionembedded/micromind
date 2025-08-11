// test_q_format.v
`timescale 1ns/1ps

module test_q_format;

    // Parameters
    localparam FIXED_BITS = 8;
    localparam FRACTIONAL_BITS = 8;
    localparam WIDTH = FIXED_BITS + FRACTIONAL_BITS;

    // Inputs
    reg signed [WIDTH-1:0] a, b;
    reg [1:0] op;
    wire signed [WIDTH-1:0] result;

    // Instantiate the q_format module
    q_format #(
        .FIXED_BITS(FIXED_BITS),
        .FRACTIONAL_BITS(FRACTIONAL_BITS)
    ) uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );

    // Helper function to convert real to Q format
    function [WIDTH-1:0] real_to_q;
        input real val;
        real scaled;
        begin
            scaled = val * (1 << FRACTIONAL_BITS);
            real_to_q = $rtoi(scaled);
        end
    endfunction

    // Helper function to convert Q format to real
    function real q_to_real;
        input [WIDTH-1:0] val;
        begin
            q_to_real = $itor(val) / (1 << FRACTIONAL_BITS);
        end
    endfunction

    initial begin
        $display("Q-format Arithmetic Testbench");

        // Test addition: 1.5 + 2.25 = 3.75
        a = real_to_q(1.5);
        b = real_to_q(2.25);
        op = 2'b00;
        #10;
        $display("ADD: %f + %f = %f (Q: %h)", q_to_real(a), q_to_real(b), q_to_real(result), result);

        // Test subtraction: 5.5 - 2.25 = 3.25
        a = real_to_q(5.5);
        b = real_to_q(2.25);
        op = 2'b01;
        #10;
        $display("SUB: %f - %f = %f (Q: %h)", q_to_real(a), q_to_real(b), q_to_real(result), result);

        // Test multiplication: 1.5 * 2.0 = 3.0
        a = real_to_q(1.5);
        b = real_to_q(2.0);
        op = 2'b10;
        #10;
        $display("MUL: %f * %f = %f (Q: %h)", q_to_real(a), q_to_real(b), q_to_real(result), result);

        // Test division: 3.0 / 1.5 = 2.0
        a = real_to_q(3.0);
        b = real_to_q(1.5);
        op = 2'b11;
        #10;
        $display("DIV: %f / %f = %f (Q: %h)", q_to_real(a), q_to_real(b), q_to_real(result), result);

        // Test divide by zero: 3.0 / 0 = 0
        a = real_to_q(3.0);
        b = 0;
        op = 2'b11;
        #10;
        $display("DIV: %f / 0 = %f (Q: %h)", q_to_real(a), q_to_real(result), result);

        // Test negative numbers: -2.5 + 1.0 = -1.5
        a = real_to_q(-2.5);
        b = real_to_q(1.0);
        op = 2'b00;
        #10;
        $display("ADD: %f + %f = %f (Q: %h)", q_to_real(a), q_to_real(b), q_to_real(result), result);

        $display("Testbench completed.");
        $finish;
    end
endmodule