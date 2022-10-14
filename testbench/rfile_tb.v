module rfile_tb;

   reg clk; reg reset;
  
   reg [31:0] rs1_a;
   reg [31:0] rs2_a;
   reg [31:0] rd;
   reg rd_write, read_rs1, read_rs2;
	wire signed [31:0] rs1_data;
   wire signed [31:0] rs2_data;
   reg signed [31:0] rd_data;
   
   rfile reg_file_1(.clk(clk), .reset(reset), 
                     .rs1_addr(rs1_a), .rs2_addr(rs2_a), 
                     .rd(rd), .rd_data(rd_data), .rd_write(rd_write),
                     .read_rs1(read_rs1), .read_rs2(read_rs2),
                     .rs1(rs1_data), .rs2(rs2_data));
   
	initial clk = 1;
   initial reset = 0;
	always #10 clk = ~clk;
	initial begin
      read_rs1 = 0; read_rs2=0;rd_write = 1;
      rd=32'd1; rd_data = -32'd3; #20;
      read_rs1 = 0; read_rs2=0;rd_write = 1;
      rd=32'd2; rd_data = 32'd3; #20;
      read_rs1 = 1; read_rs2=1;rd_write = 1;
      rs1_a=32'd1;rs2_a=32'd2;
      rd=32'd3; rd_data = 32'd2; #20;
      read_rs1 = 1; read_rs2=1;rd_write = 0;
      rs1_a=32'd1;rs2_a=32'd2; #20
      $stop;
	end
	
endmodule