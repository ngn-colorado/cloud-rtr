
xelab xil_defaultlib.apatb_aes_top -prj aes.prj --lib "ieee_proposed=./ieee_proposed" -s aes 
xsim --noieeewarnings aes -tclbatch aes.tcl

