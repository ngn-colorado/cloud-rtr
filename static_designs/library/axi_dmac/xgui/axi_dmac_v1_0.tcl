# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
	set Page0 [ipgui::add_page $IPINST -name "Page 0" -layout vertical]
	set Component_Name [ipgui::add_param $IPINST -parent $Page0 -name Component_Name]
	set C_FIFO_SIZE [ipgui::add_param $IPINST -parent $Page0 -name C_FIFO_SIZE]
	set C_MAX_BYTES_PER_BURST [ipgui::add_param $IPINST -parent $Page0 -name C_MAX_BYTES_PER_BURST]
	set C_DMA_TYPE_SRC [ipgui::add_param $IPINST -parent $Page0 -name C_DMA_TYPE_SRC]
	set C_DMA_TYPE_DEST [ipgui::add_param $IPINST -parent $Page0 -name C_DMA_TYPE_DEST]
	set C_DMA_AXI_PROTOCOL_SRC [ipgui::add_param $IPINST -parent $Page0 -name C_DMA_AXI_PROTOCOL_SRC]
	set C_DMA_AXI_PROTOCOL_DEST [ipgui::add_param $IPINST -parent $Page0 -name C_DMA_AXI_PROTOCOL_DEST]
	set C_CYCLIC [ipgui::add_param $IPINST -parent $Page0 -name C_CYCLIC]
	set C_SYNC_TRANSFER_START [ipgui::add_param $IPINST -parent $Page0 -name C_SYNC_TRANSFER_START]
	set C_AXI_SLICE_SRC [ipgui::add_param $IPINST -parent $Page0 -name C_AXI_SLICE_SRC]
	set C_AXI_SLICE_DEST [ipgui::add_param $IPINST -parent $Page0 -name C_AXI_SLICE_DEST]
	set C_CLKS_ASYNC_DEST_REQ [ipgui::add_param $IPINST -parent $Page0 -name C_CLKS_ASYNC_DEST_REQ]
	set C_CLKS_ASYNC_SRC_DEST [ipgui::add_param $IPINST -parent $Page0 -name C_CLKS_ASYNC_SRC_DEST]
	set C_CLKS_ASYNC_REQ_SRC [ipgui::add_param $IPINST -parent $Page0 -name C_CLKS_ASYNC_REQ_SRC]
	set C_2D_TRANSFER [ipgui::add_param $IPINST -parent $Page0 -name C_2D_TRANSFER]
	set C_DMA_LENGTH_WIDTH [ipgui::add_param $IPINST -parent $Page0 -name C_DMA_LENGTH_WIDTH]
	set C_DMA_DATA_WIDTH_DEST [ipgui::add_param $IPINST -parent $Page0 -name C_DMA_DATA_WIDTH_DEST]
	set C_DMA_DATA_WIDTH_SRC [ipgui::add_param $IPINST -parent $Page0 -name C_DMA_DATA_WIDTH_SRC]
	set PCORE_ID [ipgui::add_param $IPINST -parent $Page0 -name PCORE_ID]
}

proc update_PARAM_VALUE.C_FIFO_SIZE { PARAM_VALUE.C_FIFO_SIZE } {
	# Procedure called to update C_FIFO_SIZE when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_FIFO_SIZE { PARAM_VALUE.C_FIFO_SIZE } {
	# Procedure called to validate C_FIFO_SIZE
	return true
}

proc update_PARAM_VALUE.C_MAX_BYTES_PER_BURST { PARAM_VALUE.C_MAX_BYTES_PER_BURST } {
	# Procedure called to update C_MAX_BYTES_PER_BURST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_MAX_BYTES_PER_BURST { PARAM_VALUE.C_MAX_BYTES_PER_BURST } {
	# Procedure called to validate C_MAX_BYTES_PER_BURST
	return true
}

proc update_PARAM_VALUE.C_DMA_TYPE_SRC { PARAM_VALUE.C_DMA_TYPE_SRC } {
	# Procedure called to update C_DMA_TYPE_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DMA_TYPE_SRC { PARAM_VALUE.C_DMA_TYPE_SRC } {
	# Procedure called to validate C_DMA_TYPE_SRC
	return true
}

