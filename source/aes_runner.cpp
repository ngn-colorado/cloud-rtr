#include <ap_int.h>
//#include <ap_cint.h>
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

//typedef ap_uint<8> uint8_t;
typedef unsigned char uint8_t;
typedef hls::stream<uint8_t> mem_stream8;

//I implement PKCS padding, as that seems to be what OpenSSL does. The buffers pointed to by the src and dest addresses
//need to have enough space for the final block, else the FPGA will clobber them


bool aes(volatile unsigned int m_mm2s_ctl [500], volatile unsigned int m_s2mm_ctl[500], volatile unsigned sourceAddress, ap_uint<128> *key_in, ap_uint<128> *iv,
		volatile unsigned destinationAddress, unsigned int numBytes,
		mem_stream8& s_in, mem_stream8& s_out, int mode){
#pragma HLS INTERFACE s_axilite port=iv

#pragma HLS INTERFACE ap_vld port=iv

#pragma HLS INTERFACE s_axilite port=numBytes

#pragma HLS INTERFACE ap_vld port=numBytes

#pragma HLS INTERFACE s_axilite port=mode

#pragma HLS INTERFACE ap_vld port=mode

#pragma HLS INTERFACE s_axilite port=destinationAddress

#pragma HLS INTERFACE s_axilite port=key_in

#pragma HLS INTERFACE s_axilite port=sourceAddress

#pragma HLS INTERFACE m_axi port=m_s2mm_ctl

#pragma HLS INTERFACE m_axi port=m_mm2s_ctl

#pragma HLS INTERFACE ap_ctrl_hs port=return

#pragma HLS INTERFACE s_axilite port=return

#pragma HLS INTERFACE axis depth=1000 port=s_out

#pragma HLS INTERFACE axis depth=1000 port=s_in

#pragma HLS INTERFACE ap_vld port=destinationAddress

#pragma HLS INTERFACE ap_vld port=key_in

#pragma HLS INTERFACE ap_vld port=sourceAddress

	//for i to length, fetch 128 bits of data, call aes function on data, and write data back out
	//increment the source and dest address by 128 bits each time
	int i, j, iterations, numIterations;

	unsigned remainingBytes;
	unsigned char mask;
	unsigned sourceAddressLocal = sourceAddress;
	unsigned destinationAddressLocal = destinationAddress;
	char temp_buffer_in[16];
	char temp_buffer_out[16];
	char plaintext_buffer[16];
	char tempBuf[16];

	ap_uint<8> temp;

	ap_uint<128> key_local; //= *key_in;
	ap_uint<128> iv_local;
	ap_uint<128> count = 0;

	//calculate the number of iterations. since we implement padding, this should be
	//ceil(numBytes/16). Also need to keep track of the number of bytes we have done
	//to check if we need to pad the current input
	numIterations = numBytes/16 + (numBytes % 16 != 0);
	remainingBytes = numBytes;

	m_mm2s_ctl[0] &= 0;
	m_s2mm_ctl[12] &= 0;

	m_mm2s_ctl[0] |= 4;
	m_s2mm_ctl[12] |= 4;

	m_mm2s_ctl[0] &= 0;
	m_s2mm_ctl[12] &= 0;

	//--------Program read DMA mm2s----------
	//enable read dma block
	m_mm2s_ctl[0] |= 1;
	//enable read interupts
	m_mm2s_ctl[0] |= 4096;
	//write source address
	m_mm2s_ctl[6] = sourceAddress;
	//calculate # of bytes that will be read from s_in in total
	//read_length = #encryptions X #bytes/encryption
	int read_length;
//	if(mode==2){
//		read_length = numBytes;
//	} else{
		read_length = numIterations*16;//length*sizeof(ap_uint<128>);
//	}
	m_mm2s_ctl[10] = read_length;

	//--------Program write DMA s2mm--------
	//enable s2mm on write dma block
	m_s2mm_ctl[12] |= 1;
	//enable write interrupts
	m_s2mm_ctl[12] |= 4096;
	//write dest address
	m_s2mm_ctl[18] = destinationAddress;
	//write write length as the same as read length
	m_s2mm_ctl[22] = read_length;

	//Now reverse the key and the iv
	for(i=0; i<16; i++){
#pragma HLS UNROLL
		tempBuf[i] = key_in->range(i*8 + 7, i*8);
		ap_uint<8> tmp(tempBuf[i]);
		key_local = key_local.concat(tmp);

		tempBuf[i] = iv->range(i*8 + 7, i*8);
		ap_uint<8> tmp2(tempBuf[i]);
		iv_local = iv_local.concat(tmp2);
	}

	ap_uint<128> encrypted_data;


	for(iterations = 0; iterations<numIterations; iterations++){
//		ap_uint<128> data(0);
//
//		for(i = 0; i<16; i++){
//			mask = 128;
//			for(j=0; j<8; j++){
//				if(ddr[sourceAddressLocal + i] & mask){
//					data.set((127 - 8*i) - j);
//				}
//				mask = mask >> 1;
//			}
//		}
		//Need to pull out the 16 input bytes from the stream and place them in the correct place.
			//first, loop through and concatenate them onto the variable
		ap_uint<128> data(0); //s_in.read();
		ap_uint<8> tempData[16];


		//read them in and put into the byte-reversed position. if on the last cell that needs padding,
		//only read in the number of bytes that are left to encrypt
		for(i=0; i<16; i++){
#pragma HLS UNROLL
			temp = s_in.read();
			plaintext_buffer[i] = temp;
			temp_buffer_in[i] = temp;
		}
		for(i=0; i<16; i++){
#pragma HLS UNROLL
			temp = temp_buffer_in[15-i];
			ap_uint<8> tmp(temp);
			data = data.concat(temp);
		}
//		printf("\nFabric data final:   %s", ((ap_uint<128>)data).to_string().c_str());

		/*
		 * MODES:
		 * 	0: ECB mode - standard block-cipher mode with no iv (Electronic Code Book mode)
		 * 	1: CBC mode - Cipher Block Chaining mode - XOR 1st plaintext with iv before AES, XOR subsequent plaintext with ciphertext of previous run before AES
		 * 	2: CTR mode - Counter mode - Use iv as a counter. Encrypt the counter in AES each iteration. XOR the output with plaintext to get cipher text. Increment counter and repeat for each chunk
		 */

		if(mode == 1){
			if(count == 0){
				data = data^iv_local;
			} else{
				data = data^encrypted_data;
			}
			aestest(&data, &key_local, &encrypted_data);
			count++;
		} else if(mode == 2){
			aestest(&count, &key_local, &encrypted_data);
			encrypted_data = encrypted_data^data;
			count++;
		} else{
			aestest(&data, &key_local, &encrypted_data);
		}

		for(i=0; i<16; i++){
#pragma HLS UNROLL
			temp_buffer_out[i] = encrypted_data.range(i*8 + 7, i*8);
		}

//		printf("\nEncrypted data in fabric: %s", encrypted_data.to_string().c_str());
//		char current = 0;
//		for(i=0; i < 16; i++)
//		{
//			current = encrypted_data.range(127-i*8, (120)-i*8);
//			ddr[destinationAddressLocal + i] = current;
//		}
		//s_out.write(encrypted_data);

		//Now need to write them out in reverse order
		for(i=0; i<16; i++){
#pragma HLS UNROLL
			temp = ap_uint<8>(temp_buffer_out[i]);

			s_out.write(temp);
		}

		remainingBytes -= 16;
		sourceAddressLocal += 16;
		destinationAddressLocal += 16;
	}
	return true;
}
