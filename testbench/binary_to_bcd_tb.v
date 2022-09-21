module binary_to_bcd_tb;

reg [31:0] ALUoutput;
wire [4:0] D1;
wire [4:0] D2;
wire [4:0] D3;
wire [4:0] D4;
wire [4:0] D5;
wire [4:0] D6;
wire [4:0] D7;
wire [4:0] D8;
wire [4:0] D9;
wire [4:0] D10;

sev_seg_disp disp1(.ALUoutput(ALUoutput), .D1(D1), .D2(D2), .D3(D3), .D4(D4), .D5(D5), .D6(D6), .D7(D7), .D8(D8), .D9(D9), .D10(D10));

initial begin
    ALUoutput = 32'd12345;#20;
    $stop;
end

endmodule