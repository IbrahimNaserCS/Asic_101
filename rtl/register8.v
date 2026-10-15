module register8 (
  input  wire       clk,
  input  wire       rst_n,
  input  wire [7:0] d,
  output reg  [7:0] q
);

  always @(posedge clk) begin
    if (!rst_n)
      q <= 8'h00;
    else
      q <= d;
  end

endmodule
