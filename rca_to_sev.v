module rca_to_sev(input [3:0]a,
		  input [3:0]b,
		  output reg [6:0]seg1,
		  output reg [6:0]seg2);
wire [3:0]out;
wire c_out;

rca suma(.a(a), .b(b), .c_in(1'b0), .c_out(c_out), .sum(out));
seven_seg_decoder print_main(.in(out), .seg(seg1));
seven_seg_decoder print_c_out(.in({3'b000, c_out}), .seg(seg2));

endmodule
