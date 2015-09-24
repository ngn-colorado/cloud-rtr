#include <ap_int.h>
#include <openssl/rand.h>
#include <openssl/aes.h>
#include <openssl/evp.h>
#include <openssl/opensslv.h>
#include <openssl/engine.h>
#include <openssl/modes.h>
#include <stdio.h>
#include <hls_stream.h>

typedef ap_uint<128> uint128_t;
typedef hls::stream<uint128_t> mem_stream;

typedef ap_uint<32> uint32_t_hw;
typedef hls::stream<uint32_t_hw> mem_stream32;

//typedef ap_uint<8> uint8_t;
typedef unsigned char uint8_t;
typedef hls::stream<uint8_t> mem_stream8;

void aestest(ap_uint<128>*, ap_uint<128>*, ap_uint<128>*);

//void aes(volatile unsigned*, unsigned, ap_uint<128>*,
//		unsigned, unsigned int, volatile ap_uint<128>*,
//		volatile ap_uint<128>*, volatile ap_uint<1>*,
//		volatile ap_uint<1>*, volatile bool*, volatile bool*,
//		unsigned, unsigned);

//bool aes(volatile unsigned int m_mm2s_ctl [500], volatile unsigned int m_s2mm_ctl[500], volatile unsigned sourceAddress, ap_uint<128>* key_in,
//		volatile unsigned destinationAddress, unsigned int length,
//		mem_stream& s_in, mem_stream& s_out){

//bool aes(volatile unsigned int*, volatile unsigned int*, volatile unsigned, ap_uint<128>*,
//		volatile unsigned, unsigned int,
//		mem_stream&, mem_stream&);

bool aes(volatile unsigned int m_mm2s_ctl [500], volatile unsigned int m_s2mm_ctl[500], volatile unsigned sourceAddress, ap_uint<128> *key_in, ap_uint<128> *iv,
		volatile unsigned destinationAddress, unsigned int numBytes, int mode,
		mem_stream32& s_in, mem_stream32& s_out);

bool aes(volatile unsigned char ddr[0x20000000], volatile unsigned sourceAddress, ap_uint<128> *key_in, ap_uint<128> *iv,
		volatile unsigned destinationAddress, unsigned int numBytes, int mode);

//bool aes(volatile unsigned int m_mm2s_ctl [500], volatile unsigned int m_s2mm_ctl[500], volatile unsigned sourceAddress, ap_uint<128> *key_in, ap_uint<128> *iv,
//		volatile unsigned destinationAddress, unsigned int numBytes, int mode,
//		mem_stream& s_in, mem_stream& s_out);

volatile unsigned char ddr[0x3000];
volatile unsigned int mm2s[500];
volatile unsigned int s2mm[500];
volatile unsigned source = 0x1000;
volatile unsigned dest = 0x2000;

volatile unsigned char data_to_encrypt[] =  {0x01, 0x4B, 0xAF, 0x22, 0x78, 0xA6, 0x9D, 0x33, 0x1D, 0x51, 0x80, 0x10, 0x36, 0x43, 0xE9, 0x9A, '\0'};
volatile unsigned char data_to_encrypt2[] = {0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, 0x41, '\0'};
unsigned char default_iv[] =       {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, '\0'};

ap_uint<128> fabric_default_iv("00000000000000000000000000000000", 16);

ap_uint<128> data_to_encrypt_fabric( "014BAF2278A69D331D5180103643E99A", 16);
ap_uint<128> data_to_encrypt_fabric2("41414141414141414141414141414141", 16);

//test key:
//E8E9EAEBEDEEEFF0F2F3F4F5F7F8F9FA
unsigned char key[] = {0xE8, 0xE9, 0xEA, 0xEB, 0xED, 0xEE, 0xEF, 0xF0, 0xF2, 0xF3, 0xF4, 0xF5, 0xF7, 0xF8, 0xF9, 0xFA, '\0'};
ap_uint<128> fabric_key("E8E9EAEBEDEEEFF0F2F3F4F5F7F8F9FA", 16);

unsigned char encrypted_data[16];
unsigned char encrypted_data2[16];
unsigned char encrypted_data3[1024];

volatile ap_uint<128> fabric_dest_test(0);

