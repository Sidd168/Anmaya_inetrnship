module bram_single_port #(
    parameter DATA_WIDTH = 16,
    parameter ADDR_WIDTH = 8
) (
    input wire clk,
    input wire en,
    input wire we,
    input wire [ADDR_WIDTH-1:0] addr,
    input wire [DATA_WIDTH-1:0] di,
    output reg [DATA_WIDTH-1:0] dout
);

reg [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH)-1];

always @(posedge clk) begin
    if (en) begin
        if (we) begin
            mem[addr] <= di;
            dout <= di;
        end else begin
            dout <= mem[addr];
        end
    end
end

endmodule
