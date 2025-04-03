module rca(input [3:0]a,
	   input [3:0]b,
	   input c_in,
	   output c_out,
	   output [3:0]sum);
wire c0_c1;
wire c1_c2;
wire c2_c3;

fac fac0(.a(a[0]), .b(b[0]), .c_in(c_in), .sum(sum[0]), .c_out(c0_c1));
fac fac1(.a(a[1]), .b(b[1]), .c_in(c0_c1), .sum(sum[1]), .c_out(c1_c2));
fac fac2(.a(a[2]), .b(b[2]), .c_in(c1_c2), .sum(sum[2]), .c_out(c2_c3));
fac fac3(.a(a[3]), .b(b[3]), .c_in(c2_c3), .sum(sum[3]), .c_out(c_out));



endmodule
