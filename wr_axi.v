/*
    MIT License

	Copyright (c) 2020 Truong Hy

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
	
	
	
    HDL    : Verilog
    Version: 1.0
	
	Implements writing of specified data and address to ARM AMBA AXI interconnect interface slave.
	
	addr = starting address to write AXI
	data = the data to write out to AXI
	
	AXI spec notes:
	
	Each data transfer (aka burst transfer) is defined by burst size, e.g. if burst size is 2 then it will transfer 2^2 = 4 bytes in each transfer.
	
	The parameter WR_AXI_MAX_BURST is the maximum burst length allowed (number of burst transfers) a range 1 to 16 (AXI 3).
*/
module wr_axi #(
	WR_AXI_ADDR_WIDTH = 32,
	WR_AXI_BUS_WIDTH = 32,
	WR_AXI_MAX_BURST = 1
)(
	input clock,
	input reset,
	
	input enable,
	input [WR_AXI_ADDR_WIDTH-1:0] addr,
	input [WR_AXI_BUS_WIDTH*WR_AXI_MAX_BURST-1:0] data,
	input [3:0] burst_len,
	input [2:0] burst_size,
	input [3:0] burst_mask,
	output reg [1:0] status,  //0 = ready, 1 = wait, 2 = completed ok, 3 = completed error
	
	//Connection to the AXI interface slave..
	//Address write channel registers
	output reg [WR_AXI_ADDR_WIDTH-1:0] aw_addr,
	output reg [3:0] aw_len,
	output reg [2:0] aw_size,
	output reg [1:0] aw_burst,
	output reg [2:0] aw_prot,
	output reg aw_valid,
	input aw_ready,
	//Write data channel registers
	output reg [WR_AXI_BUS_WIDTH-1:0] w_data,
	output reg [3:0] w_strb,
	output reg w_last,
	output reg w_valid,
	input w_ready,
	//Response channel registers
	input [1:0] b_resp,
	input b_valid,
	output reg b_ready
);
	reg [2:0] state;
	reg [3:0] burst_count;

	always @ (posedge clock or posedge reset) begin
		//Reset state?
		if(reset) begin
			burst_count <= 0;
			status <= 0;
			state <= 0;
		end
		else begin

			//State machine
			case(state)
			
				0: begin
					if(enable) begin
						burst_count <= 0;
						status <= 1;
						state <= 1;
					end
				end
			
				//STATE: Process AXI Address Write
				1: begin
					aw_addr <= addr;
					aw_len <= burst_len;  //Number of transfer beats = aw_len + 1 (aka burst length)
					aw_size <= burst_size;  //Per transfer size = 2^aw_size
					aw_burst <= 1;  //1 = auto incrementing burst type
					aw_prot <= 3'b000;
					aw_valid <= 1;
					state <= 2;
				end
				
				//STATE: Wait for AXI Address Write ready
				2: begin
					if(aw_ready) begin
						aw_valid <= 0;
						state <= 3;
					end
				end
				
				//STATE: Process AXI Write data
				3: begin
					w_data <= data[WR_AXI_BUS_WIDTH*burst_count +: WR_AXI_BUS_WIDTH];
					w_strb <= burst_mask;  //Transfer write mask
					if(burst_count == aw_len) begin
						w_last <= 1;
					end
					else begin
						w_last <= 0;
					end
					w_valid <= 1;
					b_ready <= 1;
					state <= 4;
				end
				
				//STATE: Wait for AXI Write ready
				4: begin
					if(w_ready) begin
						//We havn't reached end of burst, i.e. more data to processs?
						if(burst_count < aw_len) begin
							burst_count <= burst_count + 1;
							state <= 3;  //Go repeat for next transfer
						end
						else begin
							if(b_valid) begin
								case(b_resp)
									2'b00: begin
										status <= 2;
									end
									2'b01: begin
										status <= 2;
									end
									default: begin
										status <= 3;  //Error
									end
								endcase
								b_ready <= 0;
								state <= 6;  //Done so stop
							end
							else begin
								state <= 5;  //Wait for Burst Response
							end
						end
						w_valid <= 0;
					end
				end
				
				//STATE: Wait for Burst Response
				5: begin
					if(b_valid) begin
						case(b_resp)
							2'b00: begin
								status <= 2;
							end
							2'b01: begin
								status <= 2;
							end
							default: begin
								status <= 3;  //Error
							end
						endcase
						b_ready <= 0;
						state <= 6;  //Done so stop
					end
				end
				
				//STATE: Wait for enable to turn off, i.e. disable
				6: begin
					status <= 0;
					state <= 0;
				end
				
			endcase
		
		end
	end
endmodule
