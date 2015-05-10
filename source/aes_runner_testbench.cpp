#include <ap_int.h>
#include <openssl/rand.h>
#include <openssl/aes.h>
#include <stdio.h>
#include <hls_stream.h>

typedef ap_uint<128> uint128_t;
typedef hls::stream<uint128_t> mem_stream;

void aestest(ap_uint<128>*, ap_uint<128>*, ap_uint<128>*);

//void aes(volatile unsigned*, unsigned, ap_uint<128>*,
//		unsigned, unsigned int, volatile ap_uint<128>*,
//		volatile ap_uint<128>*, volatile ap_uint<1>*,
//		volatile ap_uint<1>*, volatile bool*, volatile bool*,
//		unsigned, unsigned);

//bool aes(volatile ap_uint<128> ddr[4194304], volatile unsigned sourceAddress, ap_uint<128>* key_in,
//		volatile unsigned destinationAddress, unsigned int length){

bool aes(volatile ap_uint<128>*, volatile unsigned, ap_uint<128>*,
		volatile unsigned, unsigned int);

int main(){
//	volatile unsigned char ddr[0x3000];
	volatile ap_uint<128> ddr[0x300];
	volatile unsigned int mm2s[500];
	volatile unsigned int s2mm[500];
	volatile unsigned source = 0x1000;
	volatile unsigned dest = 0x2000;
	volatile ap_uint<128> fabric_dest_test(0);
	int iterations, outlen, i;

	for(i = 0; i<0x300; i++){
		ddr[i] = ap_uint<128>(0);
	}

	//test data:
	//014BAF2278A69D331D5180103643E99A
	volatile unsigned char data_to_encrypt[] = {0x01, 0x4B, 0xAF, 0x22, 0x78, 0xA6, 0x9D, 0x33, 0x1D, 0x51, 0x80, 0x10, 0x36, 0x43, 0xE9, 0x9A, '\0'};
	volatile unsigned char data_to_encrypt2[] = {0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, '\0'};


	ap_uint<128> data_to_encrypt_fabric("014BAF2278A69D331D5180103643E99A", 16);
	ap_uint<128> data_to_encrypt_fabric2("41414141414141414141414141414141", 16);
	unsigned char* encrypted_data = (unsigned char*)malloc(16);
//	for(i = 0; i<16; i++){
//		encrypted_data[0] = 0;
//		ddr[0x1000+i] = data_to_encrypt[i];
//		ddr[0x1000+i+16] = data_to_encrypt2[i];
//	}
	ddr[0x100] = data_to_encrypt_fabric;
	ddr[0x101] = data_to_encrypt_fabric2;

	//test key:
	//E8E9EAEBEDEEEFF0F2F3F4F5F7F8F9FA
	unsigned char key[] = {0xE8, 0xE9, 0xEA, 0xEB, 0xED, 0xEE, 0xEF, 0xF0, 0xF2, 0xF3, 0xF4, 0xF5, 0xF7, 0xF8, 0xF9, 0xFA, '\0'};
	ap_uint<128> fabric_key("E8E9EAEBEDEEEFF0F2F3F4F5F7F8F9FA", 16);
//	if(!RAND_bytes(key, sizeof(key))){
//		printf("\ngeneration of key failed");
//		return -1;
//	}
	printf("\nGenerated AES key: %s", key);
	printf("\nGenerated AES key hex: 0x");
	for(i = 0; i<16; i++){
		printf("%02x", key[i]);
	}
	printf("\nGenerated AES key hex: %s - fabric", fabric_key.to_string().c_str());
	printf("\nData to encrypt: 0x");
	for(i = 0; i<16; i++){
		printf("%02x", data_to_encrypt[i]);
	}
	printf("\nData to encrypt: %s - ap_uint<128> sent to fabric", ((ap_uint<128>)data_to_encrypt_fabric).to_string().c_str());

	AES_KEY aes_key;
	AES_set_encrypt_key(key, 128, &aes_key);

	AES_encrypt((unsigned char*)data_to_encrypt, encrypted_data, &aes_key);

	printf("\nEncrypted data as hex: 0x");
	for(i = 0; i<16; i++){
		printf("%02x", encrypted_data[i]);
	}
	printf(" - first from openssl");
	aestest((ap_uint<128>*)&data_to_encrypt_fabric, &fabric_key, (ap_uint<128>*)&fabric_dest_test);
	printf("\nEncrypted data as hex: %s - from fabric software implementation", ((ap_uint<128>)fabric_dest_test).to_string().c_str());
	volatile bool finished;

//	mem_stream read_stream;
//	mem_stream write_stream;
//	read_stream.write(data_to_encrypt_fabric);
//	read_stream.write(data_to_encrypt_fabric2);

	aes(ddr, source, &fabric_key, dest, (unsigned int)2);

	printf("\nEncrypted data as hex:");//%s - from fabric", ((ap_uint<128>)fabric_dest_test).to_string().c_str());
//	for(i=0; i<16; i++){
	printf("%s", ((ap_uint<128>)ddr[0x200]).to_string().c_str());
//	}
	printf(" - from fabric");

	printf("\nEncrypted data as hex:");
//	for(i=0; i<16; i++){
	printf("%s", ((ap_uint<128>)ddr[0x201]).to_string().c_str());
//	}
	printf(" - from fabric #2");
//	ap_uint<128> first_fabric = write_stream.read();
//	ap_uint<128> second_fabric = write_stream.read();
	ap_uint<128> first_fabric = ddr[0x200];
	ap_uint<128> second_fabric = ddr[0x201];
	printf("\nEncrypted data as hex: %s - fabric 1", first_fabric.to_string().c_str());
//	printf("\nEncrypted data as hex: %s - fabric 1", ((ap_uint<128>)s_out[0]).to_string().c_str());
//	printf("Encrypted data as hex: %s - fabric 2", ((ap_uint<128>)s_out[1]).to_string().c_str());


	char encrypted_answer[100];
	sprintf(encrypted_answer, "0x%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", encrypted_data[0],encrypted_data[1],encrypted_data[2],encrypted_data[3],encrypted_data[4],encrypted_data[5],encrypted_data[6],encrypted_data[7],encrypted_data[8],encrypted_data[9],encrypted_data[10],encrypted_data[11],encrypted_data[12],encrypted_data[13],encrypted_data[14],encrypted_data[15]);
	if(strcmp(encrypted_answer, first_fabric.to_string().c_str()) != 0){
		printf("%s", encrypted_answer);
		printf("%s", first_fabric.to_string().c_str());
		return -1;
	}
//	for(i=0; i<16; i++){
//		if(ddr[dest + i] != encrypted_data[i]){
//			return -1;
//		}
//	}
	AES_encrypt((unsigned char*)data_to_encrypt2, encrypted_data, &aes_key);
	sprintf(encrypted_answer, "0x%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", encrypted_data[0],encrypted_data[1],encrypted_data[2],encrypted_data[3],encrypted_data[4],encrypted_data[5],encrypted_data[6],encrypted_data[7],encrypted_data[8],encrypted_data[9],encrypted_data[10],encrypted_data[11],encrypted_data[12],encrypted_data[13],encrypted_data[14],encrypted_data[15]);
	if(strcmp(encrypted_answer, second_fabric.to_string().c_str()) != 0){
		printf("%s", encrypted_answer);
		printf("%s", second_fabric.to_string().c_str());
		return -1;
	}
//	printf("\nEncrypted data as hex: %s - fabric 2", second_fabric.to_string().c_str());
	printf("\nEncrypted data as hex: 0x");
	for(i = 0; i<16; i++){
		printf("%02x", encrypted_data[i]);
	}
//	printf(" - second from openssl\n\n");
//	for(i=0; i<16; i++){
//		if(ddr[dest + i + 16] != encrypted_data[i]){
//			return -1;
//		}
//	}
//	printf("\nmm2s control registers:");
//	for(i=0; i<24; i++){
//		printf("\n%08x", mm2s[i]);
//	}
//
//	printf("\n\ns2mm control registers:");
//	for(i=0; i<24; i++){
//		printf("\n%08x", s2mm[i]);
//	}

	free(encrypted_data);
	return 0;
}
