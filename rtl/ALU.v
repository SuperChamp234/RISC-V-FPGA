module ALU(
input [31:0] rs1,
input [31:0] rs2,
input imm_valid,
input [31:0] imm,
input [36:0] instr,
input [31:0] extend,
input [3:0] ctrl,
input [31:0] PC,
output reg zero,
output reg [31:0] ALUoutput

);
always@(*)
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
	 
	  
else if(instr[8]==1)
     begin
	  ALUoutput <= (rs1 < rs2)?1:0;
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

else if(instr[16]==1)
     begin
	  ALUoutput <= (rs1 < imm)?1:0;
	  end

else if(instr[17]==1)
     begin 
	  ALUoutput <= rs1+imm;
	  
	  end
	  
else if(instr[27]==1)
     begin
	  if
	  (rs1==rs2)
	  ALUoutput <= PC + imm;
	  end
	 
	  
	  
else if(instr[28]==1)
     begin
	  if
	  (rs1!=rs2)
	  ALUoutput <= PC + imm;
	  end
	
	  
else if(instr[29]==1)
     begin
	  if(rs1<rs2)
	  ALUoutput <= PC + imm;
	  
	  end

	  
else if(instr[30]==1)
     begin
	  if(rs1==rs2)
	  ALUoutput <= PC + imm;
	  end
	  
	  
else if(instr[31]==1)
     begin
	  if(rs1==rs2)
	  ALUoutput <= PC + imm;
	  end
	  
	  
else if(instr[32]==1)
     begin
	  if(rs1>=rs2)
	  ALUoutput <= PC + imm;
	  end
	  
	  
else if(instr[33]==1)
     begin
	  if(rs1<rs2)
	  ALUoutput <= PC + imm;
	  end

	  
else if(instr[34]==1)
     begin
	  ALUoutput <= PC + 4;
	  end
	  
else if(instr[35]==1)
     begin
	  ALUoutput <= PC + 4;
	  end
	 

endmodule


    
    
