# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set C_S_AXI_MIN_SIZE [ipgui::add_param $IPINST -parent $Page0 -name C_S_AXI_MIN_SIZE]
	set PCORE_TX_LANE_SEL_8 [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_LANE_SEL_8]
	set PCORE_TX_LANE_SEL_7 [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_LANE_SEL_7]
	set PCORE_TX_LANE_SEL_6 [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_LANE_SEL_6]
	set PCORE_TX_LANE_SEL_5 [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_LANE_SEL_5]
	set PCORE_TX_LANE_SEL_4 [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_LANE_SEL_4]
	set PCORE_TX_LANE_SEL_3 [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_LANE_SEL_3]
	set PCORE_TX_LANE_SEL_2 [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_LANE_SEL_2]
	set PCORE_TX_LANE_SEL_1 [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_LANE_SEL_1]
	set PCORE_TX_LANE_SEL_0 [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_LANE_SEL_0]
	set PCORE_RX_CDR_CFG [ipgui::add_param $IPINST -parent $Page0 -name PCORE_RX_CDR_CFG]
	set PCORE_PMA_RSV [ipgui::add_param $IPINST -parent $Page0 -name PCORE_PMA_RSV]
	set PCORE_TX_CLK25_DIV [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_CLK25_DIV]
	set PCORE_RX_CLK25_DIV [ipgui::add_param $IPINST -parent $Page0 -name PCORE_RX_CLK25_DIV]
	set PCORE_TX_OUT_DIV [ipgui::add_param $IPINST -parent $Page0 -name PCORE_TX_OUT_DIV]
	set PCORE_RX_OUT_DIV [ipgui::add_param $IPINST -parent $Page0 -name PCORE_RX_OUT_DIV]
	set PCORE_CPLL_FBDIV [ipgui::add_param $IPINST -parent $Page0 -name PCORE_CPLL_FBDIV]
	set PCORE_QPLL_FBDIV [ipgui::add_param $IPINST -parent $Page0 -name PCORE_QPLL_FBDIV]
	set PCORE_QPLL_FBDIV_RATIO [ipgui::add_param $IPINST -parent $Page0 -name PCORE_QPLL_FBDIV_RATIO]
	set PCORE_QPLL_CFG [ipgui::add_param $IPINST -parent $Page0 -name PCORE_QPLL_CFG]
	set PCORE_QPLL_REFCLK_DIV [ipgui::add_param $IPINST -parent $Page0 -name PCORE_QPLL_REFCLK_DIV]
	set PCORE_NUM_OF_RX_LANES [ipgui::add_param $IPINST -parent $Page0 -name PCORE_NUM_OF_RX_LANES]
	set PCORE_NUM_OF_TX_LANES [ipgui::add_param $IPINST -parent $Page0 -name PCORE_NUM_OF_TX_LANES]
	set PCORE_DEVICE_TYPE [ipgui::add_param $IPINST -parent $Page0 -name PCORE_DEVICE_TYPE]
	set PCORE_ID [ipgui::add_param $IPINST -parent $Page0 -name PCORE_ID]
}

