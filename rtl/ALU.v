module ALU(
input [31:0] rs1,
input [31:0] rs2,
input [31:0] imm,
input [37:0] instr_bus,
output reg read,
output reg write,
output reg [31:0] addr,
output reg [31:0] write_data_mem,
input [31:0] mem,
output reg [31:0] ALUoutput
);

always@(*) begin
    if(instr_bus[0]==1)
    begin
        ALUoutput<=rs1+rs2;
    end 
    else if(instr_bus[1]==1)
    begin
    ALUoutput <= rs1 - rs2;
    end
        
    else if(instr_bus[2]==1)
    begin
    ALUoutput <= rs1 ^ rs2;
    end
        
    else if(instr_bus[3]==1)
    begin
        ALUoutput <= rs1 | rs2;
    end
        
    else if(instr_bus[4]==1)
    begin
        ALUoutput <= rs1 & rs2;
    end

    else if(instr_bus[5]==1)
    begin
        ALUoutput <= rs1 << rs2;
    end

    else if(instr_bus[6]==1)
    begin
        ALUoutput <= rs1 >> rs2;
    end
            
    else if(instr_bus[8]==1)
    begin
        ALUoutput <= (rs1 < rs2)?1:0;
    end

    else if(instr_bus[10]==1)
    begin
        ALUoutput <= rs1 + imm;
    end
        
    else if(instr_bus[11]==1)
    begin
        ALUoutput <= rs1 - imm;
    end
        
    else if(instr_bus[12]==1)
    begin
        ALUoutput <= rs1 | imm;
    end
        
    else if(instr_bus[13]==1)
    begin
        ALUoutput <= rs1 & imm;
    end

    else if(instr_bus[14]==1) begin //slli
        ALUoutput <= rs1 << imm[4:0];
    end

    else if(instr_bus[15]==1) begin //srli
        ALUoutput <= rs1 >> mem[4:0];
    end

    else if(instr_bus[16]==1) begin //srai //needs review
        ALUoutput <= rs1 >> mem[4:0];
    end

    else if(instr_bus[17]==1) begin //slti
        ALUoutput <= rs1 < (~imm+1'b1) ? 1:0;
    end

    else if(instr_bus[18]==1) begin //sltiu
        ALUoutput <= rs1 < imm ? 1:0;
    end

    else if(instr_bus[19] == 1) begin
        read <= 1; addr <= rs1 + imm;
        ALUoutput <= mem[7:0];
    end

    else if(instr_bus[20] == 1) begin
        read <= 1; addr <= rs1 + imm;
        ALUoutput <= mem[15:0];
    end

    else if(instr_bus[21] == 1) begin //lw
        read <= 1; addr <= rs1 + imm;
        ALUoutput <= mem[31:0];
    end

    else if(instr_bus[22] == 1) begin //lbu
        read <= 1; addr <= rs1 + imm;
        ALUoutput <= {24'b0,mem[7:0]};
    end

    else if(instr_bus[23] == 1) begin //lhu
        read <= 1; addr <= rs1 + imm;
        ALUoutput <= {mem[15:0]};
    end

    else if(instr_bus[24] == 1) begin //sb
        write<= 1; addr <= rs1 + imm;
        write_data_mem <= {mem[7:0]};
        ALUoutput <= {mem[7:0]};
    end
    else if(instr_bus[25] == 1) begin //sh
        write<= 1; addr <= rs1 + imm;
        write_data_mem <= {mem[15:0]};
        ALUoutput <= {mem[15:0]};
    end
    else if(instr_bus[26] == 1) begin //sh
        write<= 1; addr <= rs1 + imm;
        write_data_mem <= {mem[31:0]};
        ALUoutput <= {mem[31:0]};
    end
    else if(instr_bus[35] == 1) begin //lui
        ALUoutput <= imm << 12;
    end
    else
        ALUoutput <= 32'b0;
        write_data_mem <= 32'b0;
        addr <= 32'b0;
        read <=0;
        write <=0;
end

endmodule


    
    
