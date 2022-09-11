module ALU (
input [31:0] rs1,
input [31:0} rs2,
input imm_valid,
input [36:0} instr_bus,
input [31:0] extend,
input [3:0] ctrl,
output reg zero,
output reg ALUoutput


);
always@(ctrl or rs1 or rs2)
begin
    case(ctrl)
	 37'b000000000000000000000000000000000000000000 begin zero <= 0;
	 ALU_output <= rs1&rs2;
	 37'b000000000000000000000000000000000000000001 begin zero <= 0;
	 ALUoutput <= rs1|rs2;
	 37'b000000000000000000000000000000000000000010 begin zero <= 0;
	 ALUoutput <= rs1+rs2;
	 37'b000000000000000000000000000000000000001000 begin zero <= 0;
         ALUoutput <= rs1-rs2;
         37'b000000000000000000000000000000000000100000 begin zero <= 0;
         ALUoutput <= rs1&imm_valid;
         37'b000000000000000000000000000000000010000000 begin zero <= 0;
         ALUoutput <= rs2&imm_valid;
	 37'b000000000000000000000000000000001000000000 begin zero <= 0;
         ALUoutput <= rs2|imm_valid;
         37'b000000000000000000000000000000010000000000 begin zero <= 0;
	 ALUoutput <= rs1|imm_valid;
         37'b000000000000000000000000000001000000000000 begin zero <= 0;
       
