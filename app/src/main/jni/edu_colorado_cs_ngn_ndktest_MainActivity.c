#include "edu_colorado_cs_ngn_ndktest_MainActivity.h"
#include "user_mmap_driver.h"
#include <android/log.h>
#include "aes_runner.h"
/*
 * Class:     edu_colorado_cs_ngn_ndktest_MainActivity
 * Method:    getNdkText
 * Signature: ()Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_edu_colorado_cs_ngn_ndktest_MainActivity_getNdkText(JNIEnv *env, jobject obj){
    int i;
    (*env)->NewStringUTF(env, "I am JNI text as well");

    run();

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

