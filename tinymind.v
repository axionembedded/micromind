// tinymind.v
//
// Top level module implementing the HDL for the Neural Network / Machine Learning
// algorithms implemented for C++ in
//  https://github.com/intel/cppnnml
//  https://github.com/danmcleran/tinymind/
//
// This module implements ...
//
// Inputs:
//       rst_n - Reset the internal counter to zero
//       clk   - Clock for the counter
//
// Outputs:
//       done_r - Signal the MAX_VALUE was reached
//

module tinymind
  #(parameter
     MAX_VALUE=0
  ) (
    // Outputs
    output done_r,    // Signal that this module hit MAX_VALUE
    // Inputs
    input rst_n,      // Reset Signal
    input clk         // Clock Input
  );

  reg [7:0] counter;
  reg       done_r;
  wire      rst_n;
  wire      clk;

  // A stupid simple counter that signals back to the testbench when it reaches the MAX_VALUE
  always @(posedge clk or negedge rst_n) begin
    if(rst_n == 1'b0) begin
      counter <= 8'h0;
      done_r <= 1'h0;
    end
    else begin
      if ((counter != MAX_VALUE) && !done_r) begin
        counter <= counter+1;
      end
      else begin
        done_r <= 1'b1;
      end

    end
  end
endmodule