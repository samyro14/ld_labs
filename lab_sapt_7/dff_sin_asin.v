module dff_asincron(
	input D,
	input clk,
	input rst,
	output reg Q);
	

always@(posedge clk or posedge rst)
begin
	if(rst)
	 Q <= 0;
	 else
	 Q <= D;
end

endmodule	 

module dff_sincron(
	input D,
	input clk,
	input rst,
	output reg Q);
	

always@(posedge clk)
begin
	if(rst)
	 Q <= 0;
	 else
	 Q <= D;
end

endmodule	 
