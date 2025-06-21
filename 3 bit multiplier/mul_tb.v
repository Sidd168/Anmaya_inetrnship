module mul_tb;

  reg [2:0] a, b;
  wire [5:0] p;
  reg [5:0] expected;
  integer i, j;

  // Instantiate the DUT
  mul3bit dut (
    .a(a),
    .b(b),
    .p(p)
  );

  initial begin
    $display("Time\t a\t b\t p(actual)\t expected\t Status");

    for (i = 0; i < 8; i = i + 1) begin
      for (j = 0; j < 8; j = j + 1) begin
        a = i;
        b = j;
        expected = i * j;
        #10; // wait for propagation
        if (p === expected)
          $display("%0t\t %0d\t %0d\t %0d\t\t %0d\t\t PASS", $time, a, b, p, expected);
        else
          $display("%0t\t %0d\t %0d\t %0d\t\t %0d\t\t FAIL", $time, a, b, p, expected);
      end
    end
    $finish;
  end

endmodule
