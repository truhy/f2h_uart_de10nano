module clk_div
#(
	parameter CLK_CNT_WIDTH = 16
)(
	input rst_n,
	input clk,
	input [CLK_CNT_WIDTH-1:0] div,
	output reg clk_out
);
	reg [CLK_CNT_WIDTH-1:0] counter;
	
	always @ (posedge clk or negedge rst_n) begin
		if(!rst_n) begin
			counter <= 0;
			clk_out <= 0;
		end else if(counter == div) begin
			counter <= 0;
			clk_out <= ~clk_out;
		end else begin
			counter <= counter + 1;
		end
	end
endmodule
