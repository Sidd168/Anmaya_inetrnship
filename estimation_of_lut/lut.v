module EstimationOf_LUT_for_a_given_function(
    input a,b,c,d,e,f,g,h,
    output y
    );
    assign y = a&b|c^d&e|f^g&h;
endmodule
