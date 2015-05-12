############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2014 Xilinx Inc. All rights reserved.
############################################################
open_project simple_fft
set_top simple_fft
add_files simple_fft.cpp
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
source "./simple_fft/solution1/directives.tcl"
#csim_design
csynth_design
#cosim_design -trace_level none -rtl verilog -tool auto
export_design -format ip_catalog
