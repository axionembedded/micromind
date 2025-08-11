// Verilog translation of the C++ Connection<ValueType> structure from neuralnet.hpp
// Uses the q_format module for Q-format fixed-point storage of the weight value.

`include "q_format.v"

module connection #(
    parameter FIXED_BITS = 8,
    parameter FRACTIONAL_BITS = 8
)(
    input  wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] set_weight, // Q-format input to set weight
    input  wire set_en,                                             // Set enable
    output wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] weight,     // Current weight (Q-format)
    output wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] delta_weight,       // Always zero (not trainable)
    output wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] gradient,           // Always zero (not trainable)
    output wire signed [FIXED_BITS+FRACTIONAL_BITS-1:0] prev_delta_weight   // Always zero (not trainable)
);

    // Internal register for weight storage
    reg signed [FIXED_BITS+FRACTIONAL_BITS-1:0] weight_reg = 0;

    // Assign outputs
    assign weight = weight_reg;
    assign delta_weight = { (FIXED_BITS+FRACTIONAL_BITS){1'b0} };
    assign gradient = { (FIXED_BITS+FRACTIONAL_BITS){1'b0} };
    assign prev_delta_weight = { (FIXED_BITS+FRACTIONAL_BITS){1'b0} };

    // Set weight when enabled
    always @(*) begin
        if (set_en) begin
            weight_reg = set_weight;
        end
    end

endmodule