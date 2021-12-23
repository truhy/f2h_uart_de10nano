module debounce#(CLK_CNT_WIDTH = 24, SW_WIDTH = 1)(input clk, input [CLK_CNT_WIDTH-1:0] div, input [SW_WIDTH-1:0] sw, output slow_clk_out, output reg [SW_WIDTH-1:0] sw_out);
	always @ (posedge slow_clk_out)
	begin
		sw_out <= sw;
	end
	
	clk_div #(CLK_CNT_WIDTH) clk_div_inst(
		clk,
		div,
		0,
		slow_clk_out
	);
endmodule
