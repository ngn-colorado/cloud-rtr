#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /Xilinx/QAM_Runner/solution1/.autopilot/db/a.g.bc ${1+"$@"}