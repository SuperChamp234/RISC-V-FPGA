module decoder(
   input clk,
   input  [31:0] instr,
   output reg [4:0] rs2,
   output reg [4:0] rs1,
   output reg [31:0] imm,
   output reg [4:0] rd,
   output reg [2:0] func3,
   output reg [6:0] func7,
   output reg rd_valid,
   output reg rs1_valid,
   output reg rs2_valid,
   output reg func3_valid,
   output reg func7_valid,
   output reg imm_valid
);
     reg is_r_instr, is_u_instr, is_i_instr, is_s_instr, is_b_instr, is_j_instr;
//   reg [4:0] rs2_reg, rs1_reg, rd_reg;
//   reg [2:0] func3_reg;
//   reg [6:0] func7_reg;
     reg [6:0] opcode;

   always @ (instr) begin
      //determine the type of instruction
      is_r_instr <= instr[6:2]  === 5'b0x101;
      is_i_instr <= instr[6:2]  === 5'b0000x || instr[6:2] === 5'b001x0 || instr[6:2] === 5'b11001;
      is_s_instr <= instr[6:2]  === 5'b0100x;
      is_b_instr <= instr[6:2] === 5'b11000;
      is_j_instr <= instr[6:2] === 5'b11011;
      is_u_instr <= instr[6:2]  === 5'b0x101;
      
      //store the different types of existing fields
      rs2 <= instr[24:20];
      rs1 <= instr[19:15];
      func3 <= instr[14:12];
      rd <= instr[11:7];
      func7 <= instr[31:25];
      opcode <= instr[6:0];
      
      //determine the fields above are valid in the instruction or not
      func7_valid = is_r_instr;
      rs2_valid = is_r_instr || is_s_instr || is_b_instr;
      rs1_valid = is_r_instr || is_i_instr || is_s_instr || is_b_instr;
      rd_valid = is_r_instr || is_i_instr || is_u_instr || is_j_instr;
      func3_valid = rs1_valid;
      imm_valid = ~is_r_instr;
   
      imm[31:0] = is_i_instr ? {   {21{instr[31]}},  instr[30:20]  } :
                is_s_instr ? {{21{instr[31]}}, instr[30:25], instr[11:7]} :
                is_b_instr ? { {20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0} :
                is_u_instr ? { instr[31:12], 12'b0 } :
                is_j_instr ? { { { { { {12{instr[31]}} , instr[19:12] } , instr[20] } , instr[30:25] } , instr[24:21] }, 1'b0} :
                32'b0;
      
   end
      
endmodule
   