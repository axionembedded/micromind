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

// Verilog module for tanh activation function LUT with Q32.32
module tanh_32_32_lut(
    input wire signed [63:0] index,
    output reg signed [63:0] value
);
always @(*) begin
    case(index)
        64'd0: value = 0xFFFFFFFF0000CE2B;
        64'd1: value = 0xFFFFFFFF000108B9;
        64'd2: value = 0xFFFFFFFF000153E8;
        64'd3: value = 0xFFFFFFFF0001B473;
        64'd4: value = 0xFFFFFFFF00023069;
        64'd5: value = 0xFFFFFFFF0002CF93;
        64'd6: value = 0xFFFFFFFF00039BF2;
        64'd7: value = 0xFFFFFFFF0004A25C;
        64'd8: value = 0xFFFFFFFF0005F34D;
        64'd9: value = 0xFFFFFFFF0007A3EF;
        64'd10: value = 0xFFFFFFFF0009CF6D;
        64'd11: value = 0xFFFFFFFF000C98AA;
        64'd12: value = 0xFFFFFFFF00102C70;
        64'd13: value = 0xFFFFFFFF0014C43D;
        64'd14: value = 0xFFFFFFFF001AA9E1;
        64'd15: value = 0xFFFFFFFF00223C18;
        64'd16: value = 0xFFFFFFFF002BF47C;
        64'd17: value = 0xFFFFFFFF00386F1A;
        64'd18: value = 0xFFFFFFFF0048742D;
        64'd19: value = 0xFFFFFFFF005D0497;
        64'd20: value = 0xFFFFFFFF007769CF;
        64'd21: value = 0xFFFFFFFF00994A41;
        64'd22: value = 0xFFFFFFFF00C4C352;
        64'd23: value = 0xFFFFFFFF00FC8A7D;
        64'd24: value = 0xFFFFFFFF01441778;
        64'd25: value = 0xFFFFFFFF019FD993;
        64'd26: value = 0xFFFFFFFF02157B29;
        64'd27: value = 0xFFFFFFFF02AC365B;
        64'd28: value = 0xFFFFFFFF036D3ED0;
        64'd29: value = 0xFFFFFFFF046444A7;
        64'd30: value = 0xFFFFFFFF05A0149F;
        64'd31: value = 0xFFFFFFFF07335905;
        64'd32: value = 0xFFFFFFFF09357D10;
        64'd33: value = 0xFFFFFFFF0BC3B099;
        64'd34: value = 0xFFFFFFFF0F020341;
        64'd35: value = 0xFFFFFFFF131C8281;
        64'd36: value = 0xFFFFFFFF1848343D;
        64'd37: value = 0xFFFFFFFF1EC3AD6B;
        64'd38: value = 0xFFFFFFFF26D6E225;
        64'd39: value = 0xFFFFFFFF30D1A523;
        64'd40: value = 0xFFFFFFFF3D082A58;
        64'd41: value = 0xFFFFFFFF4BCCD7A4;
        64'd42: value = 0xFFFFFFFF5D66E0D6;
        64'd43: value = 0xFFFFFFFF7205C0AB;
        64'd44: value = 0xFFFFFFFF89B2B0A3;
        64'd45: value = 0xFFFFFFFFA442B086;
        64'd46: value = 0xFFFFFFFFC14D02B3;
        64'd47: value = 0xFFFFFFFFE02A66D5;
        64'd48: value = 0x0;
        64'd49: value = 0x1FD5992B;
        64'd50: value = 0x3EB2FD4D;
        64'd51: value = 0x5BBD4F7A;
        64'd52: value = 0x764D4F5D;
        64'd53: value = 0x8DFA3F55;
        64'd54: value = 0xA2991F2A;
        64'd55: value = 0xB433285C;
        64'd56: value = 0xC2F7D5A8;
        64'd57: value = 0xCF2E5ADD;
        64'd58: value = 0xD9291DDB;
        64'd59: value = 0xE13C5295;
        64'd60: value = 0xE7B7CBC3;
        64'd61: value = 0xECE37D7F;
        64'd62: value = 0xF0FDFCBF;
        64'd63: value = 0xF43C4F67;
        64'd64: value = 0xF6CA82F0;
        64'd65: value = 0xF8CCA6FB;
        64'd66: value = 0xFA5FEB61;
        64'd67: value = 0xFB9BBB59;
        64'd68: value = 0xFC92C130;
        64'd69: value = 0xFD53C9A5;
        64'd70: value = 0xFDEA84D7;
        64'd71: value = 0xFE60266D;
        64'd72: value = 0xFEBBE888;
        64'd73: value = 0xFF037583;
        64'd74: value = 0xFF3B3CAE;
        64'd75: value = 0xFF66B5BF;
        64'd76: value = 0xFF889631;
        64'd77: value = 0xFFA2FB69;
        64'd78: value = 0xFFB78BD3;
        64'd79: value = 0xFFC790E6;
        64'd80: value = 0xFFD40B84;
        64'd81: value = 0xFFDDC3E8;
        64'd82: value = 0xFFE5561F;
        64'd83: value = 0xFFEB3BC3;
        64'd84: value = 0xFFEFD390;
        64'd85: value = 0xFFF36756;
        64'd86: value = 0xFFF63093;
        64'd87: value = 0xFFF85C11;
        64'd88: value = 0xFFFA0CB3;
        64'd89: value = 0xFFFB5DA4;
        64'd90: value = 0xFFFC640E;
        64'd91: value = 0xFFFD306D;
        64'd92: value = 0xFFFDCF97;
        64'd93: value = 0xFFFE4B8D;
        64'd94: value = 0xFFFEAC18;
        64'd95: value = 0xFFFEF747;
        default: value = 0;
    endcase
end
endmodule
