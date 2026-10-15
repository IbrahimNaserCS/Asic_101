`timescale 1ns/1ps

module adder8_tb;

  reg  [7:0] a;
  reg  [7:0] b;
  reg        cin;

  wire [7:0] sum;
  wire       cout;

  reg  [8:0] expected;

  integer ia;
  integer ib;
  integer ic;
  integer errors;

  adder8 dut (
    .a    (a),
    .b    (b),
    .cin  (cin),
    .sum  (sum),
    .cout (cout)
  );

  initial begin
    errors = 0;

    for (ic = 0; ic < 2; ic = ic + 1) begin
      for (ia = 0; ia < 256; ia = ia + 1) begin
        for (ib = 0; ib < 256; ib = ib + 1) begin

          a   = ia[7:0];
          b   = ib[7:0];
          cin = ic[0];

          expected = {1'b0, a} + {1'b0, b} + cin;

          #1;

          if ({cout, sum} !== expected) begin
            if (errors < 20) begin
              $display(
                "FAIL a=%h b=%h cin=%b got=%b_%h expected=%h",
                a, b, cin, cout, sum, expected
              );
            end
            errors = errors + 1;
          end

        end
      end
    end

    if (errors == 0)
      $display("PASS: all adder input combinations passed.");
    else
      $display("FAIL: %0d adder cases failed.", errors);

    $finish;
  end

endmodule
