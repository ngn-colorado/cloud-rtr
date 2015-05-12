set language "C"
set globalAPint ""
set globalVariable ""
set gportName0 "FFT_INPUT_WIDTH"
set gportInterface0 "wire"
set gportData0 "char"
set gportPointer0 "0"
set gportArrayDim0 0
set gportConst0 "1"
set gportVolatile0 "0"
set gportInitilizer0 ""
set gextern0 0
set gport0 [list $gportName0 $gportInterface0 $gportData0 $gportPointer0 $gportArrayDim0 $gportConst0 $gportVolatile0 $gportInitilizer0 $gextern0]
lappend globalVariable $gport0
set gportName1 "FFT_OUTPUT_WIDTH"
set gportInterface1 "wire"
set gportData1 "char"
set gportPointer1 "0"
set gportArrayDim1 0
set gportConst1 "1"
set gportVolatile1 "0"
set gportInitilizer1 ""
set gextern1 0
set gport1 [list $gportName1 $gportInterface1 $gportData1 $gportPointer1 $gportArrayDim1 $gportConst1 $gportVolatile1 $gportInitilizer1 $gextern1]
lappend globalVariable $gport1
set gportName2 "FFT_CONFIG_WIDTH"
set gportInterface2 "wire"
set gportData2 "char"
set gportPointer2 "0"
set gportArrayDim2 0
set gportConst2 "1"
set gportVolatile2 "0"
set gportInitilizer2 ""
set gextern2 0
set gport2 [list $gportName2 $gportInterface2 $gportData2 $gportPointer2 $gportArrayDim2 $gportConst2 $gportVolatile2 $gportInitilizer2 $gextern2]
lappend globalVariable $gport2
set gportName3 "FFT_NFFT_MAX"
set gportInterface3 "wire"
set gportData3 "char"
set gportPointer3 "0"
set gportArrayDim3 0
set gportConst3 "1"
set gportVolatile3 "0"
set gportInitilizer3 ""
set gextern3 0
set gport3 [list $gportName3 $gportInterface3 $gportData3 $gportPointer3 $gportArrayDim3 $gportConst3 $gportVolatile3 $gportInitilizer3 $gextern3]
lappend globalVariable $gport3
set gportName4 "FFT_LENGTH"
set gportInterface4 "wire"
set gportData4 "int"
set gportPointer4 "0"
set gportArrayDim4 0
set gportConst4 "1"
set gportVolatile4 "0"
set gportInitilizer4 ""
set gextern4 0
set gport4 [list $gportName4 $gportInterface4 $gportData4 $gportPointer4 $gportArrayDim4 $gportConst4 $gportVolatile4 $gportInitilizer4 $gextern4]
lappend globalVariable $gport4
set staticVariable ""
set moduleName "simple_fft"
set rawDecl [list "void" "simple_fft\(complex<data_in_t> in\[FFT_LENGTH\], complex<data_out_t> out\[FFT_LENGTH\]\)"]
set argAPint ""
set returnAPint ""
set portList ""
set portName0 "in"
set portInterface0 "[list fifo 0]"
set portData0 "[list complex [list ap_fixed "16" "1" "SC_TRN" "SC_WRAP" "0" ] 0]"
set portPointer0 "0"
set portArrayDim0 [list 1024]
set portConst0 "0"
set portVolatile0 "0"
set portArrayOpt0 ""
set port0 [list $portName0 $portInterface0 $portData0 $portPointer0 $portArrayDim0 $portConst0 $portVolatile0 $portArrayOpt0]
lappend portList $port0
set portName1 "out"
set portInterface1 "[list fifo 0]"
set portData1 "[list complex [list ap_fixed "16" "1" "SC_TRN" "SC_WRAP" "0" ] 0]"
set portPointer1 "0"
set portArrayDim1 [list 1024]
set portConst1 "0"
set portVolatile1 "0"
set portArrayOpt1 ""
set port1 [list $portName1 $portInterface1 $portData1 $portPointer1 $portArrayDim1 $portConst1 $portVolatile1 $portArrayOpt1]
lappend portList $port1
set dataPackList ""
set module [list $moduleName $portList $rawDecl $argAPint $returnAPint $dataPackList]
set hasCPPAPInt 0
set hasCPPAPFix 1
set hasSCFix 0
set hasCPPComplex 1
set hasCBool 0
set isTemplateTop 0
set useIntT 1
