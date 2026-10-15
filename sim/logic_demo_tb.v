`timescale 1ns/1ps

module logic_demo_tb;

  reg a;
  reg b;
  reg sel;

  wire y_and;
  wire y_or;
  wire y_xor;
  wire y_not;
  wire y_mux;

  integer errors;

  logic_demo dut (
    .a     (a),
    .b     (b),
    .sel   (sel),
    .y_and (y_and),
    .y_or  (y_or),
    .y_xor (y_xor),
    .y_not (y_not),
    .y_mux (y_mux)
  );

  task check_outputs;
    input exp_and;
    input exp_or;
    input exp_xor;
    input exp_not;
    input exp_mux;
    begin
      #1;

      if (
        y_and !== exp_and ||
        y_or  !== exp_or  ||
        y_xor !== exp_xor ||
        y_not !== exp_not ||
        y_mux !== exp_mux
      ) begin
        $display(
          "FAIL a=%b b=%b sel=%b | and=%b or=%b xor=%b not=%b mux=%b",
          a, b, sel,
          y_and, y_or, y_xor, y_not, y_mux
        );
        errors = errors + 1;
      end
    end
  endtask

  initial begin
    $dumpfile("build/logic_demo.vcd");
    $dumpvars(0, logic_demo_tb);

    errors = 0;

    a = 0; b = 0; sel = 0;
    check_outputs(0, 0, 0, 1, 0);

    a = 0; b = 1; sel = 0;
    check_outputs(0, 1, 1, 1, 0);

    a = 0; b = 1; sel = 1;
    check_outputs(0, 1, 1, 1, 1);

    a = 1; b = 0; sel = 0;
    check_outputs(0, 1, 1, 0, 1);

    a = 1; b = 0; sel = 1;
    check_outputs(0, 1, 1, 0, 0);

    a = 1; b = 1; sel = 0;
    check_outputs(1, 1, 0, 0, 1);

    a = 1; b = 1; sel = 1;
    check_outputs(1, 1, 0, 0, 1);

    if (errors == 0)
      $display("PASS: logic_demo passed.");
    else
      $display("FAIL: %0d test cases failed.", errors);

    $finish;
  end

endmodule
