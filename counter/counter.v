module counter(input clk,reset,output reg[1:0]count );

    always@(posedge clk)
    begin
  
    if(reset)
    count <= 2'b00;
    
    else
    
    count <= count+1;
    end
   
    endmodule
