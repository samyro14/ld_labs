module automat_tb(output reg clk,
		  output reg rst,
		  output reg in,
		  output out);
automat AUTOMAT(.clk(clk), .rst(rst), .in(in), .out(out));

initial begin
	clk = 0;
	forever #10 clk = ~clk;
	end
initial begin
	rst = 1; #10;
	rst = 0;
end

initial begin
	in = 0; #15
	in = 1; #16
	in = 1; #25
	in = 0; #25	
	in = 0;
end

endmodule
