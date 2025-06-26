module bram(
    input clk,
    input we,
    input [9:0] addr,
    input [31:0] din,
    output [31:0] dout
);
    reg [31:0] mem [0:1023];

    always @(posedge clk) begin
        if(we) begin
            mem[addr] = din;
        end
    end

    assign dout = mem[addr];
endmodule

