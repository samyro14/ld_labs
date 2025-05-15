module counter( output reg [3:0]cnt,
		input clk,
		input rst
		);

always@(posedge clk or posedge rst)
begin
	
	if(rst)
	 cnt <= 4'b0000;
	else if(cnt == 4'b1011)
	   cnt <= 4'b0000;
	else
	  cnt <= cnt + 4'b0001;
	
	
end

endmodule
