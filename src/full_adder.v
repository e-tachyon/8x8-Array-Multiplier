`timescale 1ns / 1ps


module full_adder(input in1, input in2, input c_in, output s_out, c_out); 
    assign s_out = in1 ^ in2 ^ c_in;
    assign c_out = (in1 & in2) | (in1 & c_in) | (in2 & c_in);
endmodule
