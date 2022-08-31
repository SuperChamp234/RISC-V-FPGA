module imem(
	input clk,
	input [4:0] address,
	input [31:0] data_in,
	input rw,
	output [31:0] data_out
	//output data_valid
);
	reg [31:0] ins_mem [15:0];
	reg [31:0] data_out_reg;
	initial begin
		ins_mem[0] <= 32'b00000000000000000000011100010011; //ADDI x14,  x0, 0
		ins_mem[1] <= 32'b00000000101000000000011000010011; //ADDI x12,  x0, 1010
		ins_mem[2] <= 32'b00000000111001101000011100110011; //ADD  x14, x13, x14
		ins_mem[3] <= 32'b00000000000101101000011010010011; //ADDI x13, x13  1
	end
  always @ (posedge clk) begin
	if(~rw) begin
      ins_mem[address] <= data_in;
		data_out_reg = 0;
	end
	else if(rw) begin
		data_out_reg = ins_mem[address];
	end
  end
  assign data_out = data_out_reg;
endmodule