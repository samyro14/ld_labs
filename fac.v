module fac(input a, input b, input c_in, output sum, output c_out);

assign sum = c_in^a^b;
assign c_out = a & b | c_in & (a^b);

endmodule
