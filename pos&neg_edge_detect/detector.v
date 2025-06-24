module edge_detector(
    input clk,
    input reset,
    input a,
    output pos_edge,
    output neg_edge
);

    reg q1;
    wire not_a, not_q1;

    assign not_a = ~a;
    assign not_q1 = ~q1;

    assign pos_edge = a & not_q1;     // a was 0, now 1
    assign neg_edge = not_a & q1;     // a was 1, now 0

    always @(posedge clk or posedge reset) begin
        if (reset)
            q1 <= 0;
        else
            q1 <= a;
    end

endmodule
