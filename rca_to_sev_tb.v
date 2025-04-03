module rca_to_sev_tb(output reg [3:0]a,
		     output reg [3:0]b,
		     output [3:0]seg1,
		     output [3:0]seg2
			);
rca_to_sev test(.a(a), .b(b), .seg1(seg1), .seg2(seg2));

initial begin
	a = 4'b0000; b = 4'0001; #10
	a = 4'b0001; b = 4'0101; #10
	a = 4'b0001; b = 4'0011; #10
	a = 4'b0010; b = 4'1001; #10
	a = 4'b1111; b = 4'1111; #10
	a = 4'b0000; b = 4'0001; #10
	a = 4'b0000; b = 4'0001; 

end

endmodule