proc update_PARAM_VALUE.C_S_AXI_MIN_SIZE { PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to update C_S_AXI_MIN_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_MIN_SIZE { PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to validate C_S_AXI_MIN_SIZE
	return true
}

proc update_PARAM_VALUE.PCORE_TX_LANE_SEL_8 { PARAM_VALUE.PCORE_TX_LANE_SEL_8 } {
	# Procedure called to update PCORE_TX_LANE_SEL_8 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_LANE_SEL_8 { PARAM_VALUE.PCORE_TX_LANE_SEL_8 } {
	# Procedure called to validate PCORE_TX_LANE_SEL_8
	return true
}

proc update_PARAM_VALUE.PCORE_TX_LANE_SEL_7 { PARAM_VALUE.PCORE_TX_LANE_SEL_7 } {
	# Procedure called to update PCORE_TX_LANE_SEL_7 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_LANE_SEL_7 { PARAM_VALUE.PCORE_TX_LANE_SEL_7 } {
	# Procedure called to validate PCORE_TX_LANE_SEL_7
	return true
}

proc update_PARAM_VALUE.PCORE_TX_LANE_SEL_6 { PARAM_VALUE.PCORE_TX_LANE_SEL_6 } {
	# Procedure called to update PCORE_TX_LANE_SEL_6 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_LANE_SEL_6 { PARAM_VALUE.PCORE_TX_LANE_SEL_6 } {
	# Procedure called to validate PCORE_TX_LANE_SEL_6
	return true
}

proc update_PARAM_VALUE.PCORE_TX_LANE_SEL_5 { PARAM_VALUE.PCORE_TX_LANE_SEL_5 } {
	# Procedure called to update PCORE_TX_LANE_SEL_5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_LANE_SEL_5 { PARAM_VALUE.PCORE_TX_LANE_SEL_5 } {
	# Procedure called to validate PCORE_TX_LANE_SEL_5
	return true
}

proc update_PARAM_VALUE.PCORE_TX_LANE_SEL_4 { PARAM_VALUE.PCORE_TX_LANE_SEL_4 } {
	# Procedure called to update PCORE_TX_LANE_SEL_4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_LANE_SEL_4 { PARAM_VALUE.PCORE_TX_LANE_SEL_4 } {
	# Procedure called to validate PCORE_TX_LANE_SEL_4
	return true
}

proc update_PARAM_VALUE.PCORE_TX_LANE_SEL_3 { PARAM_VALUE.PCORE_TX_LANE_SEL_3 } {
	# Procedure called to update PCORE_TX_LANE_SEL_3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_LANE_SEL_3 { PARAM_VALUE.PCORE_TX_LANE_SEL_3 } {
	# Procedure called to validate PCORE_TX_LANE_SEL_3
	return true
}

proc update_PARAM_VALUE.PCORE_TX_LANE_SEL_2 { PARAM_VALUE.PCORE_TX_LANE_SEL_2 } {
	# Procedure called to update PCORE_TX_LANE_SEL_2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_LANE_SEL_2 { PARAM_VALUE.PCORE_TX_LANE_SEL_2 } {
	# Procedure called to validate PCORE_TX_LANE_SEL_2
	return true
}

proc update_PARAM_VALUE.PCORE_TX_LANE_SEL_1 { PARAM_VALUE.PCORE_TX_LANE_SEL_1 } {
	# Procedure called to update PCORE_TX_LANE_SEL_1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_LANE_SEL_1 { PARAM_VALUE.PCORE_TX_LANE_SEL_1 } {
	# Procedure called to validate PCORE_TX_LANE_SEL_1
	return true
}

proc update_PARAM_VALUE.PCORE_TX_LANE_SEL_0 { PARAM_VALUE.PCORE_TX_LANE_SEL_0 } {
	# Procedure called to update PCORE_TX_LANE_SEL_0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_LANE_SEL_0 { PARAM_VALUE.PCORE_TX_LANE_SEL_0 } {
	# Procedure called to validate PCORE_TX_LANE_SEL_0
	return true
}

proc update_PARAM_VALUE.PCORE_RX_CDR_CFG { PARAM_VALUE.PCORE_RX_CDR_CFG } {
	# Procedure called to update PCORE_RX_CDR_CFG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_RX_CDR_CFG { PARAM_VALUE.PCORE_RX_CDR_CFG } {
	# Procedure called to validate PCORE_RX_CDR_CFG
	return true
}

proc update_PARAM_VALUE.PCORE_PMA_RSV { PARAM_VALUE.PCORE_PMA_RSV } {
	# Procedure called to update PCORE_PMA_RSV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_PMA_RSV { PARAM_VALUE.PCORE_PMA_RSV } {
	# Procedure called to validate PCORE_PMA_RSV
	return true
}

proc update_PARAM_VALUE.PCORE_TX_CLK25_DIV { PARAM_VALUE.PCORE_TX_CLK25_DIV } {
	# Procedure called to update PCORE_TX_CLK25_DIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_CLK25_DIV { PARAM_VALUE.PCORE_TX_CLK25_DIV } {
	# Procedure called to validate PCORE_TX_CLK25_DIV
	return true
}

proc update_PARAM_VALUE.PCORE_RX_CLK25_DIV { PARAM_VALUE.PCORE_RX_CLK25_DIV } {
	# Procedure called to update PCORE_RX_CLK25_DIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_RX_CLK25_DIV { PARAM_VALUE.PCORE_RX_CLK25_DIV } {
	# Procedure called to validate PCORE_RX_CLK25_DIV
	return true
}

proc update_PARAM_VALUE.PCORE_TX_OUT_DIV { PARAM_VALUE.PCORE_TX_OUT_DIV } {
	# Procedure called to update PCORE_TX_OUT_DIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_TX_OUT_DIV { PARAM_VALUE.PCORE_TX_OUT_DIV } {
	# Procedure called to validate PCORE_TX_OUT_DIV
	return true
}

proc update_PARAM_VALUE.PCORE_RX_OUT_DIV { PARAM_VALUE.PCORE_RX_OUT_DIV } {
	# Procedure called to update PCORE_RX_OUT_DIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_RX_OUT_DIV { PARAM_VALUE.PCORE_RX_OUT_DIV } {
	# Procedure called to validate PCORE_RX_OUT_DIV
	return true
}

proc update_PARAM_VALUE.PCORE_CPLL_FBDIV { PARAM_VALUE.PCORE_CPLL_FBDIV } {
	# Procedure called to update PCORE_CPLL_FBDIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_CPLL_FBDIV { PARAM_VALUE.PCORE_CPLL_FBDIV } {
	# Procedure called to validate PCORE_CPLL_FBDIV
	return true
}

proc update_PARAM_VALUE.PCORE_QPLL_FBDIV { PARAM_VALUE.PCORE_QPLL_FBDIV } {
	# Procedure called to update PCORE_QPLL_FBDIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_QPLL_FBDIV { PARAM_VALUE.PCORE_QPLL_FBDIV } {
	# Procedure called to validate PCORE_QPLL_FBDIV
	return true
}

proc update_PARAM_VALUE.PCORE_QPLL_FBDIV_RATIO { PARAM_VALUE.PCORE_QPLL_FBDIV_RATIO } {
	# Procedure called to update PCORE_QPLL_FBDIV_RATIO when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_QPLL_FBDIV_RATIO { PARAM_VALUE.PCORE_QPLL_FBDIV_RATIO } {
	# Procedure called to validate PCORE_QPLL_FBDIV_RATIO
	return true
}

proc update_PARAM_VALUE.PCORE_QPLL_CFG { PARAM_VALUE.PCORE_QPLL_CFG } {
	# Procedure called to update PCORE_QPLL_CFG when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_QPLL_CFG { PARAM_VALUE.PCORE_QPLL_CFG } {
	# Procedure called to validate PCORE_QPLL_CFG
	return true
}

proc update_PARAM_VALUE.PCORE_QPLL_REFCLK_DIV { PARAM_VALUE.PCORE_QPLL_REFCLK_DIV } {
	# Procedure called to update PCORE_QPLL_REFCLK_DIV when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_QPLL_REFCLK_DIV { PARAM_VALUE.PCORE_QPLL_REFCLK_DIV } {
	# Procedure called to validate PCORE_QPLL_REFCLK_DIV
	return true
}

proc update_PARAM_VALUE.PCORE_NUM_OF_RX_LANES { PARAM_VALUE.PCORE_NUM_OF_RX_LANES } {
	# Procedure called to update PCORE_NUM_OF_RX_LANES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_NUM_OF_RX_LANES { PARAM_VALUE.PCORE_NUM_OF_RX_LANES } {
	# Procedure called to validate PCORE_NUM_OF_RX_LANES
	return true
}

proc update_PARAM_VALUE.PCORE_NUM_OF_TX_LANES { PARAM_VALUE.PCORE_NUM_OF_TX_LANES } {
	# Procedure called to update PCORE_NUM_OF_TX_LANES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_NUM_OF_TX_LANES { PARAM_VALUE.PCORE_NUM_OF_TX_LANES } {
	# Procedure called to validate PCORE_NUM_OF_TX_LANES
	return true
}

proc update_PARAM_VALUE.PCORE_DEVICE_TYPE { PARAM_VALUE.PCORE_DEVICE_TYPE } {
	# Procedure called to update PCORE_DEVICE_TYPE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PCORE_DEVICE_TYPE { PARAM_VALUE.PCORE_DEVICE_TYPE } {
	# Procedure called to validate PCORE_DEVICE_TYPE
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

proc update_MODELPARAM_VALUE.PCORE_DEVICE_TYPE { MODELPARAM_VALUE.PCORE_DEVICE_TYPE PARAM_VALUE.PCORE_DEVICE_TYPE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_DEVICE_TYPE}] ${MODELPARAM_VALUE.PCORE_DEVICE_TYPE}
}

