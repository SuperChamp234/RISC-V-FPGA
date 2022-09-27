module ALU_tb;

reg clk;
reg reset;
reg [31:0] imem_write_data;
reg rw;

RISC_V RV1(.clk(clk), .reset(reset), .rw(rw), .imem_write_data(imem_write_data));

initial clk = 0;
initial reset = 0;
initial rw = 1;
initial imem_write_data = 32'b0;
always #10 clk = ~clk;

initial begin
    $stop;
end

endmodule