volatile bool finished;
mem_stream32 read_stream;
mem_stream32 write_stream;

void clearStreams(){
	while(!read_stream.empty()){
		read_stream.read();
	}
	while(!write_stream.empty()){
		write_stream.read();
	}
}

ap_uint<128> reverse128ApUint(ap_uint<128> in){
	ap_uint<8> temp;
	ap_uint<128> out;
	int i;
//	printf("\nReverse input:\t\t%s", in.to_string().c_str());
	for(i=0; i<16; i++){
		temp = in.range(i*8 + 7, i*8);
		out = out.concat(temp);
	}
//	printf("\nReversed output:\t%s", out.to_string().c_str());
	return out;
}

//borrowed from my aes library code
void byteReverseBuffer16(char* buffer, int length){
	int i, j, tmp, iterLen, bufferIndex;

	iterLen = length/16 + (length % 16 != 0);
	for(i=0; i<iterLen; i++){
		bufferIndex = 16*i;
		for(j=0; j<8; j++){
			tmp = buffer[bufferIndex + j];
			buffer[bufferIndex + j] = buffer[bufferIndex + 15-j];
			buffer[bufferIndex + 15-j] = tmp;
		}
	}
}

//NOTE: to avoid printing extra 0xFF characters for each printf call, must pass
//an unsigned char to the %02x format specifier, not a char
void print16Buffer(unsigned char* buffer){
	int i;
	printf("\n0x");
	for(i = 0; i<16; i++){
		printf("%02X", buffer[i]);
	}
}

ap_uint<32> reverse32test(ap_uint<32> in){
	int j;
	ap_uint<8> temp2;
	ap_uint<8> temp2_array[4];
	for(j=0; j<4; j++){
#pragma HLS UNROLL
		temp2 = in.range(j*8+7, j*8);
//		temp2 = temp.range(31-j*8, 24-j*8);
//		printf("\n%s", temp2.to_string(16).c_str());
//		out = out.concat(temp2);
		temp2_array[j] = temp2;
	}
	return (temp2_array[0], temp2_array[1], temp2_array[2], temp2_array[3]);
}

void printFabricDestTest(){
	printf("\n%s", ((ap_uint<128>)fabric_dest_test).to_string().c_str());
}

void printFabricKey(){
	printf("\n%s", ((ap_uint<128>)fabric_key).to_string().c_str());
}

void reverseFabricKey(){
	int i;
	ap_uint<128> new_key;
	char tempBuf[16];
	for(i=0; i<16; i++){
		tempBuf[i] = fabric_key.range(i*8 + 7, i*8);
		ap_uint<8> temp(tempBuf[i]);
		new_key = new_key.concat(temp);
	}
//	for(i=15; i>=0; i--){
//		ap_uint<8> temp(tempBuf[i]);
//		new_key = new_key.concat(temp);
//	}
	fabric_key = new_key;
}


//assumes compare is also 16 bytes
int printAndCompareWriteStream16(unsigned char* compareBuffer, int numToRead){
	int i, j;
	int incorrect = 0;
	ap_uint<32> current;
	ap_uint<8> cur2;

//	ap_uint<128> cur = write_stream.read();
//	cur = reverse128ApUint(cur);
	ap_uint<8> temp[16];
	ap_uint<128> out;
	for(i=0; i<4; i++){
//		if(i<numToRead){
			current = write_stream.read();
			out = out.concat(current);
			printf("\nOut: %s", current.to_string(16).c_str());
//			current = cur.range(i*8 + 7, i*8);
//			current = cur.range(127-i*8, 120-i*8);
			for(j=0; j<4; j++){
				cur2 = current.range(31-j*8 , 24-j*8);
				temp[i*4 + j] = cur2;
			}
//		} else{
//			temp[i] = 0;
//		}
	}

//	byteReverseBuffer16(temp, 16);

//	printf("\n0x");
	for(i=0; i<16; i++){
		cur2 = temp[15-i];
		if(compareBuffer != 0){
			if(cur2 != compareBuffer[i]){
//				printf(" %s,%02x ", cur2.to_string(16).c_str(), compareBuffer[i]);
				incorrect++;
			}
		}

	}
	printf("\n%s", reverse128ApUint(out).to_string().c_str());
	return incorrect;
}

