module clock_div (
    input wire clk,          
    input wire rst,          
    output reg divided_clk   
);

    reg [2:0] counter;       

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            counter <= 3'b000;
            divided_clk <= 1'b0;
        end else begin
            if (counter == 3'b111) begin
                counter <= 3'b000;
                divided_clk <= ~divided_clk; 
            end else begin
                counter <= counter + 1;
            end
        end
    end

endmodule
