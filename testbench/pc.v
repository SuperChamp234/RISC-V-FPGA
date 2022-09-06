module ProgramCounter_testbench;
    reg clk;
    reg rst;
    reg [31:0] pc;
    wire [31:0] next_pc;	
ProgramCounter PC1(.clk(clk), .rst(rst), .pc(pc), .next_pc(npc));
initial begin
    clk=0;
	 end
    forever begin 
	 #10 clk = ~clk;
end 
 initial begin 
 
   rst=0;
	pc <=32'b00000000000000000000000000000000; #100;
	
	rst=1;
	pc <=32'b00000000000000000000000000000001; #100;
	

	end
	endmodule
	
	
