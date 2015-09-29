# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set PHY_AD [ipgui::add_param $IPINST -parent $Page0 -name PHY_AD]
}

proc update_PARAM_VALUE.PHY_AD { PARAM_VALUE.PHY_AD } {
	# Procedure called to update PHY_AD when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PHY_AD { PARAM_VALUE.PHY_AD } {
	# Procedure called to validate PHY_AD
	return true
}


proc update_MODELPARAM_VALUE.PHY_AD { MODELPARAM_VALUE.PHY_AD PARAM_VALUE.PHY_AD } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PHY_AD}] ${MODELPARAM_VALUE.PHY_AD}
}

