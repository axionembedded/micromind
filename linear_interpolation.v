// linear_interpolation.v
// Simple linear interpolation in Verilog
// y = y0 + ((x - x0) * (y1 - y0)) / (x1 - x0)

module linear_interpolation #(
    parameter DATA_WIDTH = 16
)(
    input  wire [DATA_WIDTH-1:0] x0,
    input  wire [DATA_WIDTH-1:0] y0,
    input  wire [DATA_WIDTH-1:0] x1,
    input  wire [DATA_WIDTH-1:0] y1,
    input  wire [DATA_WIDTH-1:0] x,
    output wire [DATA_WIDTH-1:0] y
);

    // Intermediate signals for calculation
    wire signed [DATA_WIDTH:0] dx;
    wire signed [DATA_WIDTH:0] dy;
    wire signed [2*DATA_WIDTH-1:0] num;
    wire signed [DATA_WIDTH-1:0] denom;
    wire signed [DATA_WIDTH-1:0] frac;
    wire signed [DATA_WIDTH:0] y_temp;

    assign dx    = x1 - x0;
    assign dy    = y1 - y0;
    assign num   = (x - x0) * dy;
    assign denom = dx != 0 ? dx : 1; // Avoid division by zero
    assign frac  = num / denom;
    assign y_temp = y0 + frac;

    assign y = y_temp[DATA_WIDTH-1:0];

endmodule