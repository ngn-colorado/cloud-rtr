int add_ten(int *input, int *output)
{
#pragma HLS RESOURCE variable=output core=AXI4LiteS

#pragma HLS RESOURCE variable=input core=AXI4LiteS

#pragma HLS INTERFACE ap_none port=output

#pragma HLS INTERFACE ap_none port=input

	*output = *input + 10;
	return 0;
}
