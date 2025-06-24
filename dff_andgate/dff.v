module d_ff_with_and (
    input clk,
    input rst,
    input a,
    input b,
    output reg q
);

    wire d;

    assign d = a & b;

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 0;
        else
            q <= d;
    end

endmodule
