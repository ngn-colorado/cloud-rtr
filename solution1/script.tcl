############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2014 Xilinx Inc. All rights reserved.
############################################################
open_project QAM_Runner
set_top qam_runner
add_files QAM_Runner/source/crec.cpp
add_files QAM_Runner/source/crec.h
add_files QAM_Runner/source/qam_runner.cpp
add_files -tb QAM_Runner/source/crec_tb.cpp
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
source "./QAM_Runner/solution1/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level none -rtl verilog -tool auto
export_design -format ip_catalog
