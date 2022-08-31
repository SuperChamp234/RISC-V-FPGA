module imem_testbench;

  wire [31:0] instr;
  reg [4:0] addr;
  reg rw;
  reg [31:0] data_in;
  reg clk;
  
  imem imem1(.clk(clk), .address(addr), .rw(rw), .data_out(instr), .data_in(data_in));
	
	initial clk = 0;
	always #10 clk = ~clk;
	initial begin
		rw = 1; 
		addr = 5'd0; #100;
		addr = 5'd1; #100;
		addr = 5'd2; #100;
		addr = 5'd1; rw=0; data_in = 32'b00000000000101101000011010010011; #100;
      rw = 1;
		addr = 5'd1; #100;
	end
	
endmodule