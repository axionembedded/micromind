`timescale 1ns/10ps
module tb;

  // Testbench Clock & Reset
  reg  clk;
  reg  rst_n;

  // Arbitrary Stopping Point
  parameter SIGNAL_AT_VALUE = 14;

  tinymind #(.MAX_VALUE(SIGNAL_AT_VALUE)) MICROMIND
  (
    // Outputs
    .done_r     (done_r),
    // Inputs
    .rst_n      (rst_n),
    .clk        (clk)
  );

  // Generate the clock
  initial begin
    clk = 1'b0;
    forever #1 clk = ~clk;
  end

  // Dump all nets to a vcd file called tb.vcd
  initial begin
    $dumpfile("tb.vcd");
	  $dumpvars(0, tb);
  end

  initial begin

    // Start by holding reset_n low for 10 nanoseconds before releasing
    rst_n = 1'b0;
    #10
    rst_n = 1'b1;

    @(posedge done_r); // Wait for done signal to rise

    $display("First Pass Completed!");

    // Reset the module and run again (make sure reset works)
    rst_n = 1'b0;
    #10
    rst_n = 1'b1;

    @(posedge done_r); // Wait for done signal to rise

    $display("Done!");

    $finish;
  end


endmodule // tb