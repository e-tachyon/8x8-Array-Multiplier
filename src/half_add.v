`timescale 1ns / 1ps


module half_add(input in1, input in2, output s_out, c_out);
    assign s_out = in1 ^ in2;
    assign c_out = in1 & in2;
endmodule
