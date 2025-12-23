`timescale 1ns / 1ps

module array_mult_tb;
    
    reg CLK;
    reg [7:0] a;
    reg [7:0] b;
    wire [15:0] product;
    
    array_mult_eight_bit AM00(.in1(a), .in2(b), .prod_out(product));
    
    parameter halfclkper = 10;
    initial begin : CLKGEN
        CLK = 1'b0;
        forever #halfclkper CLK = ~CLK;
    end
    
    initial begin
        @(posedge CLK) a = 8'b11111111; b = 8'b11111111;
        @(posedge CLK) a = 8'b00000000; b = 8'b00000000;
        @(posedge CLK) a = 8'b00000000; b = 8'b11111111;
        @(posedge CLK) a = 8'b11111111; b = 8'b00000000;
        @(posedge CLK) a = 8'b00100101; b = 8'b10001110;
        @(posedge CLK) a = 8'b10000000; b = 8'b00000011;
        @(posedge CLK) a = 8'b01010101; b = 8'b10101010;
        @(posedge CLK) a = 8'b00001111; b = 8'b11110000;
        @(posedge CLK) a = 8'b11001000; b = 8'b01100100;
        @(posedge CLK) $finish;
    end


endmodule
