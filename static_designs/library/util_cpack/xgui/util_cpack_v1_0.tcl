# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set CH_CNT [ipgui::add_param $IPINST -parent $Page0 -name CH_CNT]
	set CH_DW [ipgui::add_param $IPINST -parent $Page0 -name CH_DW]
}

proc update_PARAM_VALUE.CH_CNT { PARAM_VALUE.CH_CNT } {
	# Procedure called to update CH_CNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CH_CNT { PARAM_VALUE.CH_CNT } {
	# Procedure called to validate CH_CNT
	return true
}

proc update_PARAM_VALUE.CH_DW { PARAM_VALUE.CH_DW } {
	# Procedure called to update CH_DW when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CH_DW { PARAM_VALUE.CH_DW } {
	# Procedure called to validate CH_DW
	return true
}


proc update_MODELPARAM_VALUE.CH_DW { MODELPARAM_VALUE.CH_DW PARAM_VALUE.CH_DW } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CH_DW}] ${MODELPARAM_VALUE.CH_DW}
}

proc update_MODELPARAM_VALUE.CH_CNT { MODELPARAM_VALUE.CH_CNT PARAM_VALUE.CH_CNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CH_CNT}] ${MODELPARAM_VALUE.CH_CNT}
}

