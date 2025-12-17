// Generate Partial Products (signed 16-bit)
    wire signed [15:0] pp0 = booth_decode(A, g0);        // group 0, no shift
    wire signed [15:0] pp1 = booth_decode(A, g1) <<< 3;  // group 1, shift by 3
    wire signed [15:0] pp2 = booth_decode(A, g2) <<< 6;  // group 2, shift by 6

    // Final addition
    assign P = pp0 + pp1 + pp2;
endmodule
