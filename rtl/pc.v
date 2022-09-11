module ProgramCounter(input clk,
    input rst,
    input[7:0] pc,
     input j_signal,
    output reg [7:0] next_pc
	 
	);
				 
always@(clk)

    begin

        if(j_signal <= 0)
		  
            begin
                next_pc <= pc + 1;
            end
				
	else if(rst<=0 && j_signal<=0)
	  begin
	 next_pc <= next_pc +1 ;
	  end
				 
        else if(clk!=1)
		  
            begin
                next_pc <= 0;
	     end
   
	     else 
	      next_pc <= pc;
		
		 end
endmodule
