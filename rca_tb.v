module rca_tb(output reg a, b, c_in, output sum, c_out)
wire ci0_c01;
wire ci0_c02;
wire ci0_c03;

fca uut_0(.a(a[0]), .b(b[0]), .c_in(c_in), .sum(sum[0]), .c_out(ci0_c01));
fca uut_1(.a(a[1]), .b(b[1]), .c_in(ci0_c01), .sum(sum[1]), .c_out(ci0_c02));
fca uut_2(.a(a[2]), .b(b[2]), .c_in(ci0_c02), .sum(sum[2]), .c_out(ci0_c03));
fca uut_3(.a(a[3]), .b(b[3]), .c_in(ci0_c03), .sum(sum[3]), .c_out(c_out));

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
