module RISC_V_main(
	input clk,
	input rw,
	input reset,
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

reg divided_clk;
reg[32:0] counter_value;
parameter div_value = 32'd10000000;	

//parameter div_value = 32'd2; debug purposes(software)

initial begin
    divided_clk = 1'b1;
    counter_value = 32'b0;
end
//div_value = 50MHz/(2*desired freq)

    always @ (posedge clk) begin
		  counter_value <= counter_value + 32'b1;
        if(counter_value >= (div_value - 1)) begin
            counter_value <= 32'b0;
			end
        divided_clk <= (counter_value < div_value/2) ? 1'b1 : 1'b0;
    end

RISC_V RV1(.clk(divided_clk), .reset(reset), .rw(rw),
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
endmodule
