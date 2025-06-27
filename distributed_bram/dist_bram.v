module dist_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
) (
    input  wire                   clk,
    input  wire                   en,
    input  wire                   we,
    input  wire [ADDR_WIDTH-1:0]  addr,
    input  wire [DATA_WIDTH-1:0]  din,
    output reg  [DATA_WIDTH-1:0]  dout
);
  (* ram_style = "distributed" *)
  reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];
  always @(posedge clk) begin
    if (en) begin
      if (we)
        mem[addr] <= din;
      dout <= mem[addr];
    end
  end
  endmodule
