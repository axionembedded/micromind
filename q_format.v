// MIT License

// Copyright (c) 2025 Axion Embedded

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

// Q-format fixed-point representation module
// Parameters:
//   FIXED_BITS: Number of integer (fixed) bits
//   FRACTIONAL_BITS: Number of fractional bits
//
// This module provides conversion between integer and Q-format, as well as
// basic arithmetic (addition, subtraction, multiplication, division).

module q_format #(
    parameter FIXED_BITS = 8,
    parameter FRACTIONAL_BITS = 8)
    (
    input  wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] a,
    input  wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] b,
    input  wire [1:0] op, // 00: add, 01: sub, 10: mul, 11: div
    output reg  signed [FIXED_BITS+FRACTIONAL_BITS-1:0] result
    );

    // Internal signals for multiplication and division
    wire signed [2*(FIXED_BITS+FRACTIONAL_BITS)-1:0] mul_temp;
    wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] mul_result;
    wire signed [2*(FIXED_BITS+FRACTIONAL_BITS)-1:0] div_temp;

    // Addition and subtraction are straightforward
    always @(*) begin
        case(op)
            2'b00: result = a + b; // Addition
            2'b01: result = a - b; // Subtraction
            2'b10: result = mul_result; // Multiplication
            2'b11: result = (b != 0) ? div_temp / b : 0; // Division. Divide by 0 results in 0 to match current ARM A64 architecture behavior.
            default: result = 0;
        endcase
    end

    // Multiplication: (a * b) >> FRACTIONAL_BITS
    assign mul_temp = a * b;
    assign mul_result = mul_temp >>> FRACTIONAL_BITS;

    // Division: (a << FRACTIONAL_BITS) / b. this is an arithmetic trick to ensure we maintain the fractional bits in the result.
    assign div_temp = a <<< FRACTIONAL_BITS;

endmodule