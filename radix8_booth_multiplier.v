module radix8_booth_multiplier(
    input  signed [7:0]  A,
    input  signed [7:0]  B,
    output signed [15:0] P
);
   
    // We sign-extend MSB and add a single 0 LSB to create proper overlapping groups.
    wire [10:0] B_ext = {B[7], B[7], B, 1'b0};

    wire [3:0] g0 = B_ext[3:0];
    wire [3:0] g1 = B_ext[6:3];
    wire [3:0] g2 = B_ext[9:6];

    // Booth Decode Function (Behavioral) 
    function signed [15:0] booth_decode;
        input signed [7:0] m;
        input [3:0] bits;
        begin
            case (bits)
                4'b0000, 4'b1111: booth_decode = 16'sd0;                                           //  0
                4'b0001, 4'b0010: booth_decode = {{8{m[7]}}, m};                                    // +1 * A
                4'b0011, 4'b0100: booth_decode = {{8{m[7]}}, m} <<< 1;                              // +2 * A
                4'b0101, 4'b0110: booth_decode = ({{8{m[7]}}, m} <<< 1) + {{8{m[7]}}, m};          // +3 * A
                4'b0111:           booth_decode = {{8{m[7]}}, m} <<< 2;                              // +4 * A
                4'b1000:           booth_decode = -({{8{m[7]}}, m} <<< 2);                           // -4 * A
                4'b1001, 4'b1010: booth_decode = -(({{8{m[7]}}, m} <<< 1) + {{8{m[7]}}, m});        // -3 * A
                4'b1011, 4'b1100: booth_decode = -({{8{m[7]}}, m} <<< 1);                           // -2 * A
                4'b1101, 4'b1110: booth_decode = -({{8{m[7]}}, m});                                 // -1 * A
                default:          booth_decode = 16'sd0;
            endcase
        end
    endfunction
