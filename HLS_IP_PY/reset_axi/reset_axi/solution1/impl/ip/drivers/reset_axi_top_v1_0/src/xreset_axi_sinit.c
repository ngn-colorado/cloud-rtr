// ==============================================================
// File generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2014.1
// Copyright (C) 2014 Xilinx Inc. All rights reserved.
// 
// ==============================================================

#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xreset_axi.h"

extern XReset_axi_Config XReset_axi_ConfigTable[];

XReset_axi_Config *XReset_axi_LookupConfig(u16 DeviceId) {
	XReset_axi_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XRESET_AXI_NUM_INSTANCES; Index++) {
		if (XReset_axi_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XReset_axi_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XReset_axi_Initialize(XReset_axi *InstancePtr, u16 DeviceId) {
	XReset_axi_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XReset_axi_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XReset_axi_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

