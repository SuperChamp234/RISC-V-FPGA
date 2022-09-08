module PC_tb;
  reg clk;
  reg reset;
  reg j_signal;
  reg [31:0] jump;
  wire [31:0] next_pc;
  
  PC pc1(.clk(clk), .rst(reset), .j_signal(j_signal), .jump(jump), .next_pc(next_pc));
  
  initial clk = 0;
  initial reset = 0;
  always #10 clk = ~clk;
  
  initial begin
   reset=0;
   #60
   reset=1;#20;reset=0;
   #40
   j_signal=1;jump=32'd1;#20;j_signal=0;jump=32'd0;
  end
endmodule