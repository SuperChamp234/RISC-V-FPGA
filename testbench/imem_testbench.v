module imem_testbench;

  wire [31:0] instr;
  reg [4:0] addr;
  imem imem1(.address(addr), .rd(1), .data_out(instr), .wr(0), .data_in(0));
	
	initial begin
		addr = 5'd0; #100;
		addr = 5'd1; #100;
		addr = 5'd2; #100;
		addr = 5'd3; #100;
	end
	
endmodule