module rfile_tb;

   reg clk; reg reset;
  
   reg [4:0] rs1;
   reg [4:0] rs2;
   reg [4:0] rd;
   reg rd_valid, rs1_valid, rs2_valid;
	wire signed [31:0] rs1_data;
   wire signed [31:0] rs2_data;
   reg signed [31:0] rd_data;
   
   rfile reg_file_1(.clk(clk), .reset(reset), 
                     .src_rs1(rs1), .src_rs2(rs2), 
                     .rd(rd), .rd_data(rd_data), .rd_valid(rd_valid),
                     .rs1_valid(rs1_valid), .rs2_valid(rs2_valid),
                     .rs1(rs1_data), .rs2(rs2_data));
   
	initial clk = 1;
   initial reset = 0;
	always #10 clk = ~clk;
	initial begin
      rs1_valid = 0; rs2_valid=0;rd_valid = 1;
      rd=5'd1; rd_data = -32'd3; #20;
      rs1_valid = 0; rs2_valid=0;rd_valid = 1;
      rd=5'd2; rd_data = 32'd3; #20;
      rs1_valid = 1; rs2_valid=1;rd_valid = 1;
      rs1=5'd1;rs2=5'd2;
      rd=5'd3; rd_data = 32'd2; #20;
      $stop;
	end
	
endmodule