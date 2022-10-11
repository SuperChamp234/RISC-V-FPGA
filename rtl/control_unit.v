module control_unit(
    input clk,
    input signed [31:0] rs2_value,
    input signed [31:0] rs1_value,
    input signed [31:0] imm,
    input rs1_valid,
    input rs2_valid,
    input [36:0] instr_bus,
    input [31:0] pc,
    input [31:0] ALUoutput,
    input ALUready,
    input rd_valid,
    input [6:0] opcode,
    output reg rs1_read,
    output reg rs2_read,
    output reg [31:0] next_pc,
    output reg pc_j_valid,
    output reg [31:0] rd_data,
    output reg rd_write,
    output reg ALUenable,
    output reg [36:0] ALU_instr_bus,
	 output reg [31:0] display_out,
	 input [2:0] func3,
	 input [6:0] func7,
	 input imm_valid
);

   reg [1:0] state = 2'b11;
   reg [31:0] next_pc_hold;
   reg [31:0] pc_j_valid_hold;
    
    always @ (posedge clk) begin
    pc_j_valid <= 0;
    next_pc <= 0;
    rd_write <=0;
    ALUenable <=0;
    rs1_read <= rs1_valid; rs2_read <= rs2_valid;
        case(state)
            2'b00, 2'b01:
                case(opcode)
                    //R         I           I           U           U           S
                    7'b0110011, 7'b0010011, 7'b0000011, 7'b0010111, 7'b0110111, 7'b0100011: begin
                        ALUenable <= 1; ALU_instr_bus <= instr_bus;
                    end
                    //B                      
                    7'b1100011: begin
                        if(instr_bus[27] == 1) begin //beq
                            if(rs1_value == rs2_value) begin
                                next_pc_hold <= pc + imm;
                                pc_j_valid_hold <= 1;
                            end
                        end
                        if(instr_bus[28] == 1) begin //bne
                            if(rs1_value != rs2_value) begin
                                next_pc_hold <= pc + imm;
                                pc_j_valid_hold <= 1;
                            end
                        end
                        if(instr_bus[29] == 1) begin //blt
                            if(rs1_value < rs2_value) begin
                                next_pc_hold <= pc + imm;
                                pc_j_valid_hold <= 1;
                            end
                        end
                        if(instr_bus[30] == 1) begin //bge
                            if(rs1_value >= rs2_value) begin
                                next_pc_hold <= pc + imm;
                                pc_j_valid_hold <= 1;
                            end
                        end
                        if(instr_bus[31] == 1) begin //bltu - review required
                            if(rs1_value < rs2_value) begin
                                next_pc_hold <= pc + {19'b0 , imm[12:0]};
                                pc_j_valid_hold <= 1;
                            end
                        end
                        if(instr_bus[32] == 1) begin //bgeu - review required
                            if(rs1_value >= rs2_value) begin
                                next_pc_hold <= pc + {19'b0 , imm[12:0]};
                                pc_j_valid_hold <= 1;
                            end
                        end
                        if(instr_bus[33] == 1)begin //jal
                            next_pc_hold <= pc + imm;
                            pc_j_valid_hold <= 1;
                        end
                        if(instr_bus[34] == 1) begin //jalr
                            next_pc_hold <= rs1_value + imm;
                            pc_j_valid_hold <= 1;
                        end
                    end
                    //J         I3
                    7'b1101111, 7'b1100111: begin
                        ALUenable <= 1; ALU_instr_bus <= instr_bus;
                        if(instr_bus[33] == 1) begin
                            next_pc_hold <= pc + imm;
                            pc_j_valid_hold <= 1;
                        end
                        if(instr_bus[34] == 1) begin
                            next_pc_hold <= rs1_value + imm;
                            pc_j_valid_hold <= 1;
                        end
                    end
                endcase
            2'b10: begin
               next_pc <= next_pc_hold;
               pc_j_valid <= pc_j_valid_hold;
               if(ALUready) begin 
                    if(rd_valid) begin
                        rd_write <= 1;
                        rd_data <= ALUoutput;
                        ALUenable <=0;
                        ALU_instr_bus <= 37'b0;
                    end
                end
					 case(opcode)
                    //R         I           I           I           U           U           S
                    7'b0110011, 7'b0010011, 7'b0000011, 7'b1100111, 7'b0010111, 7'b0110111, 7'b0100011: begin
                        display_out <= ALUoutput;
                    end
					 endcase
            end
            2'b11: begin
                next_pc <= 0;
                pc_j_valid <= 0;
                pc_j_valid_hold <=0;
            end
        endcase
    state <= state + 1;
    end
endmodule