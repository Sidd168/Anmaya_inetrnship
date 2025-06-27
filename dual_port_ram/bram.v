module dual_port_bram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
) (
    // Port A
    input  wire                       clk_a,
    input  wire                       en_a,
    input  wire                       we_a,
    input  wire [ADDR_WIDTH-1:0]      addr_a,
    input  wire [DATA_WIDTH-1:0]      din_a,
    output reg  [DATA_WIDTH-1:0]      dout_a,

    // Port B
    input  wire                       clk_b,
    input  wire                       en_b,
    input  wire                       we_b,
    input  wire [ADDR_WIDTH-1:0]      addr_b,
    input  wire [DATA_WIDTH-1:0]      din_b,
    output reg  [DATA_WIDTH-1:0]      dout_b
);

    // Memory array
    localparam DEPTH = (1 << ADDR_WIDTH);
    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Port A read/write
    always @(posedge clk_a) begin
        if (en_a) begin
            if (we_a)
                mem[addr_a] <= din_a;
            dout_a <= mem[addr_a];
        end
    end

    // Port B read/write
    always @(posedge clk_b) begin
        if (en_b) begin
            if (we_b)
                mem[addr_b] <= din_b;
            dout_b <= mem[addr_b];
        end
    end

endmodule
