#include <ap_int.h>
#include <hls_stream.h>

void aestest(ap_uint<128>*, ap_uint<128>*, ap_uint<128>*);

//ap_uint<128> createIntFromChar(volatile unsigned char* data){
//	int i, j;
//	unsigned char mask;
//	ap_uint<128> new_data(0);
//
//	for(i = 0; i<16; i++){
//		mask = 128;
//		for(j=0; j<8; j++){
//			if(data[i] & mask){
//				new_data.set((127 - 8*i) - j);
//			}
//			mask = mask >> 1;
//		}
//	}
//	return new_data;
//}

//void writeDataOut(volatile unsigned int* AXI_DMA_SLAVE, unsigned destinationAddress,
//		volatile ap_uint<128> data, volatile ap_uint<1>* interrupt, volatile unsigned char* data_out){
//	int i, j;
//	char current = 0;
//	AXI_DMA_SLAVE[12] |= 1;
//	AXI_DMA_SLAVE[12] |= 4096;
//	AXI_DMA_SLAVE[18] = destinationAddress;
//	AXI_DMA_SLAVE[22] = 128;
//
//	for(i=0; i < 16; i++)
//	{
//		current = ((ap_uint<128>)data).range(127-i*8, (120)-i*8);
//		data_out[i] = current;
//	}
//	bool local_finished = ((ap_uint<1>)(*interrupt)).test(0);
//	while(!local_finished){
//		local_finished = ((ap_uint<1>)(*interrupt)).test(0);
//	}
//}

//void setupFetchData(volatile unsigned int* AXI_DMA_SLAVE, unsigned sourceAddress,
//		volatile ap_uint<1>* interrupt){
//	int i, j;
//	AXI_DMA_SLAVE[0] |= 1;
//	AXI_DMA_SLAVE[0] |= 4096;
//	AXI_DMA_SLAVE[6] = sourceAddress;
//	AXI_DMA_SLAVE[10] = 128;
//	ap_uint<1> local_finished = *interrupt;
//	while(!local_finished.test(0)){
//		local_finished = *interrupt;
//	}
//}
typedef ap_uint<128> uint128_t;
typedef hls::stream<uint128_t> mem_stream;


bool aes(volatile unsigned char ddr[4194304], volatile unsigned sourceAddress, ap_uint<128>* key_in,
		volatile unsigned destinationAddress, unsigned int length){
#pragma HLS INTERFACE s_axilite port=length

#pragma HLS INTERFACE s_axilite port=destinationAddress

#pragma HLS INTERFACE s_axilite port=key_in

#pragma HLS INTERFACE s_axilite port=sourceAddress

#pragma HLS INTERFACE ap_ctrl_hs port=return

#pragma HLS INTERFACE s_axilite port=return

#pragma HLS INTERFACE ap_vld port=length

#pragma HLS INTERFACE ap_vld port=destinationAddress

#pragma HLS INTERFACE ap_vld port=key_in

#pragma HLS INTERFACE ap_vld port=sourceAddress

	//for i to length, fetch 128 bits of data, call aes function on data, and write data back out
	//increment the source and dest address by 128 bits each time
	int i, j, iterations = length;
	unsigned char mask;
	unsigned sourceAddressLocal = sourceAddress;
	unsigned destinationAddressLocal = destinationAddress;

	ap_uint<128> key_local = *key_in;
//	m_mm2s_ctl[0] &= 0;
//	m_s2mm_ctl[12] &= 0;
//
//	m_mm2s_ctl[0] |= 4;
//	m_s2mm_ctl[12] |= 4;
//
//	m_mm2s_ctl[0] &= 0;
//	m_s2mm_ctl[12] &= 0;
//
//	//--------Program read DMA mm2s----------
//	//enable read dma block
//	m_mm2s_ctl[0] |= 1;
//	//enable read interupts
//	m_mm2s_ctl[0] |= 4096;
//	//write source address
//	m_mm2s_ctl[6] = sourceAddress;
//	//calculate # of bytes that will be read from s_in in total
//	//read_length = #encryptions X #bytes/encryption
//	int read_length = length*sizeof(ap_uint<128>);
//	m_mm2s_ctl[10] = read_length;
//
//	//--------Program write DMA s2mm--------
//	//enable s2mm on write dma block
//	m_s2mm_ctl[12] |= 1;
//	//enable write interrupts
//	m_s2mm_ctl[12] |= 4096;
//	//write dest address
//	m_s2mm_ctl[18] = destinationAddress;
//	//write write length as the same as read length
//	m_s2mm_ctl[22] = read_length;
//
	ap_uint<128> encrypted_data;
	for(iterations = 0; iterations<length; iterations++){
		ap_uint<128> data(0);
//
		for(i = 0; i<16; i++){
			mask = 128;
			for(j=0; j<8; j++){
				if(ddr[sourceAddressLocal + i] & mask){
					data.set((127 - 8*i) - j);
				}
				mask = mask >> 1;
			}
		}
//		ap_uint<128> data = s_in.read();
//			printf("\nData in fabric: %s", data.to_string().c_str());
//			printf("\nKey in fabric: %s", ((ap_uint<128>*)key_in)->to_string().c_str());
		aestest(&data, &key_local, &encrypted_data);
//			printf("\nEncrypted data in fabric: %s", encrypted_data.to_string().c_str());
		char current = 0;
		for(i=0; i < 16; i++)
		{
			current = encrypted_data.range(127-i*8, (120)-i*8);
			ddr[destinationAddressLocal + i] = current;
		}
//		s_out.write(encrypted_data);

		sourceAddressLocal += 16;
		destinationAddressLocal += 16;
	}
	return true;
}
