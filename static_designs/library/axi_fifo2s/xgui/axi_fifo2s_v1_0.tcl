# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set AXI_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name AXI_DATA_WIDTH]
	set AXI_SIZE [ipgui::add_param $IPINST -parent $Page0 -name AXI_SIZE]
	set AXI_LENGTH [ipgui::add_param $IPINST -parent $Page0 -name AXI_LENGTH]
	set AXI_ADDRLIMIT [ipgui::add_param $IPINST -parent $Page0 -name AXI_ADDRLIMIT]
	set DMA_READY_ENABLE [ipgui::add_param $IPINST -parent $Page0 -name DMA_READY_ENABLE]
	set DMA_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name DMA_DATA_WIDTH]
	set AXI_ADDRESS [ipgui::add_param $IPINST -parent $Page0 -name AXI_ADDRESS]
	set AXI_BYTE_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name AXI_BYTE_WIDTH]
	set ADC_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name ADC_DATA_WIDTH]
}

proc update_PARAM_VALUE.AXI_DATA_WIDTH { PARAM_VALUE.AXI_DATA_WIDTH } {
	# Procedure called to update AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_DATA_WIDTH { PARAM_VALUE.AXI_DATA_WIDTH } {
	# Procedure called to validate AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.AXI_SIZE { PARAM_VALUE.AXI_SIZE } {
	# Procedure called to update AXI_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_SIZE { PARAM_VALUE.AXI_SIZE } {
	# Procedure called to validate AXI_SIZE
	return true
}

proc update_PARAM_VALUE.AXI_LENGTH { PARAM_VALUE.AXI_LENGTH } {
	# Procedure called to update AXI_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_LENGTH { PARAM_VALUE.AXI_LENGTH } {
	# Procedure called to validate AXI_LENGTH
	return true
}

proc update_PARAM_VALUE.AXI_ADDRLIMIT { PARAM_VALUE.AXI_ADDRLIMIT } {
	# Procedure called to update AXI_ADDRLIMIT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ADDRLIMIT { PARAM_VALUE.AXI_ADDRLIMIT } {
	# Procedure called to validate AXI_ADDRLIMIT
	return true
}

proc update_PARAM_VALUE.DMA_READY_ENABLE { PARAM_VALUE.DMA_READY_ENABLE } {
	# Procedure called to update DMA_READY_ENABLE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_READY_ENABLE { PARAM_VALUE.DMA_READY_ENABLE } {
	# Procedure called to validate DMA_READY_ENABLE
	return true
}

proc update_PARAM_VALUE.DMA_DATA_WIDTH { PARAM_VALUE.DMA_DATA_WIDTH } {
	# Procedure called to update DMA_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_DATA_WIDTH { PARAM_VALUE.DMA_DATA_WIDTH } {
	# Procedure called to validate DMA_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.AXI_ADDRESS { PARAM_VALUE.AXI_ADDRESS } {
	# Procedure called to update AXI_ADDRESS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_ADDRESS { PARAM_VALUE.AXI_ADDRESS } {
	# Procedure called to validate AXI_ADDRESS
	return true
}

proc update_PARAM_VALUE.AXI_BYTE_WIDTH { PARAM_VALUE.AXI_BYTE_WIDTH } {
	# Procedure called to update AXI_BYTE_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.AXI_BYTE_WIDTH { PARAM_VALUE.AXI_BYTE_WIDTH } {
	# Procedure called to validate AXI_BYTE_WIDTH
	return true
}

proc update_PARAM_VALUE.ADC_DATA_WIDTH { PARAM_VALUE.ADC_DATA_WIDTH } {
	# Procedure called to update ADC_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ADC_DATA_WIDTH { PARAM_VALUE.ADC_DATA_WIDTH } {
	# Procedure called to validate ADC_DATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.ADC_DATA_WIDTH { MODELPARAM_VALUE.ADC_DATA_WIDTH PARAM_VALUE.ADC_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ADC_DATA_WIDTH}] ${MODELPARAM_VALUE.ADC_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.DMA_DATA_WIDTH { MODELPARAM_VALUE.DMA_DATA_WIDTH PARAM_VALUE.DMA_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_DATA_WIDTH}] ${MODELPARAM_VALUE.DMA_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.AXI_DATA_WIDTH { MODELPARAM_VALUE.AXI_DATA_WIDTH PARAM_VALUE.AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.DMA_READY_ENABLE { MODELPARAM_VALUE.DMA_READY_ENABLE PARAM_VALUE.DMA_READY_ENABLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_READY_ENABLE}] ${MODELPARAM_VALUE.DMA_READY_ENABLE}
}

proc update_MODELPARAM_VALUE.AXI_SIZE { MODELPARAM_VALUE.AXI_SIZE PARAM_VALUE.AXI_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_SIZE}] ${MODELPARAM_VALUE.AXI_SIZE}
}

proc update_MODELPARAM_VALUE.AXI_LENGTH { MODELPARAM_VALUE.AXI_LENGTH PARAM_VALUE.AXI_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_LENGTH}] ${MODELPARAM_VALUE.AXI_LENGTH}
}

proc update_MODELPARAM_VALUE.AXI_ADDRESS { MODELPARAM_VALUE.AXI_ADDRESS PARAM_VALUE.AXI_ADDRESS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ADDRESS}] ${MODELPARAM_VALUE.AXI_ADDRESS}
}

proc update_MODELPARAM_VALUE.AXI_ADDRLIMIT { MODELPARAM_VALUE.AXI_ADDRLIMIT PARAM_VALUE.AXI_ADDRLIMIT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_ADDRLIMIT}] ${MODELPARAM_VALUE.AXI_ADDRLIMIT}
}

proc update_MODELPARAM_VALUE.AXI_BYTE_WIDTH { MODELPARAM_VALUE.AXI_BYTE_WIDTH PARAM_VALUE.AXI_BYTE_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.AXI_BYTE_WIDTH}] ${MODELPARAM_VALUE.AXI_BYTE_WIDTH}
}

