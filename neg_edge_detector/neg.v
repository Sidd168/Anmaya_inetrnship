module neg_edge_detector_gate(
    input clk,
    input reset,
    input a,
    output exp_out
);

    reg q1;
    wire not_a;

    assign not_a = ~a;
    assign exp_out = not_a & q1;

    always @(posedge clk or posedge reset) begin
        if (reset)
            q1 <= 0;
        else
            q1 <= a;
    end

endmodule