proc update_PARAM_VALUE.C_DMA_TYPE_DEST { PARAM_VALUE.C_DMA_TYPE_DEST } {
	# Procedure called to update C_DMA_TYPE_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DMA_TYPE_DEST { PARAM_VALUE.C_DMA_TYPE_DEST } {
	# Procedure called to validate C_DMA_TYPE_DEST
	return true
}

proc update_PARAM_VALUE.C_DMA_AXI_PROTOCOL_SRC { PARAM_VALUE.C_DMA_AXI_PROTOCOL_SRC } {
	# Procedure called to update C_DMA_AXI_PROTOCOL_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DMA_AXI_PROTOCOL_SRC { PARAM_VALUE.C_DMA_AXI_PROTOCOL_SRC } {
	# Procedure called to validate C_DMA_AXI_PROTOCOL_SRC
	return true
}

proc update_PARAM_VALUE.C_DMA_AXI_PROTOCOL_DEST { PARAM_VALUE.C_DMA_AXI_PROTOCOL_DEST } {
	# Procedure called to update C_DMA_AXI_PROTOCOL_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DMA_AXI_PROTOCOL_DEST { PARAM_VALUE.C_DMA_AXI_PROTOCOL_DEST } {
	# Procedure called to validate C_DMA_AXI_PROTOCOL_DEST
	return true
}

proc update_PARAM_VALUE.C_CYCLIC { PARAM_VALUE.C_CYCLIC } {
	# Procedure called to update C_CYCLIC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CYCLIC { PARAM_VALUE.C_CYCLIC } {
	# Procedure called to validate C_CYCLIC
	return true
}

proc update_PARAM_VALUE.C_SYNC_TRANSFER_START { PARAM_VALUE.C_SYNC_TRANSFER_START } {
	# Procedure called to update C_SYNC_TRANSFER_START when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_SYNC_TRANSFER_START { PARAM_VALUE.C_SYNC_TRANSFER_START } {
	# Procedure called to validate C_SYNC_TRANSFER_START
	return true
}

proc update_PARAM_VALUE.C_AXI_SLICE_SRC { PARAM_VALUE.C_AXI_SLICE_SRC } {
	# Procedure called to update C_AXI_SLICE_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_SLICE_SRC { PARAM_VALUE.C_AXI_SLICE_SRC } {
	# Procedure called to validate C_AXI_SLICE_SRC
	return true
}

proc update_PARAM_VALUE.C_AXI_SLICE_DEST { PARAM_VALUE.C_AXI_SLICE_DEST } {
	# Procedure called to update C_AXI_SLICE_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_AXI_SLICE_DEST { PARAM_VALUE.C_AXI_SLICE_DEST } {
	# Procedure called to validate C_AXI_SLICE_DEST
	return true
}

proc update_PARAM_VALUE.C_CLKS_ASYNC_DEST_REQ { PARAM_VALUE.C_CLKS_ASYNC_DEST_REQ } {
	# Procedure called to update C_CLKS_ASYNC_DEST_REQ when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CLKS_ASYNC_DEST_REQ { PARAM_VALUE.C_CLKS_ASYNC_DEST_REQ } {
	# Procedure called to validate C_CLKS_ASYNC_DEST_REQ
	return true
}

proc update_PARAM_VALUE.C_CLKS_ASYNC_SRC_DEST { PARAM_VALUE.C_CLKS_ASYNC_SRC_DEST } {
	# Procedure called to update C_CLKS_ASYNC_SRC_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CLKS_ASYNC_SRC_DEST { PARAM_VALUE.C_CLKS_ASYNC_SRC_DEST } {
	# Procedure called to validate C_CLKS_ASYNC_SRC_DEST
	return true
}

