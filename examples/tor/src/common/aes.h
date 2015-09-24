/* Copyright (c) 2003, Roger Dingledine
 * Copyright (c) 2004-2006, Roger Dingledine, Nick Mathewson.
 * Copyright (c) 2007-2015, The Tor Project, Inc. */
/* See LICENSE for licensing information */

/* Implements a minimal interface to counter-mode AES. */

#ifndef TOR_AES_H
#define TOR_AES_H

/**
 * \file aes.h
 * \brief Headers for aes.c
 */
#include <openssl/evp.h>
#include <openssl/aes.h>


struct aes_cnt_cipher {
/** This next element (however it's defined) is the AES key. */
  union {
    EVP_CIPHER_CTX evp;
    AES_KEY aes;
  } key;

#if !defined(WORDS_BIGENDIAN)
#define USING_COUNTER_VARS
  /** These four values, together, implement a 128-bit counter, with
   * counter0 as the low-order word and counter3 as the high-order word. */
  uint32_t counter3;
  uint32_t counter2;
  uint32_t counter1;
  uint32_t counter0;
#endif

  union {
    /** The counter, in big-endian order, as bytes. */
    uint8_t buf[16];
    /** The counter, in big-endian order, as big-endian words.  Note that
     * on big-endian platforms, this is redundant with counter3...0,
     * so we just use these values instead. */
    uint32_t buf32[4];
  } ctr_buf;

  /** The encrypted value of ctr_buf. */
  uint8_t buf[16];
  /** Our current stream position within buf. */
  unsigned int pos;

  /** True iff we're using the evp implementation of this cipher. */
  uint8_t using_evp;
};



typedef struct aes_cnt_cipher aes_cnt_cipher_t;

aes_cnt_cipher_t* aes_new_cipher(const char *key, const char *iv);
void aes_cipher_free(aes_cnt_cipher_t *cipher);
void aes_crypt(aes_cnt_cipher_t *cipher, const char *input, size_t len,
               char *output);
void aes_crypt_inplace(aes_cnt_cipher_t *cipher, char *data, size_t len);

int evaluate_evp_for_aes(int force_value);
int evaluate_ctr_for_aes(void);

#endif

