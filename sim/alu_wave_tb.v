`timescale 1ns/1ps

module alu_wave_tb;

  reg  [7:0] a;
  reg  [7:0] b;
  reg  [2:0] op;

  wire [7:0] y;
  wire       carry;
  wire       overflow;
  wire       zero;
  wire       negative;

  alu_core dut (
    .a        (a),
    .b        (b),
    .op       (op),
    .y        (y),
    .carry    (carry),
    .overflow (overflow),
    .zero     (zero),
    .negative (negative)
  );

  initial begin

    $dumpfile("build/alu_wave.vcd");
    $dumpvars(0, alu_wave_tb);

    // ADD: 1 + 1 = 2
    a = 8'h01;
    b = 8'h01;
    op = 3'b000;
    #10;

    // ADD with signed overflow: 127 + 1
    a = 8'h7F;
    b = 8'h01;
    op = 3'b000;
    #10;

    // SUB: 0 - 1 = FF (-1 in signed interpretation)
    a = 8'h00;
    b = 8'h01;
    op = 3'b001;
    #10;

    // XOR
    a = 8'hAA;
    b = 8'h55;
    op = 3'b100;
    #10;

    // Shift left
    a = 8'h81;
    b = 8'h00;
    op = 3'b110;
    #10;

    // Shift right
    a = 8'h81;
    b = 8'h00;
    op = 3'b111;
    #10;

    $finish;
  end

endmodule