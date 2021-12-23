// (C) 2001-2020 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


`timescale 1 ns / 1 ns

import verbosity_pkg::*;
import avalon_mm_pkg::*;
import mgc_axi_pkg::*;

module soc_system_hps_0_fpga_interfaces
(
   output wire [  0:  0] h2f_rst_n,
   input  wire [  0:  0] f2h_axi_clk,
   input  wire [  7:  0] f2h_AWID,
   input  wire [ 31:  0] f2h_AWADDR,
   input  wire [  3:  0] f2h_AWLEN,
   input  wire [  2:  0] f2h_AWSIZE,
   input  wire [  1:  0] f2h_AWBURST,
   input  wire [  1:  0] f2h_AWLOCK,
   input  wire [  3:  0] f2h_AWCACHE,
   input  wire [  2:  0] f2h_AWPROT,
   input  wire [  0:  0] f2h_AWVALID,
   output wire [  0:  0] f2h_AWREADY,
   input  wire [  4:  0] f2h_AWUSER,
   input  wire [  7:  0] f2h_WID,
   input  wire [ 31:  0] f2h_WDATA,
   input  wire [  3:  0] f2h_WSTRB,
   input  wire [  0:  0] f2h_WLAST,
   input  wire [  0:  0] f2h_WVALID,
   output wire [  0:  0] f2h_WREADY,
   output wire [  7:  0] f2h_BID,
   output wire [  1:  0] f2h_BRESP,
   output wire [  0:  0] f2h_BVALID,
   input  wire [  0:  0] f2h_BREADY,
   input  wire [  7:  0] f2h_ARID,
   input  wire [ 31:  0] f2h_ARADDR,
   input  wire [  3:  0] f2h_ARLEN,
   input  wire [  2:  0] f2h_ARSIZE,
   input  wire [  1:  0] f2h_ARBURST,
   input  wire [  1:  0] f2h_ARLOCK,
   input  wire [  3:  0] f2h_ARCACHE,
   input  wire [  2:  0] f2h_ARPROT,
   input  wire [  0:  0] f2h_ARVALID,
   output wire [  0:  0] f2h_ARREADY,
   input  wire [  4:  0] f2h_ARUSER,
   output wire [  7:  0] f2h_RID,
   output wire [ 31:  0] f2h_RDATA,
   output wire [  1:  0] f2h_RRESP,
   output wire [  0:  0] f2h_RLAST,
   output wire [  0:  0] f2h_RVALID,
   input  wire [  0:  0] f2h_RREADY,
   input  wire [ 27:  0] f2h_sdram0_ADDRESS,
   input  wire [  7:  0] f2h_sdram0_BURSTCOUNT,
   output wire [  0:  0] f2h_sdram0_WAITREQUEST,
   output wire [127:  0] f2h_sdram0_READDATA,
   output wire [  0:  0] f2h_sdram0_READDATAVALID,
   input  wire [  0:  0] f2h_sdram0_READ,
   input  wire [127:  0] f2h_sdram0_WRITEDATA,
   input  wire [ 15:  0] f2h_sdram0_BYTEENABLE,
   input  wire [  0:  0] f2h_sdram0_WRITE,
   input  wire [  0:  0] f2h_sdram0_clk
);




   mgc_axi_slave #(
      .AXI_ID_WIDTH(8),
      .AXI_ADDRESS_WIDTH(32),
      .AXI_WDATA_WIDTH(32),
      .AXI_RDATA_WIDTH(32),
      .index(0)
   ) f2h_axi_slave_inst (
      .ARSIZE(f2h_ARSIZE),
      .AWUSER({3'b000,f2h_AWUSER}),
      .WVALID(f2h_WVALID),
      .RLAST(f2h_RLAST),
      .ACLK(f2h_axi_clk),
      .RRESP(f2h_RRESP),
      .ARREADY(f2h_ARREADY),
      .ARPROT(f2h_ARPROT),
      .ARADDR(f2h_ARADDR),
      .BVALID(f2h_BVALID),
      .ARID(f2h_ARID),
      .BID(f2h_BID),
      .ARBURST(f2h_ARBURST),
      .ARCACHE(f2h_ARCACHE),
      .AWVALID(f2h_AWVALID),
      .WDATA(f2h_WDATA),
      .ARUSER({3'b000,f2h_ARUSER}),
      .RID(f2h_RID),
      .RVALID(f2h_RVALID),
      .WREADY(f2h_WREADY),
      .AWLOCK(f2h_AWLOCK),
      .BRESP(f2h_BRESP),
      .ARLEN(f2h_ARLEN),
      .AWSIZE(f2h_AWSIZE),
      .AWLEN(f2h_AWLEN),
      .BREADY(f2h_BREADY),
      .AWID(f2h_AWID),
      .RDATA(f2h_RDATA),
      .AWREADY(f2h_AWREADY),
      .ARVALID(f2h_ARVALID),
      .WLAST(f2h_WLAST),
      .ARESETn(h2f_rst_n),
      .AWPROT(f2h_AWPROT),
      .WID(f2h_WID),
      .AWADDR(f2h_AWADDR),
      .AWCACHE(f2h_AWCACHE),
      .ARLOCK(f2h_ARLOCK),
      .AWBURST(f2h_AWBURST),
      .RREADY(f2h_RREADY),
      .WSTRB(f2h_WSTRB)
   );

   altera_avalon_reset_source #(
      .ASSERT_HIGH_RESET(0),
      .INITIAL_RESET_CYCLES(1)
   ) h2f_reset_inst (
      .reset(h2f_rst_n),
      .clk('0)
   );

// (C) 2001-2020 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.




wire [11 - 1 : 0] intermediate;
assign intermediate[2:2] = intermediate[9:9];
assign intermediate[6:6] = intermediate[9:9];
assign intermediate[8:8] = intermediate[4:4]|intermediate[7:7];
assign intermediate[10:10] = intermediate[9:9];
assign intermediate[0:0] = ~intermediate[1:1];
assign intermediate[3:3] = intermediate[9:9];
assign intermediate[5:5] = intermediate[9:9];
assign f2h_sdram0_WAITREQUEST[0:0] = intermediate[0:0];
assign intermediate[4:4] = f2h_sdram0_READ[0:0];
assign intermediate[7:7] = f2h_sdram0_WRITE[0:0];
assign intermediate[9:9] = f2h_sdram0_clk[0:0];

cyclonev_hps_interface_fpga2sdram f2sdram(
 .cmd_data_0({
    18'b000000000000000000 // 59:42
   ,f2h_sdram0_BURSTCOUNT[7:0] // 41:34
   ,4'b0000 // 33:30
   ,f2h_sdram0_ADDRESS[27:0] // 29:2
   ,intermediate[7:7] // 1:1
   ,intermediate[4:4] // 0:0
  })
,.cfg_port_width({
    12'b000000000010 // 11:0
  })
,.rd_valid_1({
    f2h_sdram0_READDATAVALID[0:0] // 0:0
  })
,.wr_clk_1({
    intermediate[6:6] // 0:0
  })
,.wr_clk_0({
    intermediate[5:5] // 0:0
  })
,.wr_data_1({
    2'b00 // 89:88
   ,f2h_sdram0_BYTEENABLE[15:8] // 87:80
   ,16'b0000000000000000 // 79:64
   ,f2h_sdram0_WRITEDATA[127:64] // 63:0
  })
,.cfg_cport_type({
    12'b000000000011 // 11:0
  })
,.wr_data_0({
    2'b00 // 89:88
   ,f2h_sdram0_BYTEENABLE[7:0] // 87:80
   ,16'b0000000000000000 // 79:64
   ,f2h_sdram0_WRITEDATA[63:0] // 63:0
  })
,.cfg_rfifo_cport_map({
    16'b0000000000000000 // 15:0
  })
,.cfg_cport_wfifo_map({
    18'b000000000000000000 // 17:0
  })
,.cmd_port_clk_0({
    intermediate[10:10] // 0:0
  })
,.cfg_cport_rfifo_map({
    18'b000000000000000000 // 17:0
  })
,.rd_ready_1({
    1'b1 // 0:0
  })
,.rd_ready_0({
    1'b1 // 0:0
  })
,.rd_clk_1({
    intermediate[3:3] // 0:0
  })
,.cmd_ready_0({
    intermediate[1:1] // 0:0
  })
,.rd_clk_0({
    intermediate[2:2] // 0:0
  })
,.cfg_wfifo_cport_map({
    16'b0000000000000000 // 15:0
  })
,.wrack_ready_0({
    1'b1 // 0:0
  })
,.cmd_valid_0({
    intermediate[8:8] // 0:0
  })
,.rd_data_1({
    f2h_sdram0_READDATA[127:64] // 63:0
  })
,.rd_data_0({
    f2h_sdram0_READDATA[63:0] // 63:0
  })
,.cfg_axi_mm_select({
    6'b000000 // 5:0
  })
);




endmodule 

