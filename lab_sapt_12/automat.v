`define S0 3'b000
`define S1 3'b001
`define S2 3'b010
`define S3 3'b011
`define S4 3'b100

module automat(
	input clk,
	input rst,
	input in,
	output reg out	
 );

reg[2:0] state_next, state_reg;
always@(posedge clk or posedge rst)
	begin
		if(rst)
			state_reg <= 0;
			else
			state_reg <= state_next;

end

always@(state_reg, in)
begin
  state_next = state_reg;
  out = 0;
  case(state_reg)
  	`S0 : begin
  	   out = 0;
  	   if(in == 0)
  	   state_next = `S1;
  	   else
  	   state_next = `S0;
  	   end
  	   
  	 `S1 : begin
  	   out = 0;
  	   if(in)
  	   state_next = `S2;
  	   else
  	   state_next = `S1;
  	   end
  	   
  	 `S2 : begin
  	   out = 0;
  	   if(in)
  	   state_next = `S3;
  	   else
  	   state_next = `S1;
  	   end
  	   
  	 `S3 : begin
  	   out = 0;
  	   if(in)
  	   state_next = `S0;
  	   else
  	   state_next = `S4;
  	   end
  	   
  	 `S4 : begin
  	   out = 1;
  	   if(in)
  	   state_next = `S0;
  	   else
  	   state_next = `S0;
  	   end
  endcase
  end
  
  endmodule
 
