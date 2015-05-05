############################################################
## This file is generated automatically by Vivado HLS.
## Please DO NOT edit it.
## Copyright (C) 2014 Xilinx Inc. All rights reserved.
############################################################
open_project aes_runner
set_top aes
add_files aes_runner/source/aes_runner.cpp
add_files aes_runner/source/aes.cpp
add_files -tb aes_runner/source/aes_runner_testbench.cpp -cflags "-I../../usr/local/ssl/include -ldl -L/usr/local/ssl/lib/. -lcrypto -lssl"
open_solution "solution1"
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
source "./aes_runner/solution1/directives.tcl"
csim_design -ldflags {-lcrypto -lssl -ldl}
csynth_design
cosim_design -ldflags {-lcrypto -lssl -ldl} -trace_level none -rtl verilog -tool auto
export_design -format ip_catalog