proc update_PARAM_VALUE.C_CLKS_ASYNC_REQ_SRC { PARAM_VALUE.C_CLKS_ASYNC_REQ_SRC } {
	# Procedure called to update C_CLKS_ASYNC_REQ_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_CLKS_ASYNC_REQ_SRC { PARAM_VALUE.C_CLKS_ASYNC_REQ_SRC } {
	# Procedure called to validate C_CLKS_ASYNC_REQ_SRC
	return true
}

proc update_PARAM_VALUE.C_2D_TRANSFER { PARAM_VALUE.C_2D_TRANSFER } {
	# Procedure called to update C_2D_TRANSFER when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_2D_TRANSFER { PARAM_VALUE.C_2D_TRANSFER } {
	# Procedure called to validate C_2D_TRANSFER
	return true
}

proc update_PARAM_VALUE.C_DMA_LENGTH_WIDTH { PARAM_VALUE.C_DMA_LENGTH_WIDTH } {
	# Procedure called to update C_DMA_LENGTH_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DMA_LENGTH_WIDTH { PARAM_VALUE.C_DMA_LENGTH_WIDTH } {
	# Procedure called to validate C_DMA_LENGTH_WIDTH
	return true
}

proc update_PARAM_VALUE.C_DMA_DATA_WIDTH_DEST { PARAM_VALUE.C_DMA_DATA_WIDTH_DEST } {
	# Procedure called to update C_DMA_DATA_WIDTH_DEST when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DMA_DATA_WIDTH_DEST { PARAM_VALUE.C_DMA_DATA_WIDTH_DEST } {
	# Procedure called to validate C_DMA_DATA_WIDTH_DEST
	return true
}

proc update_PARAM_VALUE.C_DMA_DATA_WIDTH_SRC { PARAM_VALUE.C_DMA_DATA_WIDTH_SRC } {
	# Procedure called to update C_DMA_DATA_WIDTH_SRC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_DMA_DATA_WIDTH_SRC { PARAM_VALUE.C_DMA_DATA_WIDTH_SRC } {
	# Procedure called to validate C_DMA_DATA_WIDTH_SRC
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

proc update_MODELPARAM_VALUE.C_DMA_DATA_WIDTH_SRC { MODELPARAM_VALUE.C_DMA_DATA_WIDTH_SRC PARAM_VALUE.C_DMA_DATA_WIDTH_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DMA_DATA_WIDTH_SRC}] ${MODELPARAM_VALUE.C_DMA_DATA_WIDTH_SRC}
}

proc update_MODELPARAM_VALUE.C_DMA_DATA_WIDTH_DEST { MODELPARAM_VALUE.C_DMA_DATA_WIDTH_DEST PARAM_VALUE.C_DMA_DATA_WIDTH_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DMA_DATA_WIDTH_DEST}] ${MODELPARAM_VALUE.C_DMA_DATA_WIDTH_DEST}
}

proc update_MODELPARAM_VALUE.C_DMA_LENGTH_WIDTH { MODELPARAM_VALUE.C_DMA_LENGTH_WIDTH PARAM_VALUE.C_DMA_LENGTH_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DMA_LENGTH_WIDTH}] ${MODELPARAM_VALUE.C_DMA_LENGTH_WIDTH}
}

proc update_MODELPARAM_VALUE.C_2D_TRANSFER { MODELPARAM_VALUE.C_2D_TRANSFER PARAM_VALUE.C_2D_TRANSFER } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_2D_TRANSFER}] ${MODELPARAM_VALUE.C_2D_TRANSFER}
}

proc update_MODELPARAM_VALUE.C_CLKS_ASYNC_REQ_SRC { MODELPARAM_VALUE.C_CLKS_ASYNC_REQ_SRC PARAM_VALUE.C_CLKS_ASYNC_REQ_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CLKS_ASYNC_REQ_SRC}] ${MODELPARAM_VALUE.C_CLKS_ASYNC_REQ_SRC}
}

proc update_MODELPARAM_VALUE.C_CLKS_ASYNC_SRC_DEST { MODELPARAM_VALUE.C_CLKS_ASYNC_SRC_DEST PARAM_VALUE.C_CLKS_ASYNC_SRC_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CLKS_ASYNC_SRC_DEST}] ${MODELPARAM_VALUE.C_CLKS_ASYNC_SRC_DEST}
}

