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

// Verilog module for tanh activation function LUT with Q1.7
module tanh_1_7_lut(
    input wire signed [7:0] index,
    output reg signed [7:0] value
);
always @(*) begin
    case(index)
        8'd0: value = 0x81;
        8'd1: value = 0x81;
        8'd2: value = 0x81;
        8'd3: value = 0x81;
        8'd4: value = 0x81;
        8'd5: value = 0x81;
        8'd6: value = 0x81;
        8'd7: value = 0x81;
        8'd8: value = 0x81;
        8'd9: value = 0x81;
        8'd10: value = 0x81;
        8'd11: value = 0x81;
        8'd12: value = 0x81;
        8'd13: value = 0x81;
        8'd14: value = 0x81;
        8'd15: value = 0x81;
        8'd16: value = 0x81;
        8'd17: value = 0x81;
        8'd18: value = 0x81;
        8'd19: value = 0x81;
        8'd20: value = 0x81;
        8'd21: value = 0x81;
        8'd22: value = 0x81;
        8'd23: value = 0x81;
        8'd24: value = 0x81;
        8'd25: value = 0x81;
        8'd26: value = 0x82;
        8'd27: value = 0x82;
        8'd28: value = 0x82;
        8'd29: value = 0x83;
        8'd30: value = 0x83;
        8'd31: value = 0x84;
        8'd32: value = 0x85;
        8'd33: value = 0x86;
        8'd34: value = 0x88;
        8'd35: value = 0x8A;
        8'd36: value = 0x8D;
        8'd37: value = 0x90;
        8'd38: value = 0x94;
        8'd39: value = 0x99;
        8'd40: value = 0x9F;
        8'd41: value = 0xA6;
        8'd42: value = 0xAF;
        8'd43: value = 0xBA;
        8'd44: value = 0xC5;
        8'd45: value = 0xD3;
        8'd46: value = 0xE1;
        8'd47: value = 0xF1;
        8'd48: value = 0x0;
        8'd49: value = 0xF;
        8'd50: value = 0x1F;
        8'd51: value = 0x2D;
        8'd52: value = 0x3B;
        8'd53: value = 0x46;
        8'd54: value = 0x51;
        8'd55: value = 0x5A;
        8'd56: value = 0x61;
        8'd57: value = 0x67;
        8'd58: value = 0x6C;
        8'd59: value = 0x70;
        8'd60: value = 0x73;
        8'd61: value = 0x76;
        8'd62: value = 0x78;
        8'd63: value = 0x7A;
        8'd64: value = 0x7B;
        8'd65: value = 0x7C;
        8'd66: value = 0x7D;
        8'd67: value = 0x7D;
        8'd68: value = 0x7E;
        8'd69: value = 0x7E;
        8'd70: value = 0x7E;
        8'd71: value = 0x7F;
        8'd72: value = 0x7F;
        8'd73: value = 0x7F;
        8'd74: value = 0x7F;
        8'd75: value = 0x7F;
        8'd76: value = 0x7F;
        8'd77: value = 0x7F;
        8'd78: value = 0x7F;
        8'd79: value = 0x7F;
        8'd80: value = 0x7F;
        8'd81: value = 0x7F;
        8'd82: value = 0x7F;
        8'd83: value = 0x7F;
        8'd84: value = 0x7F;
        8'd85: value = 0x7F;
        8'd86: value = 0x7F;
        8'd87: value = 0x7F;
        8'd88: value = 0x7F;
        8'd89: value = 0x7F;
        8'd90: value = 0x7F;
        8'd91: value = 0x7F;
        8'd92: value = 0x7F;
        8'd93: value = 0x7F;
        8'd94: value = 0x7F;
        8'd95: value = 0x7F;
        default: value = 0;
    endcase
end
endmodule
