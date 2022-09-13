module decoder(
   input clk,
   input  [31:0] instr,
   output reg [4:0] rs2,
   output reg [4:0] rs1,
   output signed [31:0] imm,
   output reg [4:0] rd,
   output reg [2:0] func3,
   output reg [6:0] func7,
   output rd_valid,
   output rs1_valid,
   output rs2_valid,
   output func3_valid,
   output func7_valid,
   output imm_valid,
   output [37:0] instr_bus
);
     reg is_r_instr, is_u_instr, is_i_instr, is_s_instr, is_b_instr, is_j_instr, is_i1_instr, is_i2_instr;
     reg [6:0] opcode;
     reg [7:0] i; 
     
   always @ (posedge clk) begin
      
      //determine the type of instruction
      is_r_instr <= instr[6:0] == 7'b0110011;
      is_i_instr <= (instr[6:0] == 7'b0010011) || (instr[6: 0] == 7'b1100111) || (instr[6:0] == 7'b0000011);
      is_i1_instr <= instr[6:0] == 7'b0010011;
      is_i2_instr <= instr[6:0] == 7'b0000011;
      is_s_instr <= instr[6:0] == 7'b0100011;
      is_b_instr <= instr[6:0] == 7'b1100011;
      is_j_instr <= instr[6:0] == 7'b1101111;
      is_u_instr <= (instr[6:0] == 7'b0010111) || (instr[6:0] == 7'b0110111);
      
      //store the different types of existing fields
      rs2 <= instr[24:20];
      rs1 <= instr[19:15];
      func3 <= instr[14:12];
      rd <= instr[11:7];
      func7 <= instr[31:25];
      opcode <= instr[6:0];      
      
    end
    
    decoder_ext Extension1( .imm(imm), .instr(instr), .is_r_instr(is_r_instr), .is_s_instr(is_s_instr), .is_i_instr(is_i_instr), .is_b_instr(is_b_instr), .is_u_instr(is_u_instr), .is_j_instr(is_j_instr), .rd_valid(rd_valid), .rs1_valid(rs1_valid), .rs2_valid(rs2_valid), .func3_valid(func3_valid), .func7_valid(func7_valid), .imm_valid(imm_valid), .instr_bus(instr_bus));
      
endmodule
   