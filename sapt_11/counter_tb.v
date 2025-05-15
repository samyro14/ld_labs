module counter_tb(output reg clk,
		  output reg rst,
		  output [3:0]cnt);

counter cnt_tb(.clk(clk), .rst(rst), .cnt(cnt));

initial begin
	clk = 0;
	forever #10 clk = ~clk;
	end
initial begin
	rst = 1; #10;
	rst = 0;
end


endmodule
