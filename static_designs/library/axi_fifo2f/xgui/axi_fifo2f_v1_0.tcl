# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set DMA_ADDR_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name DMA_ADDR_WIDTH]
	set DMA_READY_ENABLE [ipgui::add_param $IPINST -parent $Page0 -name DMA_READY_ENABLE]
	set DMA_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name DMA_DATA_WIDTH]
	set ADC_DATA_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name ADC_DATA_WIDTH]
}

proc update_PARAM_VALUE.DMA_ADDR_WIDTH { PARAM_VALUE.DMA_ADDR_WIDTH } {
	# Procedure called to update DMA_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DMA_ADDR_WIDTH { PARAM_VALUE.DMA_ADDR_WIDTH } {
	# Procedure called to validate DMA_ADDR_WIDTH
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

proc update_MODELPARAM_VALUE.DMA_READY_ENABLE { MODELPARAM_VALUE.DMA_READY_ENABLE PARAM_VALUE.DMA_READY_ENABLE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_READY_ENABLE}] ${MODELPARAM_VALUE.DMA_READY_ENABLE}
}

proc update_MODELPARAM_VALUE.DMA_ADDR_WIDTH { MODELPARAM_VALUE.DMA_ADDR_WIDTH PARAM_VALUE.DMA_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DMA_ADDR_WIDTH}] ${MODELPARAM_VALUE.DMA_ADDR_WIDTH}
}

