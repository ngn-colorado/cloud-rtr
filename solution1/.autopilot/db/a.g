#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /D/xilinx_workspace/aes_runner/solution1/.autopilot/db/a.g.bc ${1+"$@"}
