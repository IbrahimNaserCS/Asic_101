`timescale 1ns/1ps

module register8_tb;

  reg        clk;
  reg        rst_n;
  reg  [7:0] d;
  wire [7:0] q;

  integer errors;

  register8 dut (
    .clk   (clk),
    .rst_n (rst_n),
    .d     (d),
    .q     (q)
  );

  initial clk = 1'b0;
  always #5 clk = ~clk;

  initial begin
    $dumpfile("build/register8.vcd");
    $dumpvars(0, register8_tb);

    errors = 0;
    rst_n  = 0;
    d      = 8'hA5;

    @(posedge clk);
    #1;
    if (q !== 8'h00) begin
      $display("FAIL: reset did not clear q");
      errors = errors + 1;
    end

    rst_n = 1;
    d     = 8'h12;

    @(posedge clk);
    #1;
    if (q !== 8'h12) begin
      $display("FAIL: expected q=12, got q=%h", q);
      errors = errors + 1;
    end

    d = 8'hF0;

    // Before another rising edge, q must still hold the previous value.
    #2;
    if (q !== 8'h12) begin
      $display("FAIL: q changed without a rising edge");
      errors = errors + 1;
    end

    @(posedge clk);
    #1;
    if (q !== 8'hF0) begin
      $display("FAIL: expected q=F0, got q=%h", q);
      errors = errors + 1;
    end

    if (errors == 0)
      $display("PASS: register8 passed.");
    else
      $display("FAIL: %0d checks failed.", errors);

    $finish;
  end

endmodule
