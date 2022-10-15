module sev_seg_disp(
    input [31:0] ALUoutput,
    output [6:0] D1,
	 output [6:0] D2,
	 output [6:0] D3,
	 output [6:0] D4
);

function [6:0] conv_to_seg(
	input [3:0] Digit
);
	case (Digit)
		4'b0000 : conv_to_seg = 7'h7E;
		4'b0001 : conv_to_seg = 7'h30;
		4'b0010 : conv_to_seg = 7'h6D;
		4'b0011 : conv_to_seg = 7'h79;
		4'b0100 : conv_to_seg = 7'h33;          
		4'b0101 : conv_to_seg = 7'h5B;
		4'b0110 : conv_to_seg = 7'h5F;
		4'b0111 : conv_to_seg = 7'h70;
		4'b1000 : conv_to_seg = 7'h7F;
		4'b1001 : conv_to_seg = 7'h7B;
		4'b1010 : conv_to_seg = 7'h77;
		4'b1011 : conv_to_seg = 7'h1F;
		4'b1100 : conv_to_seg = 7'h4E;
		4'b1101 : conv_to_seg = 7'h3D;
		4'b1110 : conv_to_seg = 7'h4F;
		4'b1111 : conv_to_seg = 7'h47;
	endcase
endfunction

wire [39:0] BCD;
wire [6:0] Display1, Display2, Display3, Display4;

binary_to_bcd bin_bcd1(.bin(ALUoutput), .bcd(BCD));



assign Display1  = conv_to_seg(BCD[3:0]);
assign Display2  = conv_to_seg(BCD[7:4]);
assign Display3  = conv_to_seg(BCD[11:8]);
assign Display4  = conv_to_seg(BCD[15:12]);

assign D1 = ~Display1;
assign D2 = ~Display2;
assign D3 = ~Display3;
assign D4 = ~Display4;


endmodule