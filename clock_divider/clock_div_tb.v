module clock_div_tb;

    
    reg clk;
    reg rst;
    wire divided_clk;

   
    clock_div uut (
        .clk(clk),
        .rst(rst),
        .divided_clk(divided_clk)
    );

  
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end

    
    initial begin
       
        rst = 1;
        #15;
        rst = 0;

        
        #250;

       
        $finish;
    end

   
    initial begin
        $display("Time\tclk\trst\tdivided_clk");
        $monitor("%0dns\t%b\t%b\t%b", $time, clk, rst, divided_clk);
    end
