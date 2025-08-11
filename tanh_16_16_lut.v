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

// Verilog module for tanh activation function LUT with Q16.16
module tanh_16_16_lut(
    input wire signed [31:0] index,
    output reg signed [31:0] value
);
always @(*) begin
    case(index)
        32'd0: value = 0xFFFF0001;
        32'd1: value = 0xFFFF0002;
        32'd2: value = 0xFFFF0002;
        32'd3: value = 0xFFFF0002;
        32'd4: value = 0xFFFF0003;
        32'd5: value = 0xFFFF0003;
        32'd6: value = 0xFFFF0004;
        32'd7: value = 0xFFFF0005;
        32'd8: value = 0xFFFF0006;
        32'd9: value = 0xFFFF0008;
        32'd10: value = 0xFFFF000A;
        32'd11: value = 0xFFFF000D;
        32'd12: value = 0xFFFF0011;
        32'd13: value = 0xFFFF0015;
        32'd14: value = 0xFFFF001B;
        32'd15: value = 0xFFFF0023;
        32'd16: value = 0xFFFF002C;
        32'd17: value = 0xFFFF0039;
        32'd18: value = 0xFFFF0049;
        32'd19: value = 0xFFFF005E;
        32'd20: value = 0xFFFF0078;
        32'd21: value = 0xFFFF009A;
        32'd22: value = 0xFFFF00C5;
        32'd23: value = 0xFFFF00FD;
        32'd24: value = 0xFFFF0145;
        32'd25: value = 0xFFFF01A0;
        32'd26: value = 0xFFFF0216;
        32'd27: value = 0xFFFF02AD;
        32'd28: value = 0xFFFF036E;
        32'd29: value = 0xFFFF0465;
        32'd30: value = 0xFFFF05A1;
        32'd31: value = 0xFFFF0734;
        32'd32: value = 0xFFFF0936;
        32'd33: value = 0xFFFF0BC4;
        32'd34: value = 0xFFFF0F03;
        32'd35: value = 0xFFFF131D;
        32'd36: value = 0xFFFF1849;
        32'd37: value = 0xFFFF1EC4;
        32'd38: value = 0xFFFF26D7;
        32'd39: value = 0xFFFF30D2;
        32'd40: value = 0xFFFF3D09;
        32'd41: value = 0xFFFF4BCD;
        32'd42: value = 0xFFFF5D67;
        32'd43: value = 0xFFFF7206;
        32'd44: value = 0xFFFF89B3;
        32'd45: value = 0xFFFFA443;
        32'd46: value = 0xFFFFC14E;
        32'd47: value = 0xFFFFE02B;
        32'd48: value = 0x0;
        32'd49: value = 0x1FD5;
        32'd50: value = 0x3EB2;
        32'd51: value = 0x5BBD;
        32'd52: value = 0x764D;
        32'd53: value = 0x8DFA;
        32'd54: value = 0xA299;
        32'd55: value = 0xB433;
        32'd56: value = 0xC2F7;
        32'd57: value = 0xCF2E;
        32'd58: value = 0xD929;
        32'd59: value = 0xE13C;
        32'd60: value = 0xE7B7;
        32'd61: value = 0xECE3;
        32'd62: value = 0xF0FD;
        32'd63: value = 0xF43C;
        32'd64: value = 0xF6CA;
        32'd65: value = 0xF8CC;
        32'd66: value = 0xFA5F;
        32'd67: value = 0xFB9B;
        32'd68: value = 0xFC92;
        32'd69: value = 0xFD53;
        32'd70: value = 0xFDEA;
        32'd71: value = 0xFE60;
        32'd72: value = 0xFEBB;
        32'd73: value = 0xFF03;
        32'd74: value = 0xFF3B;
        32'd75: value = 0xFF66;
        32'd76: value = 0xFF88;
        32'd77: value = 0xFFA2;
        32'd78: value = 0xFFB7;
        32'd79: value = 0xFFC7;
        32'd80: value = 0xFFD4;
        32'd81: value = 0xFFDD;
        32'd82: value = 0xFFE5;
        32'd83: value = 0xFFEB;
        32'd84: value = 0xFFEF;
        32'd85: value = 0xFFF3;
        32'd86: value = 0xFFF6;
        32'd87: value = 0xFFF8;
        32'd88: value = 0xFFFA;
        32'd89: value = 0xFFFB;
        32'd90: value = 0xFFFC;
        32'd91: value = 0xFFFD;
        32'd92: value = 0xFFFD;
        32'd93: value = 0xFFFE;
        32'd94: value = 0xFFFE;
        32'd95: value = 0xFFFE;
        default: value = 0;
    endcase
end
endmodule
