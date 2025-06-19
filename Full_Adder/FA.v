module FA(input A, B, CIN, output SUM, COUT);
    wire w1, w2, w3;

    xor (w1, A, B);
    xor (SUM, w1, CIN);
    and (w2, w1, CIN);
    and (w3, A, B);
    or (COUT, w2, w3);
endmodule