int printAndCompareDdr16(unsigned char* compareBuffer, int start){
	int i;
	int incorrect = 0;
	char temp[16];
	unsigned char current;
	for(i=0; i<16; i++){
		temp[i] = ddr[start + i];
	}
//	byteReverseBuffer16(temp, 16);
	printf("\n0x");
	for(i=0; i<16; i++){
		current = temp[i];
		if(current != compareBuffer[i]){
			incorrect++;
		}
		printf("%02x", current);
	}
	return incorrect;
}

int run_aes_simulation(int mode, unsigned char* compare1, unsigned char* compare2, bool incrMode){
	int i, j;
	char* modeStr;
	if(mode == 1){
		modeStr = "CBC";
	} else if(mode == 2){
		modeStr = "CTR";
	} else{
		modeStr = "ECB";
	}


	//reverse key
//	byteReverseBuffer16((char*)key, 16);
//	printf("\nOriginal Fabric key:");
//	printFabricKey();
	reverseFabricKey();
//	printf("\nReversed Fabric key:");
//	printFabricKey();

	int len, incorrect1, incorrect2;
	if(incrMode){
		//fill up a temp buf with data
		char incrModeBuf[1024];
		unsigned char outBuf[1024];
		for(i=0; i<16; i++){
			incrModeBuf[i] = data_to_encrypt[i];
			incrModeBuf[i+16] = data_to_encrypt2[i];
		}
		for(i=32; i<1024; i++){
			incrModeBuf[i] = 0;
		}

		for(j=0; j<1024; j++){
			outBuf[j] = 0;
		}
		for(i=0; i<16; i++){
//			clearStreams();
//			//need to put data into the stream starting at the point we want to encrypt
//			char tempBufIn[16];
//			printf("\n\n------------------\nCurrent original input:\n0x");
//			for(j=0; j<16; j++){
////				read_stream.write((unsigned char)incrModeBuf[j+i]);
//				tempBufIn[j] = incrModeBuf[j+i];
//				printf("%02X", (unsigned char)tempBufIn[j]);
//			}
//			byteReverseBuffer16(tempBufIn, 16);
//			printf("\nCurrent input:\n0x");
//			for(j=0; j<16; j++){
//				read_stream.write(tempBufIn[j]);
//				printf("%02x", (unsigned char)tempBufIn[j]);
//			}
////			default_iv[0]++;
//			aes(mm2s, s2mm, source, &fabric_key, &fabric_default_iv, dest, (unsigned)1, mode, read_stream, write_stream);
//
//			char tempBufOut[16];
//			for(j=0; j<16; j++){
//				tempBufOut[j] = (unsigned char)write_stream.read();
//			}
//			byteReverseBuffer16(tempBufOut, 16);
//			for(j=0; j<16; j++){
//				outBuf[j+i] = tempBufOut[j];
//			}
//			printf("\nFabric simulation %s output:", modeStr);
//			printf("\n0x");
//			for(j=0; j<16; j++){
//				printf("%02x", (unsigned char)tempBufOut[j]);//outBuf[j+i]);
//			}
//			incorrect1 = printAndCompareWriteStream16(compare1, 16);
//			incorrect2 = printAndCompareWriteStream16(compare2, 1);
		}
//		printf("\nFabric simulation %s output:", modeStr);
//		incorrect1 = printAndCompareWriteStream16(compare1, 16);
//		incorrect2 = printAndCompareWriteStream16(compare2, 1);
	} else{
		printf("\nOriginal inputs:");
		print16Buffer((unsigned char*)data_to_encrypt);
		print16Buffer((unsigned char*)data_to_encrypt2);
	//	//reverse the input
		byteReverseBuffer16((char*)data_to_encrypt, 16);
		byteReverseBuffer16((char*)data_to_encrypt2, 16);
//		printf("\nReversed inputs:");
//		print16Buffer((unsigned char*)data_to_encrypt);
//		print16Buffer((unsigned char*)data_to_encrypt2);
		for(i=0; i<4; i++){
//		for(i=3; i>=0; i--){
//			read_stream.write((unsigned char)data_to_encrypt[i]);
			ap_uint<32> current;
			for(j=0; j<4; j++){
				ap_uint<8> cur(data_to_encrypt[i*4 + j]);
				current = current.concat(cur);
			}
//			current = reverse32test(current);
			printf("\n%s", current.to_string(16).c_str());
			read_stream.write(current);
//			ddr[source+i] = data_to_encrypt[i];
//			ddr[source+i+16] = data_to_encrypt2[i];
		}
		for(i=0; i<4; i++){
//		for(i=3; i>=0; i--){
//			read_stream.write((unsigned char)data_to_encrypt2[i]);
			ap_uint<32> current;
			for(j=0; j<4; j++){
				ap_uint<8> cur(data_to_encrypt2[i*4 + j]);
				current = current.concat(cur);
			}
//			current = reverse32test(current);
			printf("\n%s", current.to_string(16).c_str());
			read_stream.write(current);
		}
//		read_stream.write(reverse128ApUint(data_to_encrypt_fabric));
//		read_stream.write(reverse128ApUint(data_to_encrypt_fabric2));
//		printf("\nDdr at source address:");
//		for(i=0; i<2; i++){
//			printf("\n0x");
//			for(j=0; j<16; j++){
//				printf("%02x", ddr[source + i*16 + j]);
//			}
//		}

		aes(ddr, source, &fabric_key, &fabric_default_iv, dest, (unsigned)32, mode);

		printf("\nFabric simulation %s output:", modeStr);
		incorrect1 = printAndCompareDdr16(compare1, dest+0);
		incorrect2 = printAndCompareDdr16(compare2, dest+16);
//		incorrect1 = printAndCompareWriteStream16(compare1, 16);
//		incorrect2 = printAndCompareWriteStream16(compare2, 16);
		//	un-reverse the input
		byteReverseBuffer16((char*)data_to_encrypt, 16);
		byteReverseBuffer16((char*)data_to_encrypt2, 16);
	}

	//un-reverse key
//	byteReverseBuffer16((char*)key, 16);
	reverseFabricKey();


//	printf("\n\nmm2s control registers:");
//	for(i=0; i<24; i++){
//		printf("\n%08x", mm2s[i]);
//	}
//
//	printf("\n\ns2mm control registers:");
//	for(i=0; i<24; i++){
//		printf("\n%08x", s2mm[i]);
//	}

	printf("\nFinished %s mode\n", modeStr);

	return incorrect1 + incorrect2;
}

