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

// Verilog module for tanh activation function LUT with Q8.8
module tanh_8_8_lut(
    input wire signed [15:0] index,
    output reg signed [15:0] value
);
always @(*) begin
    case(index)
        16'd0: value = 0xFF01;
        16'd1: value = 0xFF01;
        16'd2: value = 0xFF01;
        16'd3: value = 0xFF01;
        16'd4: value = 0xFF01;
        16'd5: value = 0xFF01;
        16'd6: value = 0xFF01;
        16'd7: value = 0xFF01;
        16'd8: value = 0xFF01;
        16'd9: value = 0xFF01;
        16'd10: value = 0xFF01;
        16'd11: value = 0xFF01;
        16'd12: value = 0xFF01;
        16'd13: value = 0xFF01;
        16'd14: value = 0xFF01;
        16'd15: value = 0xFF01;
        16'd16: value = 0xFF01;
        16'd17: value = 0xFF01;
        16'd18: value = 0xFF01;
        16'd19: value = 0xFF01;
        16'd20: value = 0xFF01;
        16'd21: value = 0xFF01;
        16'd22: value = 0xFF01;
        16'd23: value = 0xFF01;
        16'd24: value = 0xFF02;
        16'd25: value = 0xFF02;
        16'd26: value = 0xFF03;
        16'd27: value = 0xFF03;
        16'd28: value = 0xFF04;
        16'd29: value = 0xFF05;
        16'd30: value = 0xFF06;
        16'd31: value = 0xFF08;
        16'd32: value = 0xFF0A;
        16'd33: value = 0xFF0C;
        16'd34: value = 0xFF10;
        16'd35: value = 0xFF14;
        16'd36: value = 0xFF19;
        16'd37: value = 0xFF1F;
        16'd38: value = 0xFF27;
        16'd39: value = 0xFF31;
        16'd40: value = 0xFF3E;
        16'd41: value = 0xFF4C;
        16'd42: value = 0xFF5E;
        16'd43: value = 0xFF73;
        16'd44: value = 0xFF8A;
        16'd45: value = 0xFFA5;
        16'd46: value = 0xFFC2;
        16'd47: value = 0xFFE1;
        16'd48: value = 0x0;
        16'd49: value = 0x1F;
        16'd50: value = 0x3E;
        16'd51: value = 0x5B;
        16'd52: value = 0x76;
        16'd53: value = 0x8D;
        16'd54: value = 0xA2;
        16'd55: value = 0xB4;
        16'd56: value = 0xC2;
        16'd57: value = 0xCF;
        16'd58: value = 0xD9;
        16'd59: value = 0xE1;
        16'd60: value = 0xE7;
        16'd61: value = 0xEC;
        16'd62: value = 0xF0;
        16'd63: value = 0xF4;
        16'd64: value = 0xF6;
        16'd65: value = 0xF8;
        16'd66: value = 0xFA;
        16'd67: value = 0xFB;
        16'd68: value = 0xFC;
        16'd69: value = 0xFD;
        16'd70: value = 0xFD;
        16'd71: value = 0xFE;
        16'd72: value = 0xFE;
        16'd73: value = 0xFF;
        16'd74: value = 0xFF;
        16'd75: value = 0xFF;
        16'd76: value = 0xFF;
        16'd77: value = 0xFF;
        16'd78: value = 0xFF;
        16'd79: value = 0xFF;
        16'd80: value = 0xFF;
        16'd81: value = 0xFF;
        16'd82: value = 0xFF;
        16'd83: value = 0xFF;
        16'd84: value = 0xFF;
        16'd85: value = 0xFF;
        16'd86: value = 0xFF;
        16'd87: value = 0xFF;
        16'd88: value = 0xFF;
        16'd89: value = 0xFF;
        16'd90: value = 0xFF;
        16'd91: value = 0xFF;
        16'd92: value = 0xFF;
        16'd93: value = 0xFF;
        16'd94: value = 0xFF;
        16'd95: value = 0xFF;
        default: value = 0;
    endcase
end
endmodule
