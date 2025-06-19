module two_bit_mul(input a0,a1,b0,b1,output [3:0]y);
wire w1,w2,w3,c1;
and g1(w1,a1,b0);
and g2(w2,a0,b1);
and g3(y[0],a0,b0);
and g4(w3,a1,b1);
HA h1(w1,w2,y[1],c1);
HA h2(w3,c1,y[2],y[3]);
endmodule



