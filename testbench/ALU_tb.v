module ALU_tb;

reg clk;
reg reset;


RISC_V RV1(.clk(clk), .reset(reset));

initial clk = 0;
initial reset = 0;
always #10 clk = ~clk;

initial begin
    #10;
    $stop;
end

endmodule