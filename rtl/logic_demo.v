module logic_demo (
  input  wire a,
  input  wire b,
  input  wire sel,

  output wire y_and,
  output wire y_or,
  output wire y_xor,
  output wire y_not,
  output wire y_mux
);

  assign y_and = a & b;
  assign y_or  = a | b;
  assign y_xor = a ^ b;
  assign y_not = ~a;

  assign y_mux = sel ? b : a;

endmodule
