/* Copyright (c) 2001 Matej Pfajfar.
 * Copyright (c) 2001-2004, Roger Dingledine.
 * Copyright (c) 2004-2006, Roger Dingledine, Nick Mathewson.
 * Copyright (c) 2007-2012, The Tor Project, Inc. */
/* See LICENSE for licensing information */

/**
 * \file onion_fast.h
 * \brief Header file for onion_fast.c.
 **/

#ifndef TOR_ONION_FAST_H
#define TOR_ONION_FAST_H

int fast_server_handshake(const uint8_t *key_in,
                          uint8_t *handshake_reply_out,
                          uint8_t *key_out,
                          size_t key_out_len);

int fast_client_handshake(const uint8_t *handshake_state,
                          const uint8_t *handshake_reply_out,
                          uint8_t *key_out,
                          size_t key_out_len);

#endif

