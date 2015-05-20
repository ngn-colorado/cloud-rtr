#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /Xilinx/aes_runner/solution1/.autopilot/db/a.g.bc ${1+"$@"}
