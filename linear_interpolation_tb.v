// Testbench for linear_interpolation.v

module linear_interpolation_tb;

    parameter DATA_WIDTH = 16;

    reg  [DATA_WIDTH-1:0] x0, y0, x1, y1, x;
    wire [DATA_WIDTH-1:0] y;

    linear_interpolation #(.DATA_WIDTH(DATA_WIDTH)) uut (
        .x0(x0),
        .y0(y0),
        .x1(x1),
        .y1(y1),
        .x(x),
        .y(y)
    );

    initial begin
        // Test 1: Interpolate between (0,0) and (10,100) at x=5
        x0 = 16'd0;   y0 = 16'd0;
        x1 = 16'd10;  y1 = 16'd100;
        x  = 16'd5;
        #10;
        $display("Test 1: x=%d, y=%d (Expected: 50)", x, y);

        // Test 2: Interpolate between (10,100) and (20,200) at x=15
        x0 = 16'd10;  y0 = 16'd100;
        x1 = 16'd20;  y1 = 16'd200;
        x  = 16'd15;
        #10;
        $display("Test 2: x=%d, y=%d (Expected: 150)", x, y);

        // Test 3: Interpolate between (0,1000) and (100,0) at x=50
        x0 = 16'd0;   y0 = 16'd1000;
        x1 = 16'd100; y1 = 16'd0;
        x  = 16'd50;
        #10;
        $display("Test 3: x=%d, y=%d (Expected: 500)", x, y);

        // Test 4: x == x0
        x0 = 16'd20;  y0 = 16'd200;
        x1 = 16'd40;  y1 = 16'd400;
        x  = 16'd20;
        #10;
        $display("Test 4: x=%d, y=%d (Expected: 200)", x, y);

        // Test 5: x == x1
        x0 = 16'd20;  y0 = 16'd200;
        x1 = 16'd40;  y1 = 16'd400;
        x  = 16'd40;
        #10;
        $display("Test 5: x=%d, y=%d (Expected: 400)", x, y);

        // Test 6: Division by zero (x0 == x1)
        x0 = 16'd10;  y0 = 16'd50;
        x1 = 16'd10;  y1 = 16'd50;
        x  = 16'd10;
        #10;
        $display("Test 6: x=%d, y=%d (Expected: 50)", x, y);

        $finish;
    end

endmodule