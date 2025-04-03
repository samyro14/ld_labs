module fac_tb(output reg a, b, c_in, output sum, c_out)

fac uut(.a(a), .b(b), .c_in(c_in), .sum(sum), .c_out(c_out));


initial begin

a = 0; b = 0; c_in = 0; #10
a = 0; b = 0; c_in = 1; #10
a = 0; b = 1; c_in = 0; #10
a = 0; b = 1; c_in = 1; #10
a = 1; b = 0; c_in = 0; #10
a = 1; b = 0; c_in = 1; #10
a = 1; b = 1; c_in = 0; #10
a = 1; b = 1; c_in = 1; #10

end
endmodule
