#ifndef AES_RUNNER_H_
#define AES_RUNNER_H_

#include "user_mmap_driver.h"
//#include <openssl/rand.h>
//#include <openssl/aes.h>
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include "xaes.h"
#include "xreset_axi.h"
#include <android/log.h>

int run();
char *int2bin(int, char*, int);

#endif