proc update_MODELPARAM_VALUE.PCORE_NUM_OF_TX_LANES { MODELPARAM_VALUE.PCORE_NUM_OF_TX_LANES PARAM_VALUE.PCORE_NUM_OF_TX_LANES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_NUM_OF_TX_LANES}] ${MODELPARAM_VALUE.PCORE_NUM_OF_TX_LANES}
}

proc update_MODELPARAM_VALUE.PCORE_NUM_OF_RX_LANES { MODELPARAM_VALUE.PCORE_NUM_OF_RX_LANES PARAM_VALUE.PCORE_NUM_OF_RX_LANES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_NUM_OF_RX_LANES}] ${MODELPARAM_VALUE.PCORE_NUM_OF_RX_LANES}
}

proc update_MODELPARAM_VALUE.PCORE_QPLL_REFCLK_DIV { MODELPARAM_VALUE.PCORE_QPLL_REFCLK_DIV PARAM_VALUE.PCORE_QPLL_REFCLK_DIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_QPLL_REFCLK_DIV}] ${MODELPARAM_VALUE.PCORE_QPLL_REFCLK_DIV}
}

proc update_MODELPARAM_VALUE.PCORE_QPLL_CFG { MODELPARAM_VALUE.PCORE_QPLL_CFG PARAM_VALUE.PCORE_QPLL_CFG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_QPLL_CFG}] ${MODELPARAM_VALUE.PCORE_QPLL_CFG}
}

