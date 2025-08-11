// Verilog translation of the C++ Gradient structure from neuralnet.hpp
// This module holds a gradient value in Q-format, with set and clear functionality.

`include "q_format.v"

module Gradient #(
    parameter FIXED_BITS = 8,
    parameter FRACTIONAL_BITS = 8
)(
    input  wire clk,
    input  wire rst_n,
    input  wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] set_gradient, // Q-format value to set
    input  wire set_en,                                              // Set enable
    input  wire clear_en,                                            // Clear enable
    output reg  signed [FIXED_BITS+FRACTIONAL_BITS-1:0] gradient     // Current gradient value
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            gradient <= 0;
        end else if (clear_en) begin
            gradient <= 0;
        end else if (set_en) begin
            gradient <= set_gradient;
        end