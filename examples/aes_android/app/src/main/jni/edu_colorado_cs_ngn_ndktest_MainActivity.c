#include "edu_colorado_cs_ngn_ndktest_MainActivity.h"
#include "user_mmap_driver.h"
#include <android/log.h>
#include "aes_runner.h"
//#include "ArrayHandler.h"
/*
 * Class:     edu_colorado_cs_ngn_ndktest_MainActivity
 * Method:    getNdkText
 * Signature: ()Ljava/lang/String;
 */

// char *int2bin(int a, char *buffer, int buf_size) {
// 	buffer += (buf_size - 1);
// 	int i;
// 	for (i = 31; i >= 0; i--) {
// 		*buffer-- = (a & 1) + '0';
//
// 		a >>= 1;
// 	}
//
// 	return buffer;
// }

JNIEXPORT
jstring
JNICALL
Java_edu_colorado_cs_ngn_ndktest_MainActivity_getNdkText(JNIEnv *env, jobject obj){
    int i;

//    run();

    //Note that the return must be the last line in function
    (*env)->NewStringUTF(env, "I am JNI text as well");

//    shared_memory shared_mem = getUioMemoryArea();
//    if(shared_mem == NULL){
//        __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "Could not create shared memory area");
//        return "";
//    }
//
//    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "Data in memmap pointer:\n");
//    for(i=0; i<20; i++){
//        __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "%02x", ((char*)shared_mem->ptr)[i]);
//    }
//
//    cleanupSharedMemoryPointer(shared_mem);
}

//JNIEXPORT jobjectArray JNICALL           Java_ArrayHandler_returnArray

JNIEXPORT
jint
JNICALL
Java_edu_colorado_cs_ngn_ndktest_MainActivity_writeAesDataToMemory(JNIEnv *env, jobject calling, jbyteArray data, jint numEncryptions){
    int i, j, sum = 0;
    jsize len = (*env)->GetArrayLength(env, data);
    jbyte *j_data = (*env)->GetByteArrayElements(env, data, 0);

    shared_memory shared_system_mem = getUioMemoryArea("/dev/uio1", 0x10000);
    if(shared_system_mem == NULL){
         __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "Error getting shared system memory pointer");
        return -1;
    }
    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "Got shared memory area in uio");
    for(i=0; i<numEncryptions; i++){
        for(j=0; j<16; j++){
            char java_byte = (char)j_data[i*16 + j];
            //TODO: remember that the data has to be loaded and read back in backwards -> move the fabric device enventually
//            __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "Input java byte: %02x", java_byte);
            ((char*)shared_system_mem->ptr)[i*16 + (15 - j)] = java_byte;
            sum++;
        }
    }
    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "Finished writing data");
    cleanupSharedMemoryPointer(shared_system_mem);
    (*env)->ReleaseByteArrayElements(env, data, j_data, 0);
    return sum;
}