proc update_MODELPARAM_VALUE.PCORE_QPLL_FBDIV_RATIO { MODELPARAM_VALUE.PCORE_QPLL_FBDIV_RATIO PARAM_VALUE.PCORE_QPLL_FBDIV_RATIO } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_QPLL_FBDIV_RATIO}] ${MODELPARAM_VALUE.PCORE_QPLL_FBDIV_RATIO}
}

proc update_MODELPARAM_VALUE.PCORE_QPLL_FBDIV { MODELPARAM_VALUE.PCORE_QPLL_FBDIV PARAM_VALUE.PCORE_QPLL_FBDIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_QPLL_FBDIV}] ${MODELPARAM_VALUE.PCORE_QPLL_FBDIV}
}

proc update_MODELPARAM_VALUE.PCORE_CPLL_FBDIV { MODELPARAM_VALUE.PCORE_CPLL_FBDIV PARAM_VALUE.PCORE_CPLL_FBDIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_CPLL_FBDIV}] ${MODELPARAM_VALUE.PCORE_CPLL_FBDIV}
}

proc update_MODELPARAM_VALUE.PCORE_RX_OUT_DIV { MODELPARAM_VALUE.PCORE_RX_OUT_DIV PARAM_VALUE.PCORE_RX_OUT_DIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_RX_OUT_DIV}] ${MODELPARAM_VALUE.PCORE_RX_OUT_DIV}
}

proc update_MODELPARAM_VALUE.PCORE_TX_OUT_DIV { MODELPARAM_VALUE.PCORE_TX_OUT_DIV PARAM_VALUE.PCORE_TX_OUT_DIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_OUT_DIV}] ${MODELPARAM_VALUE.PCORE_TX_OUT_DIV}
}

proc update_MODELPARAM_VALUE.PCORE_RX_CLK25_DIV { MODELPARAM_VALUE.PCORE_RX_CLK25_DIV PARAM_VALUE.PCORE_RX_CLK25_DIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_RX_CLK25_DIV}] ${MODELPARAM_VALUE.PCORE_RX_CLK25_DIV}
}

proc update_MODELPARAM_VALUE.PCORE_TX_CLK25_DIV { MODELPARAM_VALUE.PCORE_TX_CLK25_DIV PARAM_VALUE.PCORE_TX_CLK25_DIV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_CLK25_DIV}] ${MODELPARAM_VALUE.PCORE_TX_CLK25_DIV}
}

