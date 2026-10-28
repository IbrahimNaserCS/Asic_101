module ripple4 (
  input  wire [3:0] a,
  input  wire [3:0] b,
  input  wire       cin,
  output wire [3:0] sum,
  output wire       cout
);

  wire [4:0] c;
  assign c[0] = cin;

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1) begin : GEN_FA
      assign sum[i] = a[i] ^ b[i] ^ c[i];
      assign c[i+1] = (a[i] & b[i]) | (a[i] & c[i]) | (b[i] & c[i]);
    end
  endgenerate

  assign cout = c[4];

endmodule

module adder8 (
  input  wire [7:0] a,
  input  wire [7:0] b,
  input  wire       cin,
  output wire [7:0] sum,
  output wire       cout
);

  wire       c4;

  wire [3:0] upper_sum_c0;
  wire [3:0] upper_sum_c1;
  wire       upper_cout_c0;
  wire       upper_cout_c1;

  ripple4 u_low (
    .a    (a[3:0]),
    .b    (b[3:0]),
    .cin  (cin),
    .sum  (sum[3:0]),
    .cout (c4)
  );

  ripple4 u_upper_c0 (
    .a    (a[7:4]),
    .b    (b[7:4]),
    .cin  (1'b0),
    .sum  (upper_sum_c0),
    .cout (upper_cout_c0)
  );

  ripple4 u_upper_c1 (
    .a    (a[7:4]),
    .b    (b[7:4]),
    .cin  (1'b1),
    .sum  (upper_sum_c1),
    .cout (upper_cout_c1)
  );

  assign sum[7:4] = c4 ? upper_sum_c1  : upper_sum_c0;
  assign cout     = c4 ? upper_cout_c1 : upper_cout_c0;

endmodule
