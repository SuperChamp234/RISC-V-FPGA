module ALU(
input clk,
input [31:0] rs1,
input [31:0] rs2,
input [31:0] imm,
input [36:0] instr_bus,
input [31:0] pc,
output reg read_dmem,
output reg write_dmem,
output reg [31:0] addr_dmem,
output reg [31:0] write_data_dmem,
input [31:0] read_data_dmem,
output reg [31:0] ALUoutput,
output reg ALUready
);

always@(posedge clk) begin
    ALUready <= 0;
    write_data_dmem <= 32'b0;
    addr_dmem <= 32'b0;
    read_dmem <=0;
    write_dmem <=0;
    
    if(instr_bus[0]==1)
    begin
        ALUoutput<=rs1+rs2;
        ALUready <= 1;
    end 
    if(instr_bus[1]==1)
    begin
      ALUoutput <= rs1 - rs2;
      ALUready <= 1;
    end
        
    if(instr_bus[2]==1)
    begin
      ALUoutput <= rs1 ^ rs2;
      ALUready <= 1;
    end
        
    if(instr_bus[3]==1)
    begin
        ALUoutput <= rs1 | rs2;
        ALUready <= 1;
    end
        
    if(instr_bus[4]==1)
    begin
        ALUoutput <= rs1 & rs2;
        ALUready <= 1;
    end

    if(instr_bus[5]==1)
    begin
        ALUoutput <= rs1 << rs2;
        ALUready <= 1;
    end

    if(instr_bus[6]==1)
    begin
        ALUoutput <= rs1 >> rs2;
        ALUready <= 1;
    end
            
    if(instr_bus[8]==1)
    begin
        ALUoutput <= (rs1 < rs2)?1:0;
        ALUready <= 1;
    end

    if(instr_bus[10]==1)
    begin
        ALUoutput <= rs1 + imm;
        ALUready <= 1;
    end
        
    if(instr_bus[11]==1)
    begin
        ALUoutput <= rs1 - imm;
        ALUready <= 1;
    end
        
    if(instr_bus[12]==1)
    begin
        ALUoutput <= rs1 | imm;
        ALUready <= 1;
    end
        
    if(instr_bus[13]==1)
    begin
        ALUoutput <= rs1 & imm;
        ALUready <= 1;
    end

    if(instr_bus[14]==1) begin //slli
        ALUoutput <= rs1 << imm[4:0];
        ALUready <= 1;
    end

    if(instr_bus[15]==1) begin //srli
        ALUoutput <= rs1 >> read_data_dmem[4:0];
        ALUready <= 1;
    end

    if(instr_bus[16]==1) begin //srai //needs review
        ALUoutput <= rs1 >> read_data_dmem[4:0];
        ALUready <= 1;
    end

    if(instr_bus[17]==1) begin //slti
        ALUoutput <= rs1 < (~imm+1'b1) ? 1:0;
        ALUready <= 1;
    end

    if(instr_bus[18]==1) begin //sltiu
        ALUoutput <= rs1 < imm ? 1:0;
        ALUready <= 1;
    end

    if(instr_bus[19] == 1) begin
        read_dmem <= 1; addr_dmem <= rs1 + imm;
        ALUoutput <= read_data_dmem[7:0];
        ALUready <= 1;
    end

    if(instr_bus[20] == 1) begin
        read_dmem <= 1; addr_dmem <= rs1 + imm;
        ALUoutput <= read_data_dmem[15:0];
        ALUready <= 1;
    end

    if(instr_bus[21] == 1) begin //lw
        read_dmem <= 1; addr_dmem <= rs1 + imm;
        ALUoutput <= read_data_dmem[31:0];
        ALUready <= 1;
    end

    if(instr_bus[22] == 1) begin //lbu
        read_dmem <= 1; addr_dmem <= rs1 + imm;
        ALUoutput <= {24'b0,read_data_dmem[7:0]};
        ALUready <= 1;
    end

    if(instr_bus[23] == 1) begin //lhu
        read_dmem <= 1; addr_dmem <= rs1 + imm;
        ALUoutput <= {read_data_dmem[15:0]};
        ALUready <= 1;
    end

    if(instr_bus[24] == 1) begin //sb
        write_dmem <= 1; addr_dmem <= rs1 + imm;
        write_data_dmem <= {rs2[7:0]};
        ALUoutput <= {rs2[7:0]};
        ALUready <= 1;
    end
    if(instr_bus[25] == 1) begin //sh
        write_dmem<= 1; addr_dmem <= rs1 + imm;
        write_data_dmem <= {rs2[15:0]};
        ALUoutput <= {rs2[15:0]};
        ALUready <= 1;
    end
    if(instr_bus[26] == 1) begin //sh
        write_dmem<= 1; addr_dmem <= rs1 + imm;
        write_data_dmem <= {rs2[31:0]};
        ALUoutput <= {rs2[31:0]};
        ALUready <= 1;
    end
    if(instr_bus[35] == 1) begin //lui
        ALUoutput <= imm << 12;
        ALUready <= 1;
    end
    if(instr_bus[36] == 1) begin //auipc
      ALUoutput <= pc + (imm << 12);
      ALUready <= 1;
    end   
end

endmodule


    
    
