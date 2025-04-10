module dff_tb(
	output reg D,
	output reg clk,
	output reg rst,
	output Q);

dff_sincron sinc(
	.D(D),
	.clk(clk),
	.rst(rst),
	.Q(Q)
);
dff_asincron asinc(
	.D(D),
	.clk(clk),
	.rst(rst),
	.Q(Q)
);

initial begin 
	clk = 0;
	forever #5 clk = ~clk;
end

initial begin
	rst = 1; #1
	rst = 0; #6
	rst = 1; #5
	rst = 0;
end

initial begin
	D = 1; #5
	D = 0; #3 
	D = 1; #6
	D = 0;

end
endmodule
