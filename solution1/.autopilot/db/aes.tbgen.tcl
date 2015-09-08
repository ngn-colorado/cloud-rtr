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
	{ m_mm2s_ctl int 32 regular {axi_master 2}  }
	{ m_s2mm_ctl int 32 regular {axi_master 2}  }
	{ sourceAddress int 32 regular {axi_slave 0}  }
	{ key_in_V int 128 regular {axi_slave 0}  }
	{ iv_V int 128 regular {axi_slave 0}  }
	{ destinationAddress int 32 regular {axi_slave 0}  }
	{ numBytes int 32 regular {axi_slave 0}  }
	{ s_in_V int 8 regular {axi_s 0 volatile  { s_in_V data } }  }
	{ s_out_V int 8 regular {axi_s 1 volatile  { s_out_V data } }  }
	{ mode int 32 regular {axi_slave 0}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "m_mm2s_ctl", "interface" : "axi_master", "bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "m_mm2s_ctl","cData": "unsigned int","cArray": [{"low" : 0,"up" : 499,"step" : 1}]}]}]} , 
 	{ "Name" : "m_s2mm_ctl", "interface" : "axi_master", "bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "m_s2mm_ctl","cData": "unsigned int","cArray": [{"low" : 0,"up" : 499,"step" : 1}]}]}]} , 
 	{ "Name" : "sourceAddress", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "sourceAddress","cData": "unsigned int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : [{"in":24}]} , 
 	{ "Name" : "key_in_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 128,"bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "key_in.V","cData": "uint128","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : [{"in":32}]} , 
 	{ "Name" : "iv_V", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 128,"bitSlice":[{"low":0,"up":127,"cElement": [{"cName": "iv.V","cData": "uint128","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}], "offset" : [{"in":52}]} , 
 	{ "Name" : "destinationAddress", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "destinationAddress","cData": "unsigned int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : [{"in":72}]} , 
 	{ "Name" : "numBytes", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "numBytes","cData": "unsigned int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : [{"in":80}]} , 
 	{ "Name" : "s_in_V", "interface" : "axis", "bitwidth" : 8,"bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "s_in.V","cData": "unsigned char","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "s_out_V", "interface" : "axis", "bitwidth" : 8,"bitSlice":[{"low":0,"up":7,"cElement": [{"cName": "s_out.V","cData": "unsigned char","cArray": [{"low" : 0,"up" : 0,"step" : 1}]}]}]} , 
 	{ "Name" : "mode", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_vld","bitwidth" : 32,"bitSlice":[{"low":0,"up":31,"cElement": [{"cName": "mode","cData": "int","cArray": [{"low" : 0,"up" : 0,"step" : 0}]}]}], "offset" : [{"in":88}]} , 
 	{ "Name" : "ap_return", "interface" : "axi_slave", "bundle":"AXILiteS","type":"ap_none","bitwidth" : 1,"bitSlice":[{"low":0,"up":0,"cElement": [{"cName": "return","cData": "","cArray": [{"low" : 0,"up" : 1,"step" : 0}]}]}], "offset" : [{"out":16}]} ]}
# RTL Port declarations: 
set portNum 116
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
	{ m_axi_m_mm2s_ctl_AWVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWID sc_out sc_lv 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_m_mm2s_ctl_AWUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_WVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_WREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_WDATA sc_out sc_lv 32 signal 0 } 
	{ m_axi_m_mm2s_ctl_WSTRB sc_out sc_lv 4 signal 0 } 
	{ m_axi_m_mm2s_ctl_WLAST sc_out sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_WID sc_out sc_lv 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_WUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARVALID sc_out sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARREADY sc_in sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARADDR sc_out sc_lv 32 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARID sc_out sc_lv 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARLEN sc_out sc_lv 8 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARSIZE sc_out sc_lv 3 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARBURST sc_out sc_lv 2 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARLOCK sc_out sc_lv 2 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARCACHE sc_out sc_lv 4 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARPROT sc_out sc_lv 3 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARQOS sc_out sc_lv 4 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARREGION sc_out sc_lv 4 signal 0 } 
	{ m_axi_m_mm2s_ctl_ARUSER sc_out sc_lv 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_RVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_RREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_RDATA sc_in sc_lv 32 signal 0 } 
	{ m_axi_m_mm2s_ctl_RLAST sc_in sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_RID sc_in sc_lv 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_RUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_RRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_m_mm2s_ctl_BVALID sc_in sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_BREADY sc_out sc_logic 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_BRESP sc_in sc_lv 2 signal 0 } 
	{ m_axi_m_mm2s_ctl_BID sc_in sc_lv 1 signal 0 } 
	{ m_axi_m_mm2s_ctl_BUSER sc_in sc_lv 1 signal 0 } 
	{ m_axi_m_s2mm_ctl_AWVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWID sc_out sc_lv 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_m_s2mm_ctl_AWUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_WVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_WREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_WDATA sc_out sc_lv 32 signal 1 } 
	{ m_axi_m_s2mm_ctl_WSTRB sc_out sc_lv 4 signal 1 } 
	{ m_axi_m_s2mm_ctl_WLAST sc_out sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_WID sc_out sc_lv 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_WUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARVALID sc_out sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARREADY sc_in sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARADDR sc_out sc_lv 32 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARID sc_out sc_lv 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARLEN sc_out sc_lv 8 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARSIZE sc_out sc_lv 3 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARBURST sc_out sc_lv 2 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARLOCK sc_out sc_lv 2 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARCACHE sc_out sc_lv 4 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARPROT sc_out sc_lv 3 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARQOS sc_out sc_lv 4 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARREGION sc_out sc_lv 4 signal 1 } 
	{ m_axi_m_s2mm_ctl_ARUSER sc_out sc_lv 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_RVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_RREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_RDATA sc_in sc_lv 32 signal 1 } 
	{ m_axi_m_s2mm_ctl_RLAST sc_in sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_RID sc_in sc_lv 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_RUSER sc_in sc_lv 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_RRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_m_s2mm_ctl_BVALID sc_in sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_BREADY sc_out sc_logic 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_BRESP sc_in sc_lv 2 signal 1 } 
	{ m_axi_m_s2mm_ctl_BID sc_in sc_lv 1 signal 1 } 
	{ m_axi_m_s2mm_ctl_BUSER sc_in sc_lv 1 signal 1 } 
	{ s_in_V_TDATA sc_in sc_lv 8 signal 7 } 
	{ s_in_V_TVALID sc_in sc_logic 1 invld 7 } 
	{ s_in_V_TREADY sc_out sc_logic 1 inacc 7 } 
	{ s_out_V_TDATA sc_out sc_lv 8 signal 8 } 
	{ s_out_V_TVALID sc_out sc_logic 1 outvld 8 } 
	{ s_out_V_TREADY sc_in sc_logic 1 outacc 8 } 
	{ interrupt sc_out sc_logic 1 signal -1 } 
}
set NewPortList {[ 
	{ "name": "s_axi_AXILiteS_AWADDR", "direction": "in", "datatype": "sc_lv", "bitwidth":7, "type": "signal", "bundle":{"name": "AXILiteS", "role": "AWADDR" },"address":[{"name":"aes","role":"start","value":"0","valid_bit":"0"},{"name":"aes","role":"continue","value":"0","valid_bit":"4"},{"name":"aes","role":"auto_start","value":"0","valid_bit":"7"},{"name":"sourceAddress","role":"data","value":"24"}, {"name":"sourceAddress","role":"valid","value":"28","valid_bit":"0"},{"name":"key_in_V","role":"data","value":"32"}, {"name":"key_in_V","role":"valid","value":"48","valid_bit":"0"},{"name":"iv_V","role":"data","value":"52"}, {"name":"iv_V","role":"valid","value":"68","valid_bit":"0"},{"name":"destinationAddress","role":"data","value":"72"}, {"name":"destinationAddress","role":"valid","value":"76","valid_bit":"0"},{"name":"numBytes","role":"data","value":"80"}, {"name":"numBytes","role":"valid","value":"84","valid_bit":"0"},{"name":"mode","role":"data","value":"88"}, {"name":"mode","role":"valid","value":"92","valid_bit":"0"}] },
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
 	{ "name": "m_axi_m_mm2s_ctl_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWVALID" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWREADY" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWADDR" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWID" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWLEN" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWBURST" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWPROT" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWQOS" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWREGION" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "AWUSER" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "WVALID" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "WREADY" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "WDATA" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "WSTRB" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "WLAST" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "WID" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "WUSER" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARVALID" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARREADY" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARADDR" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARID" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARLEN" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARBURST" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARPROT" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARQOS" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARREGION" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "ARUSER" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "RVALID" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "RREADY" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "RDATA" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "RLAST" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "RID" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "RUSER" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "RRESP" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "BVALID" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "BREADY" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "BRESP" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "BID" }} , 
 	{ "name": "m_axi_m_mm2s_ctl_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_mm2s_ctl", "role": "BUSER" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWVALID" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWREADY" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWADDR" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWID" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWLEN" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWSIZE" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWBURST" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWLOCK" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWCACHE" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWPROT" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWQOS" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWREGION" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_AWUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "AWUSER" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_WVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "WVALID" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_WREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "WREADY" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_WDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "WDATA" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_WSTRB", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "WSTRB" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_WLAST", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "WLAST" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_WID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "WID" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_WUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "WUSER" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARVALID" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARREADY" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARADDR", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARADDR" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARID", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARID" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARLEN", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARLEN" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARSIZE", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARSIZE" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARBURST", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARBURST" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARLOCK", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARLOCK" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARCACHE", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARCACHE" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARPROT", "direction": "out", "datatype": "sc_lv", "bitwidth":3, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARPROT" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARQOS", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARQOS" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARREGION", "direction": "out", "datatype": "sc_lv", "bitwidth":4, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARREGION" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_ARUSER", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "ARUSER" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_RVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "RVALID" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_RREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "RREADY" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_RDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "RDATA" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_RLAST", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "RLAST" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_RID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "RID" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_RUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "RUSER" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_RRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "RRESP" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_BVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "BVALID" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_BREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "BREADY" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_BRESP", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "BRESP" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_BID", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "BID" }} , 
 	{ "name": "m_axi_m_s2mm_ctl_BUSER", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "m_s2mm_ctl", "role": "BUSER" }} , 
 	{ "name": "s_in_V_TDATA", "direction": "in", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "s_in_V", "role": "TDATA" }} , 
 	{ "name": "s_in_V_TVALID", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "invld", "bundle":{"name": "s_in_V", "role": "TVALID" }} , 
 	{ "name": "s_in_V_TREADY", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "inacc", "bundle":{"name": "s_in_V", "role": "TREADY" }} , 
 	{ "name": "s_out_V_TDATA", "direction": "out", "datatype": "sc_lv", "bitwidth":8, "type": "signal", "bundle":{"name": "s_out_V", "role": "TDATA" }} , 
 	{ "name": "s_out_V_TVALID", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "s_out_V", "role": "TVALID" }} , 
 	{ "name": "s_out_V_TREADY", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "outacc", "bundle":{"name": "s_out_V", "role": "TREADY" }} , 
 	{ "name": "interrupt", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "interrupt", "role": "default" }}  ]}
set Spec2ImplPortList { 
	m_mm2s_ctl { m_axi {  { m_axi_m_mm2s_ctl_AWVALID VALID 1 1 }  { m_axi_m_mm2s_ctl_AWREADY READY 0 1 }  { m_axi_m_mm2s_ctl_AWADDR ADDR 1 32 }  { m_axi_m_mm2s_ctl_AWID ID 1 1 }  { m_axi_m_mm2s_ctl_AWLEN LEN 1 8 }  { m_axi_m_mm2s_ctl_AWSIZE SIZE 1 3 }  { m_axi_m_mm2s_ctl_AWBURST BURST 1 2 }  { m_axi_m_mm2s_ctl_AWLOCK LOCK 1 2 }  { m_axi_m_mm2s_ctl_AWCACHE CACHE 1 4 }  { m_axi_m_mm2s_ctl_AWPROT PROT 1 3 }  { m_axi_m_mm2s_ctl_AWQOS QOS 1 4 }  { m_axi_m_mm2s_ctl_AWREGION REGION 1 4 }  { m_axi_m_mm2s_ctl_AWUSER USER 1 1 }  { m_axi_m_mm2s_ctl_WVALID VALID 1 1 }  { m_axi_m_mm2s_ctl_WREADY READY 0 1 }  { m_axi_m_mm2s_ctl_WDATA DATA 1 32 }  { m_axi_m_mm2s_ctl_WSTRB STRB 1 4 }  { m_axi_m_mm2s_ctl_WLAST LAST 1 1 }  { m_axi_m_mm2s_ctl_WID ID 1 1 }  { m_axi_m_mm2s_ctl_WUSER USER 1 1 }  { m_axi_m_mm2s_ctl_ARVALID VALID 1 1 }  { m_axi_m_mm2s_ctl_ARREADY READY 0 1 }  { m_axi_m_mm2s_ctl_ARADDR ADDR 1 32 }  { m_axi_m_mm2s_ctl_ARID ID 1 1 }  { m_axi_m_mm2s_ctl_ARLEN LEN 1 8 }  { m_axi_m_mm2s_ctl_ARSIZE SIZE 1 3 }  { m_axi_m_mm2s_ctl_ARBURST BURST 1 2 }  { m_axi_m_mm2s_ctl_ARLOCK LOCK 1 2 }  { m_axi_m_mm2s_ctl_ARCACHE CACHE 1 4 }  { m_axi_m_mm2s_ctl_ARPROT PROT 1 3 }  { m_axi_m_mm2s_ctl_ARQOS QOS 1 4 }  { m_axi_m_mm2s_ctl_ARREGION REGION 1 4 }  { m_axi_m_mm2s_ctl_ARUSER USER 1 1 }  { m_axi_m_mm2s_ctl_RVALID VALID 0 1 }  { m_axi_m_mm2s_ctl_RREADY READY 1 1 }  { m_axi_m_mm2s_ctl_RDATA DATA 0 32 }  { m_axi_m_mm2s_ctl_RLAST LAST 0 1 }  { m_axi_m_mm2s_ctl_RID ID 0 1 }  { m_axi_m_mm2s_ctl_RUSER USER 0 1 }  { m_axi_m_mm2s_ctl_RRESP RESP 0 2 }  { m_axi_m_mm2s_ctl_BVALID VALID 0 1 }  { m_axi_m_mm2s_ctl_BREADY READY 1 1 }  { m_axi_m_mm2s_ctl_BRESP RESP 0 2 }  { m_axi_m_mm2s_ctl_BID ID 0 1 }  { m_axi_m_mm2s_ctl_BUSER USER 0 1 } } }
	m_s2mm_ctl { m_axi {  { m_axi_m_s2mm_ctl_AWVALID VALID 1 1 }  { m_axi_m_s2mm_ctl_AWREADY READY 0 1 }  { m_axi_m_s2mm_ctl_AWADDR ADDR 1 32 }  { m_axi_m_s2mm_ctl_AWID ID 1 1 }  { m_axi_m_s2mm_ctl_AWLEN LEN 1 8 }  { m_axi_m_s2mm_ctl_AWSIZE SIZE 1 3 }  { m_axi_m_s2mm_ctl_AWBURST BURST 1 2 }  { m_axi_m_s2mm_ctl_AWLOCK LOCK 1 2 }  { m_axi_m_s2mm_ctl_AWCACHE CACHE 1 4 }  { m_axi_m_s2mm_ctl_AWPROT PROT 1 3 }  { m_axi_m_s2mm_ctl_AWQOS QOS 1 4 }  { m_axi_m_s2mm_ctl_AWREGION REGION 1 4 }  { m_axi_m_s2mm_ctl_AWUSER USER 1 1 }  { m_axi_m_s2mm_ctl_WVALID VALID 1 1 }  { m_axi_m_s2mm_ctl_WREADY READY 0 1 }  { m_axi_m_s2mm_ctl_WDATA DATA 1 32 }  { m_axi_m_s2mm_ctl_WSTRB STRB 1 4 }  { m_axi_m_s2mm_ctl_WLAST LAST 1 1 }  { m_axi_m_s2mm_ctl_WID ID 1 1 }  { m_axi_m_s2mm_ctl_WUSER USER 1 1 }  { m_axi_m_s2mm_ctl_ARVALID VALID 1 1 }  { m_axi_m_s2mm_ctl_ARREADY READY 0 1 }  { m_axi_m_s2mm_ctl_ARADDR ADDR 1 32 }  { m_axi_m_s2mm_ctl_ARID ID 1 1 }  { m_axi_m_s2mm_ctl_ARLEN LEN 1 8 }  { m_axi_m_s2mm_ctl_ARSIZE SIZE 1 3 }  { m_axi_m_s2mm_ctl_ARBURST BURST 1 2 }  { m_axi_m_s2mm_ctl_ARLOCK LOCK 1 2 }  { m_axi_m_s2mm_ctl_ARCACHE CACHE 1 4 }  { m_axi_m_s2mm_ctl_ARPROT PROT 1 3 }  { m_axi_m_s2mm_ctl_ARQOS QOS 1 4 }  { m_axi_m_s2mm_ctl_ARREGION REGION 1 4 }  { m_axi_m_s2mm_ctl_ARUSER USER 1 1 }  { m_axi_m_s2mm_ctl_RVALID VALID 0 1 }  { m_axi_m_s2mm_ctl_RREADY READY 1 1 }  { m_axi_m_s2mm_ctl_RDATA DATA 0 32 }  { m_axi_m_s2mm_ctl_RLAST LAST 0 1 }  { m_axi_m_s2mm_ctl_RID ID 0 1 }  { m_axi_m_s2mm_ctl_RUSER USER 0 1 }  { m_axi_m_s2mm_ctl_RRESP RESP 0 2 }  { m_axi_m_s2mm_ctl_BVALID VALID 0 1 }  { m_axi_m_s2mm_ctl_BREADY READY 1 1 }  { m_axi_m_s2mm_ctl_BRESP RESP 0 2 }  { m_axi_m_s2mm_ctl_BID ID 0 1 }  { m_axi_m_s2mm_ctl_BUSER USER 0 1 } } }
	s_in_V { axis {  { s_in_V_TDATA in_data 0 8 }  { s_in_V_TVALID in_vld 0 1 }  { s_in_V_TREADY in_acc 1 1 } } }
	s_out_V { axis {  { s_out_V_TDATA out_data 1 8 }  { s_out_V_TVALID out_vld 1 1 }  { s_out_V_TREADY out_acc 0 1 } } }
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
