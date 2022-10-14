module sev_seg_disp(
    input [31:0] ALUoutput,
    output D1BB0,
	 output D1BB1,
	 output D1BB2,
	 output D1BB3,
	 output D1BB4,
	 output D1BB5,
	 output D1BB6,
	 
	 output D2BB0,
	 output D2BB1,
	 output D2BB2,
	 output D2BB3,
	 output D2BB4,
	 output D2BB5,
	 output D2BB6,
	 
	 output D3BB0,
	 output D3BB1,
	 output D3BB2,
	 output D3BB3,
	 output D3BB4,
	 output D3BB5,
	 output D3BB6,
	 
	 output D4BB0,
	 output D4BB1,
	 output D4BB2,
	 output D4BB3,
	 output D4BB4,
	 output D4BB5,
	 output D4BB6
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

assign D1BB0 = Display1[0];
assign D1BB1 = Display1[1]; 
assign D1BB2 = Display1[2];
assign D1BB3 = Display1[3]; 
assign D1BB4 = Display1[4];
assign D1BB5 = Display1[5]; 
assign D1BB6 = Display1[6];

assign D2BB0 = Display2[0];
assign D2BB1 = Display2[1]; 
assign D2BB2 = Display2[2];
assign D2BB3 = Display2[3]; 
assign D2BB4 = Display2[4];
assign D2BB5 = Display2[5]; 
assign D2BB6 = Display2[6];

assign D3BB0 = Display3[0];
assign D3BB1 = Display3[1]; 
assign D3BB2 = Display3[2];
assign D3BB3 = Display3[3]; 
assign D3BB4 = Display3[4];
assign D3BB5 = Display3[5]; 
assign D3BB6 = Display3[6];

assign D4BB0 = Display4[0];
assign D4BB1 = Display4[1]; 
assign D4BB2 = Display4[2];
assign D4BB3 = Display4[3]; 
assign D4BB4 = Display4[4];
assign D4BB5 = Display4[5]; 
assign D4BB6 = Display4[6];
//assign D5  = conv_to_seg(BCD[19:16]);
//assign D6  = conv_to_seg(BCD[23:20]);
//assign D7  = conv_to_seg(BCD[27:24]);
//assign D8  = conv_to_seg(BCD[31:28]);
//assign D9  = conv_to_seg(BCD[35:32]);
//assign D10 = conv_to_seg(BCD[39:36]);

endmodule