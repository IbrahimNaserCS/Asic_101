module adder8 (
  input  wire [7:0] a,
  input  wire [7:0] b,
  input  wire       cin,

  output wire [7:0] sum,
  output wire       cout
);

  wire [8:0] c;

  assign c[0] = cin;

  genvar i;
  generate
    for (i = 0; i < 8; i = i + 1) begin : GEN_FULL_ADDER

      assign sum[i] = a[i] ^ b[i] ^ c[i];

      assign c[i+1] = (a[i] & b[i]) | (a[i] & c[i]) | (b[i] & c[i]);
    end
  endgenerate

  assign cout = c[8];

endmodule
