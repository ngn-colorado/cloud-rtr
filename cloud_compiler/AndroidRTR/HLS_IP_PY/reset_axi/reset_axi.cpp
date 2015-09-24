void reset_axi(int *in_reset, bool *reset_out)
{
#pragma HLS RESOURCE variable=in_reset core=AXI4LiteS

#pragma HLS INTERFACE ap_none port=in_reset

	if(*in_reset > 0)
		*reset_out = false;
	else
		*reset_out = true;
}
