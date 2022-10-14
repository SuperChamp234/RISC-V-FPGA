module decoder_tb;

   reg [31:0] instr;
   reg clk;
   
   wire [4:0] rs2;
   wire [4:0] rs1;
   wire [31:0] imm;
   wire [4:0] rd;
   wire [2:0] func3;
   wire [6:0] func7;
   wire rd_valid;
   wire rs1_valid;
   wire rs2_valid;
   wire func3_valid;
   wire func7_valid;
   wire imm_valid;
   wire [36:0] instr_bus;
   
   decoder dc1(.clk(clk), .instr(instr), .rs2(rs2), .rs1(rs1), .imm(imm), .rd(rd), .func3(func3), .func7(func7), .rd_valid(rd_valid), .rs1_valid(rs1_valid), .rs2_valid(rs2_valid), .func3_valid(func3_valid), .imm_valid(imm_valid), .instr_bus(instr_bus));
   
   initial clk = 0;
	always #10 clk = ~clk;
   
   initial begin
      instr=0;#30
      instr = 32'h002080b3; #20;
      instr = 32'hfff38293; #20;
      instr = 32'b11111111110111111111000111101111; #20;
      instr = 32'b00000000000100001000000010010011; #20;
      $stop;
   end
   
endmodule