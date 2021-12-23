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


// $Id: //acds/main/ip/sopc/components/verification/altera_tristate_conduit_bfm/altera_tristate_conduit_bfm.sv.terp#7 $
// $Revision: #7 $
// $Date: 2010/08/05 $
// $Author: klong $
//-----------------------------------------------------------------------------
// =head1 NAME
// altera_conduit_bfm
// =head1 SYNOPSIS
// Bus Functional Model (BFM) for a Standard Conduit BFM
//-----------------------------------------------------------------------------
// =head1 DESCRIPTION
// This is a Bus Functional Model (BFM) for a Standard Conduit Master.
// This BFM sampled the input/bidirection port value or driving user's value to 
// output ports when user call the API.  
// This BFM's HDL is been generated through terp file in Qsys/SOPC Builder.
// Generation parameters:
// output_name:                                       soc_system_hps_0_hps_io_border_hps_io
// role:width:direction:                              hps_io_sdio_inst_CMD:1:bidir,hps_io_sdio_inst_D0:1:bidir,hps_io_sdio_inst_D1:1:bidir,hps_io_sdio_inst_CLK:1:output,hps_io_sdio_inst_D2:1:bidir,hps_io_sdio_inst_D3:1:bidir,hps_io_uart0_inst_RX:1:input,hps_io_uart0_inst_TX:1:output
// 0
//-----------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module soc_system_hps_0_hps_io_border_hps_io
(
   sig_hps_io_sdio_inst_CMD,
   sig_hps_io_sdio_inst_D0,
   sig_hps_io_sdio_inst_D1,
   sig_hps_io_sdio_inst_CLK,
   sig_hps_io_sdio_inst_D2,
   sig_hps_io_sdio_inst_D3,
   sig_hps_io_uart0_inst_RX,
   sig_hps_io_uart0_inst_TX
);

   //--------------------------------------------------------------------------
   // =head1 PINS 
   // =head2 User defined interface
   //--------------------------------------------------------------------------
   inout wire sig_hps_io_sdio_inst_CMD;
   inout wire sig_hps_io_sdio_inst_D0;
   inout wire sig_hps_io_sdio_inst_D1;
   output sig_hps_io_sdio_inst_CLK;
   inout wire sig_hps_io_sdio_inst_D2;
   inout wire sig_hps_io_sdio_inst_D3;
   input sig_hps_io_uart0_inst_RX;
   output sig_hps_io_uart0_inst_TX;

   // synthesis translate_off
   import verbosity_pkg::*;
   
   typedef logic ROLE_hps_io_sdio_inst_CMD_t;
   typedef logic ROLE_hps_io_sdio_inst_D0_t;
   typedef logic ROLE_hps_io_sdio_inst_D1_t;
   typedef logic ROLE_hps_io_sdio_inst_CLK_t;
   typedef logic ROLE_hps_io_sdio_inst_D2_t;
   typedef logic ROLE_hps_io_sdio_inst_D3_t;
   typedef logic ROLE_hps_io_uart0_inst_RX_t;
   typedef logic ROLE_hps_io_uart0_inst_TX_t;

   logic sig_hps_io_sdio_inst_CMD_oe;
   logic sig_hps_io_sdio_inst_CMD_oe_temp = 0;
   reg sig_hps_io_sdio_inst_CMD_temp;
   reg sig_hps_io_sdio_inst_CMD_out;
   logic [0 : 0] sig_hps_io_sdio_inst_CMD_in;
   logic [0 : 0] sig_hps_io_sdio_inst_CMD_local;
   logic sig_hps_io_sdio_inst_D0_oe;
   logic sig_hps_io_sdio_inst_D0_oe_temp = 0;
   reg sig_hps_io_sdio_inst_D0_temp;
   reg sig_hps_io_sdio_inst_D0_out;
   logic [0 : 0] sig_hps_io_sdio_inst_D0_in;
   logic [0 : 0] sig_hps_io_sdio_inst_D0_local;
   logic sig_hps_io_sdio_inst_D1_oe;
   logic sig_hps_io_sdio_inst_D1_oe_temp = 0;
   reg sig_hps_io_sdio_inst_D1_temp;
   reg sig_hps_io_sdio_inst_D1_out;
   logic [0 : 0] sig_hps_io_sdio_inst_D1_in;
   logic [0 : 0] sig_hps_io_sdio_inst_D1_local;
   reg sig_hps_io_sdio_inst_CLK_temp;
   reg sig_hps_io_sdio_inst_CLK_out;
   logic sig_hps_io_sdio_inst_D2_oe;
   logic sig_hps_io_sdio_inst_D2_oe_temp = 0;
   reg sig_hps_io_sdio_inst_D2_temp;
   reg sig_hps_io_sdio_inst_D2_out;
   logic [0 : 0] sig_hps_io_sdio_inst_D2_in;
   logic [0 : 0] sig_hps_io_sdio_inst_D2_local;
   logic sig_hps_io_sdio_inst_D3_oe;
   logic sig_hps_io_sdio_inst_D3_oe_temp = 0;
   reg sig_hps_io_sdio_inst_D3_temp;
   reg sig_hps_io_sdio_inst_D3_out;
   logic [0 : 0] sig_hps_io_sdio_inst_D3_in;
   logic [0 : 0] sig_hps_io_sdio_inst_D3_local;
   logic [0 : 0] sig_hps_io_uart0_inst_RX_in;
   logic [0 : 0] sig_hps_io_uart0_inst_RX_local;
   reg sig_hps_io_uart0_inst_TX_temp;
   reg sig_hps_io_uart0_inst_TX_out;

   //--------------------------------------------------------------------------
   // =head1 Public Methods API
   // =pod
   // This section describes the public methods in the application programming
   // interface (API). The application program interface provides methods for 
   // a testbench which instantiates, controls and queries state in this BFM 
   // component. Test programs must only use these public access methods and 
   // events to communicate with this BFM component. The API and module pins
   // are the only interfaces of this component that are guaranteed to be
   // stable. The API will be maintained for the life of the product. 
   // While we cannot prevent a test program from directly accessing internal
   // tasks, functions, or data private to the BFM, there is no guarantee that
   // these will be present in the future. In fact, it is best for the user
   // to assume that the underlying implementation of this component can 
   // and will change.
   // =cut
   //--------------------------------------------------------------------------
   
   event signal_input_hps_io_sdio_inst_CMD_change;
   event signal_input_hps_io_sdio_inst_D0_change;
   event signal_input_hps_io_sdio_inst_D1_change;
   event signal_input_hps_io_sdio_inst_D2_change;
   event signal_input_hps_io_sdio_inst_D3_change;
   event signal_input_hps_io_uart0_inst_RX_change;
   
   function automatic string get_version();  // public
      // Return BFM version string. For example, version 9.1 sp1 is "9.1sp1" 
      string ret_version = "20.1";
      return ret_version;
   endfunction

   // -------------------------------------------------------
   // hps_io_sdio_inst_CMD
   // -------------------------------------------------------
   function automatic ROLE_hps_io_sdio_inst_CMD_t get_hps_io_sdio_inst_CMD();
   
      // Gets the hps_io_sdio_inst_CMD input value.
      $sformat(message, "%m: called get_hps_io_sdio_inst_CMD");
      print(VERBOSITY_DEBUG, message);
      return sig_hps_io_sdio_inst_CMD_in;
      
   endfunction

   function automatic void set_hps_io_sdio_inst_CMD (
      ROLE_hps_io_sdio_inst_CMD_t new_value
   );
      // Drive the new value to hps_io_sdio_inst_CMD.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_CMD_temp = new_value;
   endfunction
   
   function automatic void set_hps_io_sdio_inst_CMD_oe (
      bit enable
   );
      // bidir port hps_io_sdio_inst_CMD will work as output port when set to 1.
      // bidir port hps_io_sdio_inst_CMD will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_CMD_oe_temp = enable;
   endfunction

   // -------------------------------------------------------
   // hps_io_sdio_inst_D0
   // -------------------------------------------------------
   function automatic ROLE_hps_io_sdio_inst_D0_t get_hps_io_sdio_inst_D0();
   
      // Gets the hps_io_sdio_inst_D0 input value.
      $sformat(message, "%m: called get_hps_io_sdio_inst_D0");
      print(VERBOSITY_DEBUG, message);
      return sig_hps_io_sdio_inst_D0_in;
      
   endfunction

   function automatic void set_hps_io_sdio_inst_D0 (
      ROLE_hps_io_sdio_inst_D0_t new_value
   );
      // Drive the new value to hps_io_sdio_inst_D0.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_D0_temp = new_value;
   endfunction
   
   function automatic void set_hps_io_sdio_inst_D0_oe (
      bit enable
   );
      // bidir port hps_io_sdio_inst_D0 will work as output port when set to 1.
      // bidir port hps_io_sdio_inst_D0 will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_D0_oe_temp = enable;
   endfunction

   // -------------------------------------------------------
   // hps_io_sdio_inst_D1
   // -------------------------------------------------------
   function automatic ROLE_hps_io_sdio_inst_D1_t get_hps_io_sdio_inst_D1();
   
      // Gets the hps_io_sdio_inst_D1 input value.
      $sformat(message, "%m: called get_hps_io_sdio_inst_D1");
      print(VERBOSITY_DEBUG, message);
      return sig_hps_io_sdio_inst_D1_in;
      
   endfunction

   function automatic void set_hps_io_sdio_inst_D1 (
      ROLE_hps_io_sdio_inst_D1_t new_value
   );
      // Drive the new value to hps_io_sdio_inst_D1.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_D1_temp = new_value;
   endfunction
   
   function automatic void set_hps_io_sdio_inst_D1_oe (
      bit enable
   );
      // bidir port hps_io_sdio_inst_D1 will work as output port when set to 1.
      // bidir port hps_io_sdio_inst_D1 will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_D1_oe_temp = enable;
   endfunction

   // -------------------------------------------------------
   // hps_io_sdio_inst_CLK
   // -------------------------------------------------------

   function automatic void set_hps_io_sdio_inst_CLK (
      ROLE_hps_io_sdio_inst_CLK_t new_value
   );
      // Drive the new value to hps_io_sdio_inst_CLK.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_CLK_temp = new_value;
   endfunction

   // -------------------------------------------------------
   // hps_io_sdio_inst_D2
   // -------------------------------------------------------
   function automatic ROLE_hps_io_sdio_inst_D2_t get_hps_io_sdio_inst_D2();
   
      // Gets the hps_io_sdio_inst_D2 input value.
      $sformat(message, "%m: called get_hps_io_sdio_inst_D2");
      print(VERBOSITY_DEBUG, message);
      return sig_hps_io_sdio_inst_D2_in;
      
   endfunction

   function automatic void set_hps_io_sdio_inst_D2 (
      ROLE_hps_io_sdio_inst_D2_t new_value
   );
      // Drive the new value to hps_io_sdio_inst_D2.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_D2_temp = new_value;
   endfunction
   
   function automatic void set_hps_io_sdio_inst_D2_oe (
      bit enable
   );
      // bidir port hps_io_sdio_inst_D2 will work as output port when set to 1.
      // bidir port hps_io_sdio_inst_D2 will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_D2_oe_temp = enable;
   endfunction

   // -------------------------------------------------------
   // hps_io_sdio_inst_D3
   // -------------------------------------------------------
   function automatic ROLE_hps_io_sdio_inst_D3_t get_hps_io_sdio_inst_D3();
   
      // Gets the hps_io_sdio_inst_D3 input value.
      $sformat(message, "%m: called get_hps_io_sdio_inst_D3");
      print(VERBOSITY_DEBUG, message);
      return sig_hps_io_sdio_inst_D3_in;
      
   endfunction

   function automatic void set_hps_io_sdio_inst_D3 (
      ROLE_hps_io_sdio_inst_D3_t new_value
   );
      // Drive the new value to hps_io_sdio_inst_D3.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_D3_temp = new_value;
   endfunction
   
   function automatic void set_hps_io_sdio_inst_D3_oe (
      bit enable
   );
      // bidir port hps_io_sdio_inst_D3 will work as output port when set to 1.
      // bidir port hps_io_sdio_inst_D3 will work as input port when set to 0.
      
      $sformat(message, "%m: method called arg0 %0d", enable); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_sdio_inst_D3_oe_temp = enable;
   endfunction

   // -------------------------------------------------------
   // hps_io_uart0_inst_RX
   // -------------------------------------------------------
   function automatic ROLE_hps_io_uart0_inst_RX_t get_hps_io_uart0_inst_RX();
   
      // Gets the hps_io_uart0_inst_RX input value.
      $sformat(message, "%m: called get_hps_io_uart0_inst_RX");
      print(VERBOSITY_DEBUG, message);
      return sig_hps_io_uart0_inst_RX_in;
      
   endfunction

   // -------------------------------------------------------
   // hps_io_uart0_inst_TX
   // -------------------------------------------------------

   function automatic void set_hps_io_uart0_inst_TX (
      ROLE_hps_io_uart0_inst_TX_t new_value
   );
      // Drive the new value to hps_io_uart0_inst_TX.
      
      $sformat(message, "%m: method called arg0 %0d", new_value); 
      print(VERBOSITY_DEBUG, message);
      
      sig_hps_io_uart0_inst_TX_temp = new_value;
   endfunction

   assign sig_hps_io_sdio_inst_CMD_oe = sig_hps_io_sdio_inst_CMD_oe_temp;
   assign sig_hps_io_sdio_inst_CMD = (sig_hps_io_sdio_inst_CMD_oe == 1)? sig_hps_io_sdio_inst_CMD_temp:'z;
   assign sig_hps_io_sdio_inst_CMD_in = (sig_hps_io_sdio_inst_CMD_oe == 0)? sig_hps_io_sdio_inst_CMD:'z;
   assign sig_hps_io_sdio_inst_D0_oe = sig_hps_io_sdio_inst_D0_oe_temp;
   assign sig_hps_io_sdio_inst_D0 = (sig_hps_io_sdio_inst_D0_oe == 1)? sig_hps_io_sdio_inst_D0_temp:'z;
   assign sig_hps_io_sdio_inst_D0_in = (sig_hps_io_sdio_inst_D0_oe == 0)? sig_hps_io_sdio_inst_D0:'z;
   assign sig_hps_io_sdio_inst_D1_oe = sig_hps_io_sdio_inst_D1_oe_temp;
   assign sig_hps_io_sdio_inst_D1 = (sig_hps_io_sdio_inst_D1_oe == 1)? sig_hps_io_sdio_inst_D1_temp:'z;
   assign sig_hps_io_sdio_inst_D1_in = (sig_hps_io_sdio_inst_D1_oe == 0)? sig_hps_io_sdio_inst_D1:'z;
   assign sig_hps_io_sdio_inst_CLK = sig_hps_io_sdio_inst_CLK_temp;
   assign sig_hps_io_sdio_inst_D2_oe = sig_hps_io_sdio_inst_D2_oe_temp;
   assign sig_hps_io_sdio_inst_D2 = (sig_hps_io_sdio_inst_D2_oe == 1)? sig_hps_io_sdio_inst_D2_temp:'z;
   assign sig_hps_io_sdio_inst_D2_in = (sig_hps_io_sdio_inst_D2_oe == 0)? sig_hps_io_sdio_inst_D2:'z;
   assign sig_hps_io_sdio_inst_D3_oe = sig_hps_io_sdio_inst_D3_oe_temp;
   assign sig_hps_io_sdio_inst_D3 = (sig_hps_io_sdio_inst_D3_oe == 1)? sig_hps_io_sdio_inst_D3_temp:'z;
   assign sig_hps_io_sdio_inst_D3_in = (sig_hps_io_sdio_inst_D3_oe == 0)? sig_hps_io_sdio_inst_D3:'z;
   assign sig_hps_io_uart0_inst_RX_in = sig_hps_io_uart0_inst_RX;
   assign sig_hps_io_uart0_inst_TX = sig_hps_io_uart0_inst_TX_temp;


   always @(sig_hps_io_sdio_inst_CMD_in) begin
      if (sig_hps_io_sdio_inst_CMD_oe == 0) begin
         if (sig_hps_io_sdio_inst_CMD_local != sig_hps_io_sdio_inst_CMD_in)
            -> signal_input_hps_io_sdio_inst_CMD_change;
         sig_hps_io_sdio_inst_CMD_local = sig_hps_io_sdio_inst_CMD_in;
      end
   end
   
   always @(sig_hps_io_sdio_inst_D0_in) begin
      if (sig_hps_io_sdio_inst_D0_oe == 0) begin
         if (sig_hps_io_sdio_inst_D0_local != sig_hps_io_sdio_inst_D0_in)
            -> signal_input_hps_io_sdio_inst_D0_change;
         sig_hps_io_sdio_inst_D0_local = sig_hps_io_sdio_inst_D0_in;
      end
   end
   
   always @(sig_hps_io_sdio_inst_D1_in) begin
      if (sig_hps_io_sdio_inst_D1_oe == 0) begin
         if (sig_hps_io_sdio_inst_D1_local != sig_hps_io_sdio_inst_D1_in)
            -> signal_input_hps_io_sdio_inst_D1_change;
         sig_hps_io_sdio_inst_D1_local = sig_hps_io_sdio_inst_D1_in;
      end
   end
   
   always @(sig_hps_io_sdio_inst_D2_in) begin
      if (sig_hps_io_sdio_inst_D2_oe == 0) begin
         if (sig_hps_io_sdio_inst_D2_local != sig_hps_io_sdio_inst_D2_in)
            -> signal_input_hps_io_sdio_inst_D2_change;
         sig_hps_io_sdio_inst_D2_local = sig_hps_io_sdio_inst_D2_in;
      end
   end
   
   always @(sig_hps_io_sdio_inst_D3_in) begin
      if (sig_hps_io_sdio_inst_D3_oe == 0) begin
         if (sig_hps_io_sdio_inst_D3_local != sig_hps_io_sdio_inst_D3_in)
            -> signal_input_hps_io_sdio_inst_D3_change;
         sig_hps_io_sdio_inst_D3_local = sig_hps_io_sdio_inst_D3_in;
      end
   end
   
   always @(sig_hps_io_uart0_inst_RX_in) begin
      if (sig_hps_io_uart0_inst_RX_local != sig_hps_io_uart0_inst_RX_in)
         -> signal_input_hps_io_uart0_inst_RX_change;
      sig_hps_io_uart0_inst_RX_local = sig_hps_io_uart0_inst_RX_in;
   end
   


// synthesis translate_on

endmodule

