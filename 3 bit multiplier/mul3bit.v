module mul3bit(input [2:0]a,b,output wire [5:0]p

    );
    wire a0b0,a1b0,a0b1,a2b0,a1b1,a0b2,a2b1,a1b2,a2b2,c1,c2,c3,c4,c5,s1,s2;
    and(p[0],a[0],b[0]);
    and(a1b0,a[1],b[0]);
    and(a0b1,a[0],b[1]);
    and(a2b0,a[2],b[0]);
    and(a1b1,a[1],b[1]);
    and(a0b2,a[0],b[2]);
    and(a2b1,a[2],b[1]);
    and(a1b2,a[1],b[2]);
    and(a2b2,a[2],b[2]);
    HA h1(a1b0,a0b1,p[1],c1);
    FA f1(c1,a2b0,a1b1,s1,c2);
    HA h2(s1,a0b2,p[2],c3);
    HA h3(c2,a2b1,s2,c4);
    FA f2(s2,a1b2,c3,p[3],c5);
    FA f3(c4,a2b2,c5,p[4],p[5]);
    endmodule
