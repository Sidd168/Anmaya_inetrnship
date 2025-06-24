module tb_neg_edge_detector_gate;

    reg clk;
    reg reset;
    reg a;
    wire exp_out;

    // Instantiate the DUT (Device Under Test)
    neg_edge_detector_gate dut (
        .clk(clk),
        .reset(reset),
        .a(a),
        .exp_out(exp_out)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        reset = 1;
        a = 1;
        #10;
        reset = 0;

        // Apply falling edge on `a`
        #10 a = 0; // exp_out = 1 expected
        #10 a = 0; // no edge
        #10 a = 1;
        #10 a = 0; // exp_out = 1 again
        #10 a = 1;
        #10 a = 1;
        #10 a = 0; // exp_out = 1
        #10 $finish;
    end

endmodule
