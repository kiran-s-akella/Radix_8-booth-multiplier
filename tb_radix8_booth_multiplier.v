module tb_radix8_booth_multiplier;
    reg  signed [7:0] A;
    reg  signed [7:0] B;
    wire signed [15:0] P;

    radix8_booth_multiplier uut (
        .A(A),
        .B(B),
        .P(P)
    );

    initial begin
        $display("  A\t   B\t   P (expected)");
        A = -8;  B = -5;  #10; $display("%4d\t%4d\t%4d (40)", A, B, P);
        A = -7;  B = 15;  #10; $display("%4d\t%4d\t%4d (-105)", A, B, P);
        A = 10;  B = 12;  #10; $display("%4d\t%4d\t%4d (120)", A, B, P);
        A = 4;   B = 7;   #10; $display("%4d\t%4d\t%4d (28)", A, B, P);
        A = -9;  B = -3;  #10; $display("%4d\t%4d\t%4d (27)", A, B, P);
        #10 $stop;
    end
endmodule
