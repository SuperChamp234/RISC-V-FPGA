`timescale 1ns/1ps

module RISC_V_tb;

reg clk;
reg reset;
reg rw;

wire D1BB0;
wire D1BB1;
wire D1BB2;
wire D1BB3;
wire D1BB4;
wire D1BB5;
wire D1BB6;

wire D2BB0;
wire D2BB1;
wire D2BB2;
wire D2BB3;
wire D2BB4;
wire D2BB5;
wire D2BB6;

wire D3BB0;
wire D3BB1;
wire D3BB2;
wire D3BB3;
wire D3BB4;
wire D3BB5;
wire D3BB6;

wire D4BB0;
wire D4BB1;
wire D4BB2;
wire D4BB3;
wire D4BB4;
wire D4BB5;
wire D4BB6;


RISC_V RV1(.clk(clk), .reset(reset), .rw(rw),
				.D1BB0(D1BB0),
				.D1BB1(D1BB1),
				.D1BB2(D1BB2),
				.D1BB3(D1BB3),
				.D1BB4(D1BB4),
				.D1BB5(D1BB5),
				.D1BB6(D1BB6),

				.D2BB0(D2BB0),
				.D2BB1(D2BB1),
				.D2BB2(D2BB2),
				.D2BB3(D2BB3),
				.D2BB4(D2BB4),
				.D2BB5(D2BB5),
				.D2BB6(D2BB6),

				.D3BB0(D3BB0),
				.D3BB1(D3BB1),
				.D3BB2(D3BB2),
				.D3BB3(D3BB3),
				.D3BB4(D3BB4),
				.D3BB5(D3BB5),
				.D3BB6(D3BB6),

				.D4BB0(D4BB0),
				.D4BB1(D4BB1),
				.D4BB2(D4BB2),
				.D4BB3(D4BB3),
				.D4BB4(D4BB4),
				.D4BB5(D4BB5),
				.D4BB6(D4BB6)
			 
				);

initial clk = 0;
initial reset = 0;
initial rw = 0;
always #5 clk = ~clk;

initial begin
end

endmodule