JNIEXPORT
jint
JNICALL
Java_edu_colorado_cs_ngn_ndktest_MainActivity_encryptAesData
(JNIEnv *env, jobject obj, jint offset, jint numEncryptions){
    clock_t ticks;
    int i, j;
    unsigned char key[] = {0xE8, 0xE9, 0xEA, 0xEB, 0xED, 0xEE, 0xEF, 0xF0, 0xF2, 0xF3, 0xF4, 0xF5, 0xF7, 0xF8, 0xF9, 0xFA, '\0'};
    unsigned shared_mem_base = 0x1F410000;
    XReset_axi reset_axi;
	if(XReset_axi_Initialize(&reset_axi, "axi-reset") != XST_SUCCESS){
		__android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "\nCould not initialize axi reset device");
		return -1;
	}
	XReset_axi_SetIn_reset(&reset_axi, 1);
	XReset_axi_SetIn_reset(&reset_axi, 0);
	XReset_axi_Release(&reset_axi);

	XAes aes_device_struct;// = NULL;
    XAes *aes_device = &aes_device_struct;

    if(XAes_Initialize(aes_device, "qam") != XST_SUCCESS){
         __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "\nCould not initialize aes device");
        return -2;
    }

    XAes_Key_in_v key_in;
    u32 key_array[4];
    for(i=0; i<4; i++){
        u32 current = 0;
        for(j=0; j<4; j++){
            int key_part = key[15-i*4-j];
            key_part = key_part << (8*j);
            current += key_part;
        }
        key_array[i] = current;
    }
    key_in.word_0 = key_array[0];
    key_in.word_1 = key_array[1];
    key_in.word_2 = key_array[2];
    key_in.word_3 = key_array[3];
    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "\nOriginal key:\n0x");
    char bin_buffer[33];
    for(i=0; i<4; i++){
        int current_int = 0;
        for(j=0; j<4; j++){
            current_int = current_int << 8;
            current_int += key[i];
        }
        int2bin(current_int, bin_buffer, 32);
        bin_buffer[32] = '\0';
         __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "%s", bin_buffer);
    }

     __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "\nFabric key:\n0x");
    for(i=0; i<4; i++){
        int2bin(key_array[i], bin_buffer, 32);
        bin_buffer[32] = '\0';
         __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "%s", bin_buffer);
    }

    unsigned source = shared_mem_base;
    unsigned dest = source + offset;
    unsigned data_length = numEncryptions;

    XAes_Start(aes_device);

    XAes_Set_key_in_V(aes_device, key_in);

    XAes_Set_sourceAddress(aes_device, source);

    XAes_Set_destinationAddress(aes_device, dest);

    XAes_Set_length_r(aes_device, data_length);

    ticks = clock();
    XAes_Set_sourceAddress_vld(aes_device);

    XAes_Set_key_in_V_vld(aes_device);

    XAes_Set_destinationAddress_vld(aes_device);

    XAes_Set_length_r_vld(aes_device);

    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "\nWaiting for fabric.");
    while(XAes_IsDone(aes_device) != 1){
        __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", ".");
    //		finished = XAes_GetFinished(aes_device);
    }
    int finished = XAes_Get_return(aes_device);
    ticks = clock() - ticks;
    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "\nDone waiting for fabric\n");
    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni","It took %f clicks (%f seconds) in fabric.\n",(float)ticks,((float)ticks)/CLOCKS_PER_SEC);
    XAes_Release(aes_device);
    return finished;
}

JNIEXPORT
jint
JNICALL
Java_edu_colorado_cs_ngn_ndktest_MainActivity_verifyAesData
(JNIEnv *env, jobject callingObject, jbyteArray data, jint offset, jint numEncryptions){
    int i, j, str_index = 0, numIncorrect = 0;
    jsize len = (*env)->GetArrayLength(env, data);
    char out_str[len*20];
    jbyte *j_data = (*env)->GetByteArrayElements(env, data, 0);

    shared_memory shared_system_mem = getUioMemoryArea("/dev/uio1", 0x10000);
    if(shared_system_mem == NULL){
         __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "Error getting shared system memory pointer");
        return -1;
    }
    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "Got shared memory area in uio");
    for(i=0; i<numEncryptions; i++){
        for(j=0; j<16; j++){
            char fabric = ((char*)shared_system_mem->ptr)[i*16 + (15-j) + offset];
            char java_byte = j_data[i*16 + j];

            if(java_byte != fabric){
                __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "INCORRECT! Java: %02x, Fabric: %02x", java_byte, fabric);
                numIncorrect++;
            }
        }
    }
    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "Num incorrect: %i", numIncorrect);

    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "Length: %i", len);
    for(i=0; i<numEncryptions; i++){
        out_str[str_index] = 'x';
        str_index++;
        for(j=0; j<16; j++){

            char fabric = ((char*)shared_system_mem->ptr)[i*16 + (15-j) + offset];//+ (15-j) + offset];
//			__android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "%02x", fabric);
            char str_buf[20];
            sprintf(str_buf, "%02x\0", fabric);
            int k;
            for(k = 0; k<2; k++){
                out_str[str_index] = str_buf[k];
                str_index++;
            }
        }
        out_str[str_index] = ' ';
        str_index++;
    }

    out_str[str_index] = '\0';
    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "%s", out_str);
    __android_log_print(ANDROID_LOG_DEBUG, "ndktest_jni", "\n");
    cleanupSharedMemoryPointer(shared_system_mem);
    (*env)->ReleaseByteArrayElements(env, data, j_data, 0);
    return numIncorrect;
}