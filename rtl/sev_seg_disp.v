module sev_seg_disp(
    input [31:0] ALUoutput,
    output [4:0] D1,
    output [4:0] D2,
    output [4:0] D3,
    output [4:0] D4,
    output [4:0] D5,
    output [4:0] D6,
    output [4:0] D7,
    output [4:0] D8,
    output [4:0] D9,
    output [4:0] D10
);

wire [39:0] BCD;

binary_to_bcd bin_bcd1(.bin(ALUoutput), .bcd(BCD));

assign D1  = BCD[3:0];
assign D2  = BCD[7:4];
assign D3  = BCD[11:8];
assign D4  = BCD[15:12];
assign D5  = BCD[19:16];
assign D6  = BCD[23:20];
assign D7  = BCD[27:24];
assign D8  = BCD[31:28];
assign D9  = BCD[35:32];
assign D10 = BCD[39:36];

endmodule