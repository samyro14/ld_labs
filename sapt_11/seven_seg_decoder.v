module seven_seg_decoder(
	input [3:0]cnt,
	output reg [6:0]seg
);


counter count(.cnt(cnt));
always @(*)
	begin
	case(in)
	4'b0000: seg = 7'b1000000;
	4'b0001: seg = 7'b1111001;
	4'b0010: seg = 7'b0100100;
	4'b0011: seg = 7'b0110000;
	4'b0100: seg = 7'b0011001;
	4'b0101: seg = 7'b0010010;
	4'b0110: seg = 7'b0000010;
	4'b0111: seg = 7'b1111000;
	4'b1000: seg = 7'b0000000;
	4'b1001: seg = 7'b0010000;
	4'b1010: seg = 7'b0001000;
	4'b1011: seg = 7'b0000011;
	4'b1100: seg = 7'b1000110;
	4'b1101: seg = 7'b0100001;
	4'b1110: seg = 7'b0000110;
	4'b1111: seg = 7'b0001110;
	default: seg = 7'b1111111;
	endcase
	end
endmodule