int test_ecb_mode(){
	int i;
	AES_KEY aes_key;
	AES_set_encrypt_key(key, 128, &aes_key);
	AES_encrypt((unsigned char*)data_to_encrypt, encrypted_data, &aes_key);
	printf("\nOpenSSL AES ECB Output:");
	print16Buffer(encrypted_data);
	AES_encrypt((unsigned char*)data_to_encrypt2, encrypted_data2, &aes_key);
	print16Buffer(encrypted_data2);

	aestest((ap_uint<128>*)&data_to_encrypt_fabric, &fabric_key, (ap_uint<128>*)&fabric_dest_test);
	printf("\nFabric software implementation ECB output:");
	printFabricDestTest();
	aestest((ap_uint<128>*)&data_to_encrypt_fabric2, &fabric_key, (ap_uint<128>*)&fabric_dest_test);
	printFabricDestTest();

	int incorrect = run_aes_simulation(0, encrypted_data, encrypted_data2, false);

	return incorrect;

}

int test_ctr_mode(){
	int i;
	int num;

	EVP_CIPHER_CTX ctx;
	EVP_EncryptInit(&ctx, EVP_aes_128_ctr(), key, default_iv);
	EVP_EncryptUpdate(&ctx, (unsigned char*)encrypted_data3, &num, (unsigned char*)data_to_encrypt, 16);
	EVP_EncryptUpdate(&ctx, (unsigned char*)encrypted_data3+16, &num, (unsigned char*)data_to_encrypt2, 16);
	EVP_EncryptFinal_ex(&ctx, encrypted_data3+32, &num);

	printf("\nOpenSSL AES CTR Output:");
	print16Buffer(encrypted_data3);
//	AES_encrypt((unsigned char*)data_to_encrypt2, encrypted_data2, &aes_key);
	print16Buffer(encrypted_data3+16);

	int incorrect = run_aes_simulation(2, encrypted_data3, encrypted_data3+16, false);

	return incorrect;
}

