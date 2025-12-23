`timescale 1ns / 1ps


module array_mult_eight_bit(input [7:0] in1, input [7:0] in2, output [15:0] prod_out);
    wire p [7:0][7:0];
    wire [41:0] s;
    wire [54:0] c; 
    
    //p[3:0] = p(N0), p[7:4] = p(N1), p[11:8] = p(N2), p[15:12] = p(N3)
    genvar i;
    generate
        for(i = 0; i<8; i = i + 1) begin
            assign p[i][0] = in1[i] & in2[0];
            assign p[i][1] = in1[i] & in2[1];
            assign p[i][2] = in1[i] & in2[2];
            assign p[i][3] = in1[i] & in2[3];
            assign p[i][4] = in1[i] & in2[4];
            assign p[i][5] = in1[i] & in2[5];
            assign p[i][6] = in1[i] & in2[6];
            assign p[i][7] = in1[i] & in2[7];
        end
     endgenerate
     
    assign prod_out[0] = p[0][0];
 // -------------------- COLUMN 1 --------------------
    half_add HA00(.in1(p[1][0]), .in2(p[0][1]), .s_out(prod_out[1]), .c_out(c[0]));
    
    genvar h;
    
    generate
        for(h = 2; h < 8; h = h + 1) begin
            half_add HA(.in1(p[h][0]), .in2(p[h-1][1]), .s_out(s[h-2]), .c_out(c[h-1]));
        end
     endgenerate
// -------------------- COLUMN 2 --------------------   
    full_adder FA00(.in1(s[0]), .in2(p[0][2]), .c_in(c[0]), .c_out(c[7]), .s_out(prod_out[2]));
    
    genvar f;
    generate
        for(f = 1; f < 6; f = f + 1) begin
            full_adder FA(.in1(s[f]), .in2(p[f][2]), .c_in(c[f]), .c_out(c[f+7]), .s_out(s[f+5]));
        end
    endgenerate
    full_adder FA01(.in1(p[7][1]), .in2(p[6][2]), .c_in(c[6]), .c_out(c[13]), .s_out(s[11]));
// -------------------- COLUMN 3 --------------------
    full_adder FA03(.in1(s[6]), .in2(p[0][3]), .c_in(c[7]), .c_out(c[14]), .s_out(prod_out[3]));
    
    genvar f1;
    generate
        for(f1 = 1; f1 < 6; f1 = f1 + 1) begin
            full_adder FA(.in1(s[f1+6]), .in2(p[f1][3]), .c_in(c[f1+7]), .c_out(c[f1+14]), .s_out(s[f1+11]));
        end
    endgenerate
    full_adder FA04(.in1(p[7][2]), .in2(p[6][3]), .c_in(c[13]), .c_out(c[20]), .s_out(s[17]));
// -------------------- COLUMN 4 --------------------
    full_adder FA05(.in1(s[12]), .in2(p[0][4]), .c_in(c[14]), .c_out(c[21]), .s_out(prod_out[4]));

    genvar f2;
    generate
        for(f2 = 1; f2 < 6; f2 = f2 + 1) begin
            full_adder FA(.in1(s[f2+12]), .in2(p[f2][4]), .c_in(c[f2+14]), .c_out(c[f2+21]), .s_out(s[f2+17]));
        end
    endgenerate
    full_adder FA07(.in1(p[7][3]), .in2(p[6][4]), .c_in(c[20]), .c_out(c[27]), .s_out(s[23]));

// -------------------- COLUMN 5 --------------------
    full_adder FA08(.in1(s[18]), .in2(p[0][5]), .c_in(c[21]), .c_out(c[28]), .s_out(prod_out[5]));
    
    genvar f3;
    generate
        for(f3 = 1; f3 < 6; f3 = f3 + 1) begin
            full_adder FA(.in1(s[f3+18]), .in2(p[f3][5]), .c_in(c[f3+21]), .c_out(c[f3+28]), .s_out(s[f3+23]));
        end
    endgenerate
    full_adder FA10(.in1(p[7][4]), .in2(p[6][5]), .c_in(c[27]), .c_out(c[34]), .s_out(s[29]));
    
// -------------------- COLUMN 6 --------------------
    full_adder FA11(.in1(s[24]), .in2(p[0][6]), .c_in(c[28]), .c_out(c[35]), .s_out(prod_out[6]));
    
    genvar f4;
    generate
        for(f4 = 1; f4 < 6; f4 = f4 + 1) begin
            full_adder FA(.in1(s[f4+24]), .in2(p[f4][6]), .c_in(c[f4+28]), .c_out(c[f4+35]), .s_out(s[f4+29]));
        end
    endgenerate
    full_adder FA13(.in1(p[7][5]), .in2(p[6][6]), .c_in(c[34]), .c_out(c[41]), .s_out(s[35]));
    
// -------------------- COLUMN 7 --------------------
    full_adder FA14(.in1(s[30]), .in2(p[0][7]), .c_in(c[35]), .c_out(c[42]), .s_out(prod_out[7]));
    
    genvar f5;
    generate
        for(f5 = 1; f5 < 6; f5 = f5 + 1) begin
            full_adder FA(.in1(s[f5+30]), .in2(p[f5][7]), .c_in(c[f5+35]), .c_out(c[f5+42]), .s_out(s[f5+35]));
        end
    endgenerate
    full_adder FA16(.in1(p[7][6]), .in2(p[6][7]), .c_in(c[41]), .c_out(c[48]), .s_out(s[41]));
    
// -------------------- COLUMN 8 --------------------
    half_add HA01(.in1(s[36]), .in2(c[42]), .s_out(prod_out[8]), .c_out(c[49]));
    genvar f6;
    generate
        for(f5 = 1; f5 < 6; f5 = f5 + 1) begin
            full_adder FA(.in1(s[f5+36]), .in2(c[f5+42]), .c_in(c[f5+48]), .c_out(c[f5+49]), .s_out(prod_out[f5+8]));
        end
    endgenerate
    full_adder FA17(.in1(p[7][7]), .in2(c[48]), .c_in(c[54]), .c_out(prod_out[15]), .s_out(prod_out[14]));
         
endmodule
