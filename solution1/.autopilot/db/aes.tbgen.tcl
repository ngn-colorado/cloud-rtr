set moduleName aes
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set C_modelName aes
set C_modelType { int 1 }
set C_modelArgList { 
	{ ddr int 8 regular {array 4194304 { 2 3 } 1 1 }  }
	{ sourceAddress int 32 regular {axi_slave 0}  }
	{ key_in_V int 128 regular {axi_slave 0}  }
	{ destinationAddress int 32 regular {axi_slave 0}  }
	{ length_r int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "ddr", "interface" : "memory", "bitwidth" : 8,"bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "ddr","cData": "unsigned char","cArray": [{"low" : 0,"up" : 4194303,"step" : 1}]}]}]} , 
 	{ "Name" : "sourceAddress", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "sourceAddress","cData": "unsigned int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : [{"in":24}]} , 
 	{ "Name" : "key_in_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 128,"bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "key_in.V","cData": "uint128","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : [{"in":32}]} , 
 	{ "Name" : "destinationAddress", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "destinationAddress","cData": "unsigned int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : [{"in":52}]} , 
 	{ "Name" : "length_r", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "length","cData": "unsigned int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : [{"in":60}]} , 
 	{ "Name" : "ap_return", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 1,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "return","cData": "","cArray": [{"low" : 0,"up" : 1,"step" : 0}]}]}], "offset" : [{"out":16}]} ]}
# RTL Port declarations: 
set portNum 25
set portList { 
	{ s_axi_AXILiteS_AWVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_AWADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_AXILiteS_WVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_WDATA sc_in sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_WSTRB sc_in sc_lv 4 signal -1 } 
	{ s_axi_AXILiteS_ARVALID sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARREADY sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_ARADDR sc_in sc_lv 7 signal -1 } 
	{ s_axi_AXILiteS_RVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_RDATA sc_out sc_lv 32 signal -1 } 
	{ s_axi_AXILiteS_RRESP sc_out sc_lv 2 signal -1 } 
	{ s_axi_AXILiteS_BVALID sc_out sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BREADY sc_in sc_logic 1 signal -1 } 
	{ s_axi_AXILiteS_BRESP sc_out sc_lv 2 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst_n sc_in sc_logic 1 reset -1 active_low_sync } 
	{ ddr_address0 sc_out sc_lv 22 signal 0 } 
	{ ddr_ce0 sc_out sc_logic 1 signal 0 } 
	{ ddr_we0 sc_out sc_logic 1 signal 0 } 
	{ ddr_d0 sc_out sc_lv 8 signal 0 } 
	{ ddr_q0 sc_in sc_lv 8 signal 0 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_AXILiteS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWADDR" },"address":[{"name":"aes","role":"start","value":"0","valid_bit":"0"},{"name":"aes","role":"continue","value":"0","valid_bit":"4"},{"name":"aes","role":"auto_start","value":"0","valid_bit":"7"},{"name":"sourceAddress","role":"data","value":"24"}, {"name":"sourceAddress","role":"valid","value":"28","valid_bit":"0"},{"name":"key_in_V","role":"data","value":"32"}, {"name":"key_in_V","role":"valid","value":"48","valid_bit":"0"},{"name":"destinationAddress","role":"data","value":"52"}, {"name":"destinationAddress","role":"valid","value":"56","valid_bit":"0"},{"name":"length_r","role":"data","value":"60"}, {"name":"length_r","role":"valid","value":"64","valid_bit":"0"}] },
	{ "name": "s_axi_AXILiteS_AWVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWVALID" } },
	{ "name": "s_axi_AXILiteS_AWREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWREADY" } },
	{ "name": "s_axi_AXILiteS_WVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WVALID" } },
	{ "name": "s_axi_AXILiteS_WREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WREADY" } },
	{ "name": "s_axi_AXILiteS_WDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WDATA" } },
	{ "name": "s_axi_AXILiteS_WSTRB", "direction": "in", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "AXILiteS", "role": "WSTRB" } },
	{ "name": "s_axi_AXILiteS_ARADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARADDR" },"address":[{"name":"aes","role":"start","value":"0","valid_bit":"0"},{"name":"aes","role":"done","value":"0","valid_bit":"1"},{"name":"aes","role":"idle","value":"0","valid_bit":"2"},{"name":"aes","role":"ready","value":"0","valid_bit":"3"},{"name":"aes","role":"auto_start","value":"0","valid_bit":"7"},{"name":"return","role":"data","value":"16"}] },
	{ "name": "s_axi_AXILiteS_ARVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARVALID" } },
	{ "name": "s_axi_AXILiteS_ARREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "ARREADY" } },
	{ "name": "s_axi_AXILiteS_RVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RVALID" } },
	{ "name": "s_axi_AXILiteS_RREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RREADY" } },
	{ "name": "s_axi_AXILiteS_RDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RDATA" } },
	{ "name": "s_axi_AXILiteS_RRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "RRESP" } },
	{ "name": "s_axi_AXILiteS_BVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BVALID" } },
	{ "name": "s_axi_AXILiteS_BREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BREADY" } },
	{ "name": "s_axi_AXILiteS_BRESP", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "AXILiteS", "role": "BRESP" } }, 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst_n", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst_n", "role": "default" }} , 
 	{ "name": "ddr_address0", "direction": "out", "datatype": "sc_lv", "bitwidth":22, "type": "signal", "bundle":{"name": "ddr", "role": "address0" }} , 
 	{ "name": "ddr_ce0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ddr", "role": "ce0" }} , 
 	{ "name": "ddr_we0", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ddr", "role": "we0" }} , 
 	{ "name": "ddr_d0", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ddr", "role": "d0" }} , 
 	{ "name": "ddr_q0", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "ddr", "role": "q0" }} , 
 	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "interrupt", "role": "default" }}  ]}
set Spec2ImplPortList { 
	ddr { ap_memory {  { ddr_address0 mem_address 1 22 }  { ddr_ce0 mem_ce 1 1 }  { ddr_we0 mem_we 1 1 }  { ddr_d0 mem_din 1 8 }  { ddr_q0 mem_dout 0 8 } } }
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
