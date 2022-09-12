module dmem_tb;

  wire [31:0] data_out;
  reg [4:0] r_addr;
  reg [4:0] w_addr;
  reg read; reg write;
  reg [31:0] data_in;
  reg clk;
  
  dmem dmem1(.clk(clk), .r_addr(r_addr), .w_addr(w_addr), .read(read), .write(write), .data_out(data_out), .data_in(data_in));
	
	initial clk = 1;
	always #10 clk = ~clk;
	initial begin
		read = 0; write = 1; //write 10 to x1
      w_addr = 5'd1; data_in = 32'd10; #20;
      read = 0; write = 1; //write 15 to x2
      w_addr = 5'd2; data_in = 32'd15; #20;
      
      write = 0; read = 1; //single read from x1
      r_addr = 5'd1; data_in = 0; #20
      
      read = 1; write = 1; //read from x2 and write to x1
      r_addr = 5'd2;
      w_addr = 5'd1; data_in = 32'd20; #20
      
      $stop;
	end
	
endmodule