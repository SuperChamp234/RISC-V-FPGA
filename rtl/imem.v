module imem(
	input [31:0] address,
	output [31:0] instruction
)
	reg [31:0] ins_mem [0:64];
	
	assign ins_mem[2] = 32'b00000000000000000000011100010011; //ADDI x14,  x0, 0
	assign ins_mem[1] = 32'b00000000101000000000011000010011; //ADDI x12,  x0, 1010
	assign ins_mem[2] = 32'b00000000111001101000011100110011; //ADD  x14, x13, x14
	assign ins_mem[3] = 32'b00000000000101101000011010010011; //ADDI x13, x13  1
	
	assign instruction = ins_mem[address];
endmodule