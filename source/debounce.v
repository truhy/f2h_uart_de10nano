module debounce
#(
	parameter CLK_CNT_WIDTH = 24,
	parameter SW_WIDTH = 1
)(
	input rst_n,
	input clk,
	input [CLK_CNT_WIDTH-1:0] div,
	input [SW_WIDTH-1:0] sw_in,
	output reg [SW_WIDTH-1:0] sw_out,
	output slow_clk_out
);
	clk_div
	#(.CLK_CNT_WIDTH(CLK_CNT_WIDTH))
	clk_div_inst(
		.rst_n(rst_n),
		.clk(clk),
		.div(div),
		.clk_out(slow_clk_out)
	);

	always @ (posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			sw_out <= 0;
		end else if(slow_clk_out) begin
			sw_out <= sw_in;
		end
	end
endmodule
