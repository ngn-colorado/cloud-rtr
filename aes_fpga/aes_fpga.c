#include "aes_fpga.h"

struct FPGA_AES{
	const char* key;
	int key_length_bits;
	char* device;
	char* rst_device;
	unsigned shared_mem_base;
};

//data must be aligned to 16 bytes and zero-padded if needed
//len is provided as number of bytes to encrypt
int aes_encrypt(FPGA_AES *cipher, size_t len, unsigned src_addr, unsigned dst_addr){
	int i, j;
	XReset_axi reset_axi;
	if(XReset_axi_Initialize(&reset_axi, cipher->rst_device) != XST_SUCCESS){
//		__android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "\nCould not initialize axi reset device");
		printf("\nCould not initialize axi reset device: %s", cipher->rst_device);
		return -1;
	}
	XReset_axi_SetIn_reset(&reset_axi, 1);
	XReset_axi_SetIn_reset(&reset_axi, 0);
	XReset_axi_Release(&reset_axi);

	XAes aes_device;

	if(XAes_Initialize(&aes_device, cipher->device) != XST_SUCCESS){

//	         __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "\nCould not initialize aes device");
	         printf("\nCould not initialize aes device: %s", cipher->device);
	         return -2;
	}
	
	XAes_Key_in_v key_in;
	u32 key_array[4];
	for(i=0; i<4; i++){
		u32 current = 0;
	        for(j=0; j<4; j++){
		        int key_part = cipher->key[15-i*4-j];
	        	key_part = key_part << (8*j);
		        current += key_part;
		}
		key_array[i] = current;
	}

	key_in.word_0 = key_array[0];
	key_in.word_1 = key_array[1];
	key_in.word_2 = key_array[2];
	key_in.word_3 = key_array[3];

	unsigned source = src_addr;
	unsigned dest = dst_addr;
	//TODO: take ceil of len/16
	unsigned data_length = len/16;

	XAes_Start(&aes_device);

	XAes_Set_key_in_V(&aes_device, key_in);

	XAes_Set_sourceAddress(&aes_device, source);

	XAes_Set_destinationAddress(&aes_device, dest);

	XAes_Set_length_r(&aes_device, data_length);

	XAes_Set_sourceAddress_vld(&aes_device);

	XAes_Set_key_in_V_vld(&aes_device);

	XAes_Set_destinationAddress_vld(&aes_device);

	XAes_Set_length_r_vld(&aes_device);

//	printf("\nWaiting for fabric");

	int finished = XAes_Get_return(&aes_device);

	while(XAes_IsDone(&aes_device) != 1){}

	XAes_Release(&aes_device);

	return finished;
}

//assume that the iv is 16 bits, as is supposed to be
int Aes_encrypt_cbc_memcpy(FPGA_AES *cipher, const char *input, size_t len, char *output, char* iv){
	int i, j;	
	char *current_iv = iv;
	char current_data[16];
	char *current_out = output;
	int num_encryptions = len/16;
	for(i=0; i<num_encryptions; i++){
		for(j=0; j<16; j++){
			current_data[j] = current_iv[j] ^ input[i*16 + j];
		}
		if(Aes_encrypt_memcpy(cipher, current_data, 16, current_out) != 0){
			return -1;
		}
		current_iv = current_out;
		current_out = current_out + 16;
	}
	return 0;
}

//memcpy to the shared memory from the source and memcpy back to the dest
//this function does not need src and dest addresses, as it can allocate
//wherever it needs to in the shared mem area
//NOTE: for the current AES fpga implementation, be sure to put the input
//in byte-reversed AND pull the output out byte-reversed. Cannot use
//system memcpy for that
int Aes_encrypt_memcpy(FPGA_AES *cipher, const char *input, size_t len, char *output){
	shared_memory mem = NULL;
	int i, j;
	int iterLen = len/16;
	if((mem = getSharedMemoryArea(cipher->shared_mem_base, len*3)) == NULL){
		printf("\nCould not get shared memory area");
		return -1;
	}
	unsigned src = cipher->shared_mem_base;
	//printf("\nSource: 0x%02x", src);
	unsigned dest = src+len;
	//printf("\nDest: 0x%02x", dest);

//	memcpy((void*)(mem->ptr), (const void*)(input), len);
	for(i=0; i<iterLen; i++){
		for(j=0; j<16; j++){
			((char*)mem->ptr)[i*16+j] = input[i*16 + (15-j)];
		}
	}


	aes_encrypt(cipher, len, src, dest);

	char *aes_out = ((char*)(mem->ptr)) + len;
	char *output_rw = output;
	
//	memcpy((void*)(output), (const void*)(aes_out), len);
	for(i=0; i<iterLen; i++){
		for(j=0; j<16; j++){
			output_rw[i*16+j] = aes_out[i*16 + (15-j)];
		}
	}

	cleanupSharedMemoryPointer(mem);
	return 0;
}


//create a new FPGA AES struct, with info on the shared memory region
FPGA_AES* fpga_aes_new(const char *key, size_t key_len, unsigned shared_mem_base, char* device_name, char* rst_device){
	FPGA_AES *cipher = NULL;
	if((cipher=malloc(sizeof(FPGA_AES))) == NULL){
		return NULL;
	}
	cipher->key=key;
	cipher->key_length_bits = key_len;
	cipher->device = device_name;
	cipher->rst_device = rst_device;
	cipher->shared_mem_base = shared_mem_base;
	return cipher;
}


//free an fpga aes struct
void fpga_aes_free(FPGA_AES *cipher){
	free(cipher);
}
