module pe_tb;

    reg [7:0] D;
    wire [2:0] y;

    // Instantiate the Unit Under Test (UUT)
    pr_encoder uut (
        .D(D),
        .y(y)
    );

    integer i;

    initial begin
        $display("Time\t\tD\t\t y");
        $monitor("%0t\t%b\t %b", $time, D, y);

        // Loop through 8 cases with one bit high at a time
        for (i = 0; i < 8; i = i + 1) begin
            D = 8'b00000001 << i; // Shift '1' to the left by i bits
            #10;
        end

        // Extra test cases
        D = 8'b11100000; #10; // Highest bit set should dominate -> y = 111
        D = 8'b00100100; #10; // Bits 5 and 2 set -> y = 101
        D = 8'b00000000; #10; // No bits set -> y = xxx (undefined)

        $finish;
    end
endmodule