proc update_MODELPARAM_VALUE.PCORE_PMA_RSV { MODELPARAM_VALUE.PCORE_PMA_RSV PARAM_VALUE.PCORE_PMA_RSV } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_PMA_RSV}] ${MODELPARAM_VALUE.PCORE_PMA_RSV}
}

proc update_MODELPARAM_VALUE.PCORE_RX_CDR_CFG { MODELPARAM_VALUE.PCORE_RX_CDR_CFG PARAM_VALUE.PCORE_RX_CDR_CFG } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_RX_CDR_CFG}] ${MODELPARAM_VALUE.PCORE_RX_CDR_CFG}
}

proc update_MODELPARAM_VALUE.PCORE_TX_LANE_SEL_0 { MODELPARAM_VALUE.PCORE_TX_LANE_SEL_0 PARAM_VALUE.PCORE_TX_LANE_SEL_0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_LANE_SEL_0}] ${MODELPARAM_VALUE.PCORE_TX_LANE_SEL_0}
}

proc update_MODELPARAM_VALUE.PCORE_TX_LANE_SEL_1 { MODELPARAM_VALUE.PCORE_TX_LANE_SEL_1 PARAM_VALUE.PCORE_TX_LANE_SEL_1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_LANE_SEL_1}] ${MODELPARAM_VALUE.PCORE_TX_LANE_SEL_1}
}

proc update_MODELPARAM_VALUE.PCORE_TX_LANE_SEL_2 { MODELPARAM_VALUE.PCORE_TX_LANE_SEL_2 PARAM_VALUE.PCORE_TX_LANE_SEL_2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_LANE_SEL_2}] ${MODELPARAM_VALUE.PCORE_TX_LANE_SEL_2}
}

proc update_MODELPARAM_VALUE.PCORE_TX_LANE_SEL_3 { MODELPARAM_VALUE.PCORE_TX_LANE_SEL_3 PARAM_VALUE.PCORE_TX_LANE_SEL_3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_LANE_SEL_3}] ${MODELPARAM_VALUE.PCORE_TX_LANE_SEL_3}
}

proc update_MODELPARAM_VALUE.PCORE_TX_LANE_SEL_4 { MODELPARAM_VALUE.PCORE_TX_LANE_SEL_4 PARAM_VALUE.PCORE_TX_LANE_SEL_4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_LANE_SEL_4}] ${MODELPARAM_VALUE.PCORE_TX_LANE_SEL_4}
}

proc update_MODELPARAM_VALUE.PCORE_TX_LANE_SEL_5 { MODELPARAM_VALUE.PCORE_TX_LANE_SEL_5 PARAM_VALUE.PCORE_TX_LANE_SEL_5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_LANE_SEL_5}] ${MODELPARAM_VALUE.PCORE_TX_LANE_SEL_5}
}

proc update_MODELPARAM_VALUE.PCORE_TX_LANE_SEL_6 { MODELPARAM_VALUE.PCORE_TX_LANE_SEL_6 PARAM_VALUE.PCORE_TX_LANE_SEL_6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_LANE_SEL_6}] ${MODELPARAM_VALUE.PCORE_TX_LANE_SEL_6}
}

proc update_MODELPARAM_VALUE.PCORE_TX_LANE_SEL_7 { MODELPARAM_VALUE.PCORE_TX_LANE_SEL_7 PARAM_VALUE.PCORE_TX_LANE_SEL_7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_LANE_SEL_7}] ${MODELPARAM_VALUE.PCORE_TX_LANE_SEL_7}
}

proc update_MODELPARAM_VALUE.PCORE_TX_LANE_SEL_8 { MODELPARAM_VALUE.PCORE_TX_LANE_SEL_8 PARAM_VALUE.PCORE_TX_LANE_SEL_8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PCORE_TX_LANE_SEL_8}] ${MODELPARAM_VALUE.PCORE_TX_LANE_SEL_8}
}

proc update_MODELPARAM_VALUE.C_S_AXI_MIN_SIZE { MODELPARAM_VALUE.C_S_AXI_MIN_SIZE PARAM_VALUE.C_S_AXI_MIN_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_MIN_SIZE}] ${MODELPARAM_VALUE.C_S_AXI_MIN_SIZE}
}

