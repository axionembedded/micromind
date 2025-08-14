import os
import sys
import argparse
import ctypes
import matplotlib.pyplot as pyplot

if __name__ == "__main__":
    supportedFns = ['tanh', 'log', 'sigmoid', 'exp']
    supportedTotalBits = [8,16,32,64]
    values = []
    parser = argparse.ArgumentParser(prog='LUT Parser', description='Parse and plot activation function LUT(s)')
    parser.add_argument('-p', '--path', dest='lutFilePath', type=str, help='Path to the lookupTables.cpp file located in the tinymind repo.')
    parser.add_argument('-f', '--function', dest='function', type=str, help='Specify an activation function (e.g., tanh, etc.).')
    parser.add_argument('-q', '--qformat', dest='qformat', type=str, help='Specify Q-format to parse and plot (e.g., 8.8, 24.8, 2.7, etc.).')
    parser.add_argument('-o', '--output', dest='output', type=int, help='Specify Q-format output. 0 == plot, 1 == verilog module.', default=0)
    args = parser.parse_args()

    assert(os.path.exists(args.lutFilePath))

    activationFn = args.function
    if not activationFn in supportedFns:
        print('Unsupported activation function: %s' % activationFn)
        print('Supported activation functions are:')
        [print(fn) for fn in supportedFns]
        sys.exit(-1)

    qformatSplit = args.qformat.split('.')
    fixedBits = int(qformatSplit[0])
    fractionalBits = int(qformatSplit[1])
    totalNumBits = (fixedBits + fractionalBits)
    if not totalNumBits in supportedTotalBits:
        print('Unsupported number of bits: %d' % totalNumBits)
        print('Supported bits consists of:')
        [print(value) for value in supportedTotalBits]
        sys.exit(-1)

    print('Parsing values from %s' % args.lutFilePath)
    print("Parsing the %s activation function for Q%d.%d" % (activationFn, fixedBits, fractionalBits))
    buildSwitch = "TINYMIND_USE_%s_%d_%d" % (activationFn.upper(), int(qformatSplit[0]), int(qformatSplit[1]))
    print("Build switch: %s" % buildSwitch)
    searchString = "#if %s" % buildSwitch
    found= False
    parse = False
    with open(args.lutFilePath, 'r') as f:
        for line in f.readlines():
            if not found:
                if searchString in line:
                    found = True
            else:
                if not parse:
                    parse = True
                else:
                    if '}' in line:
                        break
                    if totalNumBits == 8:
                        hexValue = line.split(',')[0].strip()
                        value = ctypes.c_int8(int(line.split(',')[0], 16)).value
                    elif totalNumBits == 16:
                        hexValue = line.split(',')[0].strip()
                        value = ctypes.c_int16(int(line.split(',')[0], 16)).value
                    elif totalNumBits == 32:
                        hexValue = line.split(',')[0].strip()
                        value = ctypes.c_int32(int(line.split(',')[0], 16)).value
                    elif totalNumBits == 64:
                        hexValue = line.split(',')[0].strip()
                        value = ctypes.c_int64(int(line.split(',')[0], 16)).value

                    if args.output == 0:
                        values.append(value)
                    elif args.output == 1:
                        values.append(hexValue)

    if not len(values):
        print("Failed to parse out LUT values for activation function: %s, fixed bits: %d, and fractional bits: %d" % (activationFn, fixedBits, fractionalBits))
        sys.exit(-1)

    if args.output == 0:
        print("Plotting LUT values...")
        pyplot.figure()
        pyplot.plot(values, 'b-x')
        pyplot.title('%s - Q%d.%d' % (activationFn, fixedBits, fractionalBits))
        pyplot.xlabel('LUT index')
        pyplot.ylabel('LUT value')
        pyplot.grid()
        pyplot.show()
    elif args.output == 1:
        print("Generating Verilog module for LUT values")
        fileName = '%s_%d_%d_lut.v' % (activationFn, fixedBits, fractionalBits)
        with open(fileName, 'w') as f:
            f.write('// Verilog module for %s activation function LUT with Q%d.%d\n' % (activationFn, fixedBits, fractionalBits))
            f.write('module %s_%d_%d_lut(\n' % (activationFn, fixedBits, fractionalBits))
            f.write('    input wire signed [%d:0] index,\n' % (totalNumBits - 1))
            f.write('    output reg signed [%d:0] value\n' % (totalNumBits - 1))
            f.write(');\n')
            f.write('always @(*) begin\n')
            f.write('    case(index)\n')
            for idx, val in enumerate(values):
                f.write('        %d\'d%d: value = %s;\n' % (totalNumBits, idx, val))
            f.write('        default: value = 0;\n')
            f.write('    endcase\n')
            f.write('end\n')
            f.write('endmodule\n')
        print("Verilog module written to %s" % fileName)
    else:
        print("Unsupported output option: %d" % args.output)
        print("Supported output options are: 0 (plot) and 1 (verilog module)")
        sys.exit(-1)