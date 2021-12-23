module clk_div#(CLK_CNT_WIDTH = 16)(input clk, input [CLK_CNT_WIDTH-1:0] div, input reset, output reg clk_out);
	reg [CLK_CNT_WIDTH-1:0] counter;
	
	always @ (posedge clk)
	begin
		if(reset)
		begin
			counter <= 0;
			clk_out <= 1;
		end
		else
		begin
			if(counter == div)
			begin
				counter <= 0;
				clk_out <= ~clk_out;
			end
			else
			begin
				counter <= counter + 1;
			end
		end
	end
endmodule
