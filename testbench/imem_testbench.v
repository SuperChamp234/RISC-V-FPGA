module imem_testbench;

  wire [31:0] instr;
  reg [31:0] addr;
  reg rw;
  reg [31:0] data_in;
  reg clk; reg reset;
  
  imem imem1(.clk(clk), .reset(reset), .address(addr), .rw(rw), .data_out(instr), .data_in(data_in));
	
	initial clk = 0;
   initial reset = 0;
	always #10 clk = ~clk;
	initial begin
		addr = 32'd1; rw=0; data_in = 32'b00000000000101101000011010010011; #100;
      rw = 1;
		addr = 32'd1; #100;
      reset = 1; #100
      reset = 0;
      rw = 1;
		addr = 32'd1; #100;
      addr = 32'd1; rw=0; data_in = 32'b00000000000000000000011100010011; #100;
      rw = 1;
		addr = 32'd1; #100;
	end
	
endmodule