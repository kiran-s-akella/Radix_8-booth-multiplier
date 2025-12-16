`timescale 1ns / 1ps
module compressor_5_3(input a,b,c,d,e, output sum,carry1,carry2);
    wire s1,c1,s2,c2,t1,t2,t3,u1,u2,u3;
    xor(s1,a,b,c);                 // first stage XOR
    and(t1,a,b);
    and(t2,b,c);
    and(t3,c,a);
    or(c1,t1,t2,t3);               // first carry
    xor(s2,s1,d,e);                // second stage XOR
    and(u1,s1,d);
    and(u2,d,e);
    and(u3,e,s1);
    or(c2,u1,u2,u3);               // second carry
    assign sum    = s2;
    assign carry1 = c1;
    assign carry2 = c2;
endmodule