int test_ctr_mode_incr(){
	int i, j;
	int num;

	for(i=0; i<16; i++){
		encrypted_data3[i]=0;
	}

	EVP_CIPHER_CTX ctx;
	EVP_EncryptInit(&ctx, EVP_aes_128_ctr(), key, default_iv);
	for(i=0; i<17; i++){
		EVP_EncryptUpdate(&ctx, (unsigned char*)encrypted_data3+i, &num, (unsigned char*)data_to_encrypt+i, 1);
		printf("\nByte being encrypted: %02x", (unsigned char*)data_to_encrypt[i]);
		print16Buffer(encrypted_data3);
	}
//	EVP_EncryptUpdate(&ctx, (unsigned char*)encrypted_data3+16, &num, (unsigned char*)data_to_encrypt2, 16);
	EVP_EncryptFinal_ex(&ctx, encrypted_data3+32, &num);
	printf("\n\n\n\-----------------------------------\nOpenSSL AES CTR Output:");
	print16Buffer(encrypted_data3);
//	AES_encrypt((unsigned char*)data_to_encrypt2, encrypted_data2, &aes_key);
	print16Buffer(encrypted_data3+16);

	run_aes_simulation(2, encrypted_data3, encrypted_data3+16, true);
}

int test_cbc_mode(){
	int i;
	int num;

	EVP_CIPHER_CTX ctx;
	EVP_EncryptInit(&ctx, EVP_aes_128_cbc(), key, default_iv);
	EVP_EncryptUpdate(&ctx, (unsigned char*)encrypted_data3, &num, (unsigned char*)data_to_encrypt, 16);
	EVP_EncryptUpdate(&ctx, (unsigned char*)encrypted_data3+16, &num, (unsigned char*)data_to_encrypt2, 16);
	EVP_EncryptFinal_ex(&ctx, encrypted_data3+32, &num);

	printf("\nOpenSSL AES CBC Output:");
	print16Buffer(encrypted_data3);
//	AES_encrypt((unsigned char*)data_to_encrypt2, encrypted_data2, &aes_key);
	print16Buffer(encrypted_data3+16);

	int incorrect = run_aes_simulation(1, encrypted_data3, encrypted_data3+16, false);

	return incorrect;

}


int main(){
	int iterations, outlen, i;

	for(i = 0; i<0x3000; i++){
		ddr[i] = 0;
	}

	for(i = 0; i<16; i++){
		encrypted_data[i] = 0;
		encrypted_data2[i] = 0;
		encrypted_data3[i] = 0;
		encrypted_data3[i+16] = 0;
		ddr[0x1000+i] = data_to_encrypt[i];
		ddr[0x1000+i+16] = data_to_encrypt2[i];
	}

//	sprintf(encrypted_answer, "0x%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", encrypted_data[0],encrypted_data[1],encrypted_data[2],encrypted_data[3],encrypted_data[4],encrypted_data[5],encrypted_data[6],encrypted_data[7],encrypted_data[8],encrypted_data[9],encrypted_data[10],encrypted_data[11],encrypted_data[12],encrypted_data[13],encrypted_data[14],encrypted_data[15]);
//	sprintf(encrypted_answer, "0x%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X", encrypted_data[0],encrypted_data[1],encrypted_data[2],encrypted_data[3],encrypted_data[4],encrypted_data[5],encrypted_data[6],encrypted_data[7],encrypted_data[8],encrypted_data[9],encrypted_data[10],encrypted_data[11],encrypted_data[12],encrypted_data[13],encrypted_data[14],encrypted_data[15]);

	int incorrectECB = test_ecb_mode();

	clearStreams();

	int incorrectCTR = test_ctr_mode();

	clearStreams();

	int incorrectCBC = test_cbc_mode();

	clearStreams();

//	test_ctr_mode_incr();
//
//	clearStreams();

	return incorrectECB+incorrectCTR+incorrectCBC;
}
