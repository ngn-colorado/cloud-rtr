# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set C_S_AXI_MIN_SIZE [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_MIN_SIZE]
	set PCORE_IODELAY_GROUP [ipgui::add_param $IPINST -parent $Page0 -name PCORE_IODELAY_GROUP]
	set PCORE_BUFTYPE [ipgui::add_param $IPINST -parent $Page0 -name PCORE_BUFTYPE]
	set PCORE_ID [ipgui::add_param $IPINST -parent $Page0 -name PCORE_ID]
}

proc update_PARAM_VALUE.C_S_AXI_MIN_SIZE { PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to update C_S_AXI_MIN_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_MIN_SIZE { PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to validate C_S_AXI_MIN_SIZE
	return true
}

proc update_PARAM_VALUE.PCORE_IODELAY_GROUP { PARAM_VALUE.PCORE_IODELAY_GROUP } {
	# Procedure called to update PCORE_IODELAY_GROUP when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_IODELAY_GROUP { PARAM_VALUE.PCORE_IODELAY_GROUP } {
	# Procedure called to validate PCORE_IODELAY_GROUP
	return true
}

proc update_PARAM_VALUE.PCORE_BUFTYPE { PARAM_VALUE.PCORE_BUFTYPE } {
	# Procedure called to update PCORE_BUFTYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_BUFTYPE { PARAM_VALUE.PCORE_BUFTYPE } {
	# Procedure called to validate PCORE_BUFTYPE
	return true
}

proc update_PARAM_VALUE.PCORE_ID { PARAM_VALUE.PCORE_ID } {
	# Procedure called to update PCORE_ID when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_ID { PARAM_VALUE.PCORE_ID } {
	# Procedure called to validate PCORE_ID
	return true
}


proc update_MODELPARAM_VALUE.PCORE_ID { MODELPARAM_VALUE.PCORE_ID PARAM_VALUE.PCORE_ID } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_ID}] ${MODELPARAM_VALUE.PCORE_ID}
}

proc update_MODELPARAM_VALUE.PCORE_BUFTYPE { MODELPARAM_VALUE.PCORE_BUFTYPE PARAM_VALUE.PCORE_BUFTYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_BUFTYPE}] ${MODELPARAM_VALUE.PCORE_BUFTYPE}
}

proc update_MODELPARAM_VALUE.PCORE_IODELAY_GROUP { MODELPARAM_VALUE.PCORE_IODELAY_GROUP PARAM_VALUE.PCORE_IODELAY_GROUP } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_IODELAY_GROUP}] ${MODELPARAM_VALUE.PCORE_IODELAY_GROUP}
}

proc update_MODELPARAM_VALUE.C_S_AXI_MIN_SIZE { MODELPARAM_VALUE.C_S_AXI_MIN_SIZE PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_MIN_SIZE}] ${MODELPARAM_VALUE.C_S_AXI_MIN_SIZE}
}

