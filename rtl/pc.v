module ProgramCounter(input clk,
    input rst,
    input [31:0] pc,
    output reg [31:0] next_pc
	 
	);
	 
always@(posedge clk)

    begin

        if(rst!=0)
		  
            begin
                next_pc <= pc + 1;
            end
				
        else if(rst!=1)
		  
            begin
                next_pc <= 0;
				end
   
		   else 
			     
				 
				  next_pc <= pc;
				
		  end
endmodule