proc update_MODELPARAM_VALUE.C_CLKS_ASYNC_DEST_REQ { MODELPARAM_VALUE.C_CLKS_ASYNC_DEST_REQ PARAM_VALUE.C_CLKS_ASYNC_DEST_REQ } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CLKS_ASYNC_DEST_REQ}] ${MODELPARAM_VALUE.C_CLKS_ASYNC_DEST_REQ}
}

proc update_MODELPARAM_VALUE.C_AXI_SLICE_DEST { MODELPARAM_VALUE.C_AXI_SLICE_DEST PARAM_VALUE.C_AXI_SLICE_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_SLICE_DEST}] ${MODELPARAM_VALUE.C_AXI_SLICE_DEST}
}

proc update_MODELPARAM_VALUE.C_AXI_SLICE_SRC { MODELPARAM_VALUE.C_AXI_SLICE_SRC PARAM_VALUE.C_AXI_SLICE_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_AXI_SLICE_SRC}] ${MODELPARAM_VALUE.C_AXI_SLICE_SRC}
}

proc update_MODELPARAM_VALUE.C_SYNC_TRANSFER_START { MODELPARAM_VALUE.C_SYNC_TRANSFER_START PARAM_VALUE.C_SYNC_TRANSFER_START } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_SYNC_TRANSFER_START}] ${MODELPARAM_VALUE.C_SYNC_TRANSFER_START}
}

proc update_MODELPARAM_VALUE.C_CYCLIC { MODELPARAM_VALUE.C_CYCLIC PARAM_VALUE.C_CYCLIC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_CYCLIC}] ${MODELPARAM_VALUE.C_CYCLIC}
}

proc update_MODELPARAM_VALUE.C_DMA_AXI_PROTOCOL_DEST { MODELPARAM_VALUE.C_DMA_AXI_PROTOCOL_DEST PARAM_VALUE.C_DMA_AXI_PROTOCOL_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DMA_AXI_PROTOCOL_DEST}] ${MODELPARAM_VALUE.C_DMA_AXI_PROTOCOL_DEST}
}

proc update_MODELPARAM_VALUE.C_DMA_AXI_PROTOCOL_SRC { MODELPARAM_VALUE.C_DMA_AXI_PROTOCOL_SRC PARAM_VALUE.C_DMA_AXI_PROTOCOL_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DMA_AXI_PROTOCOL_SRC}] ${MODELPARAM_VALUE.C_DMA_AXI_PROTOCOL_SRC}
}

proc update_MODELPARAM_VALUE.C_DMA_TYPE_DEST { MODELPARAM_VALUE.C_DMA_TYPE_DEST PARAM_VALUE.C_DMA_TYPE_DEST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DMA_TYPE_DEST}] ${MODELPARAM_VALUE.C_DMA_TYPE_DEST}
}

proc update_MODELPARAM_VALUE.C_DMA_TYPE_SRC { MODELPARAM_VALUE.C_DMA_TYPE_SRC PARAM_VALUE.C_DMA_TYPE_SRC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_DMA_TYPE_SRC}] ${MODELPARAM_VALUE.C_DMA_TYPE_SRC}
}

proc update_MODELPARAM_VALUE.C_MAX_BYTES_PER_BURST { MODELPARAM_VALUE.C_MAX_BYTES_PER_BURST PARAM_VALUE.C_MAX_BYTES_PER_BURST } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_MAX_BYTES_PER_BURST}] ${MODELPARAM_VALUE.C_MAX_BYTES_PER_BURST}
}

proc update_MODELPARAM_VALUE.C_FIFO_SIZE { MODELPARAM_VALUE.C_FIFO_SIZE PARAM_VALUE.C_FIFO_SIZE } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_FIFO_SIZE}] ${MODELPARAM_VALUE.C_FIFO_SIZE}
}

