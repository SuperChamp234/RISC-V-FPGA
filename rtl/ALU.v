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

if(instr[0]==1)
   begin
	ALUoutput<=rs1+rs2;
	end 
	
else if(instr[1]==1)
   begin
   ALUoutput <= rs1 - rs2;
	end
	
else if(instr[2]==1)
   begin
   ALUoutput <= rs1 ^ rs2;
	end
	
else if(instr[3]==1)
    begin
	 ALUoutput <= rs1 | rs2;
	 end
	 
else if(instr[4]==1)
     begin
	  ALUoutput <= rs1 & rs2;
	  end

else if(instr[5]==1)
     begin
	  ALUoutput <= rs1 << rs2;
	  end

else if(instr[6]==1)
     begin
	  ALUoutput <= rs1 >> rs2;
	  end
	  
else if(instr[7]==1)
     begin
	  ALUoutput <= rs1
	  end
	  
else if(instr[8]==1)
     begin
	  ALUoutput <= (rs1 < rs2)?1:0;
	  end

else if(instr[9]==1)
     begin
	  ALUoutput <= 
	  end

else if(instr[10]==1)
     begin
	  ALUoutput <= rs1 + imm;
     end
	  
else if(instr[11]==1)
     begin
	  ALUoutput <= rs1 - imm;
     end
	
else if(instr[12]==1)
     begin
	  ALUoutput <= rs1 | imm;
     end
	
else if(instr[13]==1)
     begin
	  ALUoutput <= rs1 & imm;
     end

else if(instr[14]==1)
     begin
	  ALUoutput <= 
	 
    
    
