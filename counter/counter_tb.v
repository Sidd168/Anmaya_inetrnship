module counter_tb;
    reg clk;
    reg reset;
    wire [1:0] count;

    // Instantiate the counter module
    counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Clock generation: 10 ns period (100 MHz)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus block
    initial begin
        $display("Time | Reset | Count");
        $monitor("%4t |   %b   |  %b", $time, reset, count);

        // Initial values
        reset = 1;
        #10;         // Apply reset for one clock cycle
        reset = 0;

        // Let the counter run
        #100;

        // Apply reset again
        reset = 1;
        #10;
        reset = 0;

        // Run for a bit more
        #50;

        $finish;
    end
endmodule
