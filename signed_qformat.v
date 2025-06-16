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

module signed_qformat #(parameter NUM_FIXED_BITS = 8, NUM_FRACTIONAL_BITS = 8)
    (
        input clock, reset,
        output signed [NUM_FIXED_BITS + NUM_FRACTIONAL_BITS - 1:0] qvalue
    );
    // Define the total number of bits for value and product
    // and the maximum bit indices for value and product
    // The value is represented as a signed fixed-point number
    // with NUM_FIXED_BITS for the integer part and NUM_FRACTIONAL_BITS for the fractional part
    // The product is represented as a signed fixed-point number
    // with double the total number of bits to accommodate multiplication results
    // The POW constant is used to scale the fixed-point representation
    // by 2 raised to the negative number of fixed bits, allowing for proper scaling in calculations
    localparam TOTAL_NUM_BITS = NUM_FIXED_BITS + NUM_FRACTIONAL_BITS;
    localparam MAX_VALUE_BIT = TOTAL_NUM_BITS - 1;
    localparam TOTAL_NUM_PRODUCT_BITS = (2 * TOTAL_NUM_BITS);
    localparam MAX_PRODUCT_BIT = TOTAL_NUM_PRODUCT_BITS - 1;

    reg signed [MAX_VALUE_BIT:0] value;
    reg signed [MAX_PRODUCT_BIT:0] product;
    
    localparam  POW = 2.0**(-1.0 * NUM_FIXED_BITS);

    initial begin
        $display("Signed QFormat module placeholder");
    end
endmodule