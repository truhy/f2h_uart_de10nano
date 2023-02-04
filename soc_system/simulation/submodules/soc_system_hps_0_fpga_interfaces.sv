// (C) 2001-2022 Intel Corporation. All rights reserved.
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
   input  wire [  0:  0] f2h_RREADY
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

endmodule 

