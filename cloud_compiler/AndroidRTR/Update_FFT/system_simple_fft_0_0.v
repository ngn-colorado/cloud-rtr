// (c) Copyright 1995-2015 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:hls:simple_fft:1.0
// IP Revision: 1503121720

(* X_CORE_INFO = "simple_fft_top,Vivado 2014.1" *)
(* CHECK_LICENSE_TYPE = "system_simple_fft_0_0,simple_fft_top,{}" *)
(* CORE_GENERATION_INFO = "system_simple_fft_0_0,simple_fft_top,{x_ipProduct=Vivado 2014.1,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=simple_fft,x_ipVersion=1.0,x_ipCoreRevision=1503121720,x_ipLanguage=VERILOG}" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module system_simple_fft_0_0 (
  ap_start,
  ap_ready,
  ap_done,
  ap_idle,
  in_r_TVALID,
  in_r_TREADY,
  in_r_TDATA,
  out_r_TVALID,
  out_r_TREADY,
  out_r_TDATA,
  aclk,
  aresetn
);

input wire ap_start;
output wire ap_ready;
output wire ap_done;
output wire ap_idle;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_r TVALID" *)
input wire in_r_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_r TREADY" *)
output wire in_r_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in_r TDATA" *)
input wire [31 : 0] in_r_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out_r TVALID" *)
output wire out_r_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out_r TREADY" *)
input wire out_r_TREADY;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out_r TDATA" *)
output wire [31 : 0] out_r_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;

  simple_fft_top inst (
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_idle(ap_idle),
    .in_r_TVALID(in_r_TVALID),
    .in_r_TREADY(in_r_TREADY),
    .in_r_TDATA(in_r_TDATA),
    .out_r_TVALID(out_r_TVALID),
    .out_r_TREADY(out_r_TREADY),
    .out_r_TDATA(out_r_TDATA),
    .aclk(aclk),
    .aresetn(aresetn)
  );
endmodule
