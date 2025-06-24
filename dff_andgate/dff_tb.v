module d_ff_with_and_tb;

    reg clk, rst, a, b;
    wire q;

    d_ff_with_and uut (
        .clk(clk),
        .rst(rst),
        .a(a),
        .b(b),
        .q(q)
    );

    initial begin
        clk = 0;
        rst = 1;
        a = 0;
        b = 0;

        #5 rst = 0;

        #10 a = 1; b = 0;
        #10 a = 1; b = 1;
        #10 a = 0; b = 1;
        #10 a = 1; b = 1;

        #10 rst = 1;
        #10 rst = 0;

        #10 $finish;
    end

    always #5 clk = ~clk;

endmodule
