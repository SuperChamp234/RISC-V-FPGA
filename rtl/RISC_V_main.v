module RISC_V_main(
	input clk,
	input rw,
	input reset,
	output [6:0] D1,
	output [6:0] D2,
	output [6:0] D3,
	output [6:0] D4
);

reg divided_clk;
reg [32:0] counter_value;
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
				.D1(D1),
				.D2(D2),
				.D3(D3),
				.D4(D4)
			 
				);
endmodule
