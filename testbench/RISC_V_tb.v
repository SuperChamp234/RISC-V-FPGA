`timescale 1ns/1ps

module RISC_V_tb;

reg clk;
reg reset;
reg rw;

wire [6:0] D1;
wire [6:0] D2;
wire [6:0] D3;
wire [6:0] D4;



RISC_V_main RV1_m(.clk(clk), .reset(reset), .rw(rw),
				.D1(D1),
				.D1(D1),
				.D2(D2),
				.D3(D3),
				.D4(D4)
			 
				);

initial clk = 0;
initial reset = 0;
initial rw = 0;
always #5 clk = ~clk;

initial begin
end

endmodule