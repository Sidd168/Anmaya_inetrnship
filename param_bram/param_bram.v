module bram #(
parameter data_width = 32,
parameter addr_width = 11
)(
input clk,
input we,
input [addr_width-1:0] addr,
input [data_width-1:0] din,
output reg [data_width-1:0] dout
);
reg [data_width-1:0] mem [0:(2**addr_width)-1];

always @(posedge clk) begin
if (we)
mem[addr] <= din;
dout <= mem[addr]; 
end

endmodule
