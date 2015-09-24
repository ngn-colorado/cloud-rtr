set language "C"
set globalAPint ""
set globalVariable ""
set staticVariable ""
set moduleName "reset_axi"
set rawDecl [list "void" "reset_axi\(int *in_reset, bool *reset_out\)"]
set argAPint ""
set returnAPint ""
set portList ""
set portName0 "in_reset"
set portInterface0 "wire"
set portData0 "int"
set portPointer0 "1"
set portArrayDim0 0
set portConst0 "0"
set portVolatile0 "0"
set portArrayOpt0 ""
set port0 [list $portName0 $portInterface0 $portData0 $portPointer0 $portArrayDim0 $portConst0 $portVolatile0 $portArrayOpt0]
lappend portList $port0
set portName1 "reset_out"
set portInterface1 "wire"
set portData1 "bool"
set portPointer1 "1"
set portArrayDim1 0
set portConst1 "0"
set portVolatile1 "0"
set portArrayOpt1 ""
set port1 [list $portName1 $portInterface1 $portData1 $portPointer1 $portArrayDim1 $portConst1 $portVolatile1 $portArrayOpt1]
lappend portList $port1
set dataPackList ""
set module [list $moduleName $portList $rawDecl $argAPint $returnAPint $dataPackList]
set hasCPPAPInt 0
set hasCPPAPFix 0
set hasSCFix 0
set hasCPPComplex 0
set hasCBool 0
set isTemplateTop 0
set useIntT 0
