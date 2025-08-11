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

// Verilog translation of the C++ Neuron structure from neuralnet.hpp
// This version is for a non-trainable neuron with Q-format weights using the q_format module.

`include "q_format.v"

module neuron #(
    parameter FIXED_BITS = 8,
    parameter FRACTIONAL_BITS = 8,
    parameter NUM_OUTPUTS = 1
)(
    input  wire clk,
    input  wire rst_n,
    input  wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] input_value,
    input  wire [NUM_OUTPUTS-1:0] set_weight_en, // One-hot: set enable for each connection
    input  wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] set_weight_val [NUM_OUTPUTS-1:0],
    output wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] output_value,
    output wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] weights [NUM_OUTPUTS-1:0]
);

    // Storage for output value
    reg signed [FIXED_BITS+FRACTIONAL_BITS-1:0] output_value_reg;

    // Array of connections (weights)
    genvar i;
    generate
        for (i = 0; i < NUM_OUTPUTS; i = i + 1) begin : conn
            // Each connection is a q_format register
            reg signed [FIXED_BITS+FRACTIONAL_BITS-1:0] weight_reg = 0;
            assign weights[i] = weight_reg;

            always @(posedge clk or negedge rst_n) begin
                if (!rst_n) begin
                    weight_reg <= 0;
                end else if (set_weight_en[i]) begin
                    weight_reg <= set_weight_val[i];
                end
            end
        end
    endgenerate

    // Compute output value as sum of input_value * weight for each connection
    integer j;
    reg signed [FIXED_BITS+FRACTIONAL_BITS-1:0] sum;
    always @(*) begin
        sum = 0;
        for (j = 0; j < NUM_OUTPUTS; j = j + 1) begin
            // Use q_format multiplication for each connection
            sum = sum + (input_value * weights[j]) >>> FRACTIONAL_BITS;
        end
        output_value_reg = sum;
    end

    assign output_value = output_value_reg;

endmodule