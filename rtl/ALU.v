module ALU (
input [31:0] rs1,
input [31:0} rs2,
input imm_valid,
input [37:0} instr_bus,
input [31:0] extend,
input [3:0] ctrl,
output reg zero;

output reg ALUoutput


);
always@(control or rs1 or rs2)
begin
    case(ctrl)
	 4'b0000 begin zero <= 0;
	 ALU_output <= rs1&rs2;
	 4'b0001 begin zero <= 0;
	 ALUoutput <= rs1|rs2;
	 4'b0010 begin zero <= 0;
	 ALUoutput <= rs1+rs2;
	 
