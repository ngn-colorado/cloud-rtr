/* Copyright (c) 2001-2004, Roger Dingledine.
 * Copyright (c) 2004-2006, Roger Dingledine, Nick Mathewson.
 * Copyright (c) 2007-2012, The Tor Project, Inc. */
/* See LICENSE for licensing information */

#include "orconfig.h"

#define CONNECTION_EDGE_PRIVATE
#define RELAY_PRIVATE
#include "or.h"
#include "connection_edge.h"
#include "relay.h"
#include "test.h"

#include <stdlib.h>
#include <string.h>

static void
test_cfmt_relay_header(void *arg)
{
  relay_header_t rh;
  const uint8_t hdr_1[RELAY_HEADER_SIZE] =
    "\x03" "\x00\x00" "\x21\x22" "ABCD" "\x01\x03";
  uint8_t hdr_out[RELAY_HEADER_SIZE];
  (void)arg;

  tt_int_op(sizeof(hdr_1), ==, RELAY_HEADER_SIZE);
  relay_header_unpack(&rh, hdr_1);
  tt_int_op(rh.command, ==, 3);
  tt_int_op(rh.recognized, ==, 0);
  tt_int_op(rh.stream_id, ==, 0x2122);
  test_mem_op(rh.integrity, ==, "ABCD", 4);
  tt_int_op(rh.length, ==, 0x103);

  relay_header_pack(hdr_out, &rh);
  test_mem_op(hdr_out, ==, hdr_1, RELAY_HEADER_SIZE);

 done:
  ;
}

static void
make_relay_cell(cell_t *out, uint8_t command,
                const void *body, size_t bodylen)
{
  relay_header_t rh;

  memset(&rh, 0, sizeof(rh));
  rh.stream_id = 5;
  rh.command = command;
  rh.length = bodylen;

  out->command = CELL_RELAY;
  out->circ_id = 10;
  relay_header_pack(out->payload, &rh);

  memcpy(out->payload + RELAY_HEADER_SIZE, body, bodylen);
}

static void
test_cfmt_begin_cells(void *arg)
{
  cell_t cell;
  begin_cell_t bcell;
  uint8_t end_reason;
  (void)arg;

  /* Try begindir. */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN_DIR, "", 0);
  tt_int_op(0, ==, begin_cell_parse(&cell, &bcell, &end_reason));
  tt_ptr_op(NULL, ==, bcell.address);
  tt_int_op(0, ==, bcell.flags);
  tt_int_op(0, ==, bcell.port);
  tt_int_op(5, ==, bcell.stream_id);
  tt_int_op(1, ==, bcell.is_begindir);

  /* A Begindir with extra stuff. */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN_DIR, "12345", 5);
  tt_int_op(0, ==, begin_cell_parse(&cell, &bcell, &end_reason));
  tt_ptr_op(NULL, ==, bcell.address);
  tt_int_op(0, ==, bcell.flags);
  tt_int_op(0, ==, bcell.port);
  tt_int_op(5, ==, bcell.stream_id);
  tt_int_op(1, ==, bcell.is_begindir);

  /* A short but valid begin cell */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN, "a.b:9", 6);
  tt_int_op(0, ==, begin_cell_parse(&cell, &bcell, &end_reason));
  tt_str_op("a.b", ==, bcell.address);
  tt_int_op(0, ==, bcell.flags);
  tt_int_op(9, ==, bcell.port);
  tt_int_op(5, ==, bcell.stream_id);
  tt_int_op(0, ==, bcell.is_begindir);
  tor_free(bcell.address);

  /* A significantly loner begin cell */
  memset(&bcell, 0x7f, sizeof(bcell));
  {
    const char c[] = "here-is-a-nice-long.hostname.com:65535";
    make_relay_cell(&cell, RELAY_COMMAND_BEGIN, c, strlen(c)+1);
  }
  tt_int_op(0, ==, begin_cell_parse(&cell, &bcell, &end_reason));
  tt_str_op("here-is-a-nice-long.hostname.com", ==, bcell.address);
  tt_int_op(0, ==, bcell.flags);
  tt_int_op(65535, ==, bcell.port);
  tt_int_op(5, ==, bcell.stream_id);
  tt_int_op(0, ==, bcell.is_begindir);
  tor_free(bcell.address);

  /* An IPv4 begin cell. */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN, "18.9.22.169:80", 15);
  tt_int_op(0, ==, begin_cell_parse(&cell, &bcell, &end_reason));
  tt_str_op("18.9.22.169", ==, bcell.address);
  tt_int_op(0, ==, bcell.flags);
  tt_int_op(80, ==, bcell.port);
  tt_int_op(5, ==, bcell.stream_id);
  tt_int_op(0, ==, bcell.is_begindir);
  tor_free(bcell.address);

  /* An IPv6 begin cell. Let's make sure we handle colons*/
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN,
                  "[2620::6b0:b:1a1a:0:26e5:480e]:80", 34);
  tt_int_op(0, ==, begin_cell_parse(&cell, &bcell, &end_reason));
  tt_str_op("[2620::6b0:b:1a1a:0:26e5:480e]", ==, bcell.address);
  tt_int_op(0, ==, bcell.flags);
  tt_int_op(80, ==, bcell.port);
  tt_int_op(5, ==, bcell.stream_id);
  tt_int_op(0, ==, bcell.is_begindir);
  tor_free(bcell.address);

  /* a begin cell with extra junk but not enough for flags. */
  memset(&bcell, 0x7f, sizeof(bcell));
  {
    const char c[] = "another.example.com:80\x00\x01\x02";
    make_relay_cell(&cell, RELAY_COMMAND_BEGIN, c, sizeof(c)-1);
  }
  tt_int_op(0, ==, begin_cell_parse(&cell, &bcell, &end_reason));
  tt_str_op("another.example.com", ==, bcell.address);
  tt_int_op(0, ==, bcell.flags);
  tt_int_op(80, ==, bcell.port);
  tt_int_op(5, ==, bcell.stream_id);
  tt_int_op(0, ==, bcell.is_begindir);
  tor_free(bcell.address);

  /* a begin cell with flags. */
  memset(&bcell, 0x7f, sizeof(bcell));
  {
    const char c[] = "another.example.com:443\x00\x01\x02\x03\x04";
    make_relay_cell(&cell, RELAY_COMMAND_BEGIN, c, sizeof(c)-1);
  }
  tt_int_op(0, ==, begin_cell_parse(&cell, &bcell, &end_reason));
  tt_str_op("another.example.com", ==, bcell.address);
  tt_int_op(0x1020304, ==, bcell.flags);
  tt_int_op(443, ==, bcell.port);
  tt_int_op(5, ==, bcell.stream_id);
  tt_int_op(0, ==, bcell.is_begindir);
  tor_free(bcell.address);

  /* a begin cell with flags and even more cruft after that. */
  memset(&bcell, 0x7f, sizeof(bcell));
  {
    const char c[] = "a-further.example.com:22\x00\xee\xaa\x00\xffHi mom";
    make_relay_cell(&cell, RELAY_COMMAND_BEGIN, c, sizeof(c)-1);
  }
  tt_int_op(0, ==, begin_cell_parse(&cell, &bcell, &end_reason));
  tt_str_op("a-further.example.com", ==, bcell.address);
  tt_int_op(0xeeaa00ff, ==, bcell.flags);
  tt_int_op(22, ==, bcell.port);
  tt_int_op(5, ==, bcell.stream_id);
  tt_int_op(0, ==, bcell.is_begindir);
  tor_free(bcell.address);

  /* bad begin cell: impossible length. */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN, "a.b:80", 7);
  cell.payload[9] = 0x01; /* Set length to 510 */
  cell.payload[10] = 0xfe;
  {
    relay_header_t rh;
    relay_header_unpack(&rh, cell.payload);
    tt_int_op(rh.length, ==, 510);
  }
  tt_int_op(-2, ==, begin_cell_parse(&cell, &bcell, &end_reason));

  /* Bad begin cell: no body. */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN, "", 0);
  tt_int_op(-1, ==, begin_cell_parse(&cell, &bcell, &end_reason));

  /* bad begin cell: no body. */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN, "", 0);
  tt_int_op(-1, ==, begin_cell_parse(&cell, &bcell, &end_reason));

  /* bad begin cell: no colon */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN, "a.b", 4);
  tt_int_op(-1, ==, begin_cell_parse(&cell, &bcell, &end_reason));

  /* bad begin cell: no ports */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN, "a.b:", 5);
  tt_int_op(-1, ==, begin_cell_parse(&cell, &bcell, &end_reason));

  /* bad begin cell: bad port */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN, "a.b:xyz", 8);
  tt_int_op(-1, ==, begin_cell_parse(&cell, &bcell, &end_reason));
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN, "a.b:100000", 11);
  tt_int_op(-1, ==, begin_cell_parse(&cell, &bcell, &end_reason));

  /* bad begin cell: no nul */
  memset(&bcell, 0x7f, sizeof(bcell));
  make_relay_cell(&cell, RELAY_COMMAND_BEGIN, "a.b:80", 6);
  tt_int_op(-1, ==, begin_cell_parse(&cell, &bcell, &end_reason));

 done:
  tor_free(bcell.address);
}

static void
test_cfmt_connected_cells(void *arg)
{
  relay_header_t rh;
  cell_t cell;
  tor_addr_t addr;
  int ttl, r;
  char *mem_op_hex_tmp = NULL;
  (void)arg;

  /* Let's try an oldschool one with nothing in it. */
  make_relay_cell(&cell, RELAY_COMMAND_CONNECTED, "", 0);
  relay_header_unpack(&rh, cell.payload);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, 0);
  tt_int_op(tor_addr_family(&addr), ==, AF_UNSPEC);
  tt_int_op(ttl, ==, -1);

  /* A slightly less oldschool one: only an IPv4 address */
  make_relay_cell(&cell, RELAY_COMMAND_CONNECTED, "\x20\x30\x40\x50", 4);
  relay_header_unpack(&rh, cell.payload);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, 0);
  tt_int_op(tor_addr_family(&addr), ==, AF_INET);
  tt_str_op(fmt_addr(&addr), ==, "32.48.64.80");
  tt_int_op(ttl, ==, -1);

  /* Bogus but understandable: truncated TTL */
  make_relay_cell(&cell, RELAY_COMMAND_CONNECTED, "\x11\x12\x13\x14\x15", 5);
  relay_header_unpack(&rh, cell.payload);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, 0);
  tt_int_op(tor_addr_family(&addr), ==, AF_INET);
  tt_str_op(fmt_addr(&addr), ==, "17.18.19.20");
  tt_int_op(ttl, ==, -1);

  /* Regular IPv4 one: address and TTL */
  make_relay_cell(&cell, RELAY_COMMAND_CONNECTED,
                  "\x02\x03\x04\x05\x00\x00\x0e\x10", 8);
  relay_header_unpack(&rh, cell.payload);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, 0);
  tt_int_op(tor_addr_family(&addr), ==, AF_INET);
  tt_str_op(fmt_addr(&addr), ==, "2.3.4.5");
  tt_int_op(ttl, ==, 3600);

  /* IPv4 with too-big TTL */
  make_relay_cell(&cell, RELAY_COMMAND_CONNECTED,
                  "\x02\x03\x04\x05\xf0\x00\x00\x00", 8);
  relay_header_unpack(&rh, cell.payload);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, 0);
  tt_int_op(tor_addr_family(&addr), ==, AF_INET);
  tt_str_op(fmt_addr(&addr), ==, "2.3.4.5");
  tt_int_op(ttl, ==, -1);

  /* IPv6 (ttl is mandatory) */
  make_relay_cell(&cell, RELAY_COMMAND_CONNECTED,
                  "\x00\x00\x00\x00\x06"
                  "\x26\x07\xf8\xb0\x40\x0c\x0c\x02"
                  "\x00\x00\x00\x00\x00\x00\x00\x68"
                  "\x00\x00\x02\x58", 25);
  relay_header_unpack(&rh, cell.payload);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, 0);
  tt_int_op(tor_addr_family(&addr), ==, AF_INET6);
  tt_str_op(fmt_addr(&addr), ==, "2607:f8b0:400c:c02::68");
  tt_int_op(ttl, ==, 600);

  /* IPv6 (ttl too big) */
  make_relay_cell(&cell, RELAY_COMMAND_CONNECTED,
                  "\x00\x00\x00\x00\x06"
                  "\x26\x07\xf8\xb0\x40\x0c\x0c\x02"
                  "\x00\x00\x00\x00\x00\x00\x00\x68"
                  "\x90\x00\x02\x58", 25);
  relay_header_unpack(&rh, cell.payload);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, 0);
  tt_int_op(tor_addr_family(&addr), ==, AF_INET6);
  tt_str_op(fmt_addr(&addr), ==, "2607:f8b0:400c:c02::68");
  tt_int_op(ttl, ==, -1);

  /* Bogus size: 3. */
  make_relay_cell(&cell, RELAY_COMMAND_CONNECTED,
                  "\x00\x01\x02", 3);
  relay_header_unpack(&rh, cell.payload);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, -1);

  /* Bogus family: 7. */
  make_relay_cell(&cell, RELAY_COMMAND_CONNECTED,
                  "\x00\x00\x00\x00\x07"
                  "\x26\x07\xf8\xb0\x40\x0c\x0c\x02"
                  "\x00\x00\x00\x00\x00\x00\x00\x68"
                  "\x90\x00\x02\x58", 25);
  relay_header_unpack(&rh, cell.payload);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, -1);

  /* Truncated IPv6. */
  make_relay_cell(&cell, RELAY_COMMAND_CONNECTED,
                  "\x00\x00\x00\x00\x06"
                  "\x26\x07\xf8\xb0\x40\x0c\x0c\x02"
                  "\x00\x00\x00\x00\x00\x00\x00\x68"
                  "\x00\x00\x02", 24);
  relay_header_unpack(&rh, cell.payload);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, -1);

  /* Now make sure we can generate connected cells correctly. */
  /* Try an IPv4 address */
  memset(&rh, 0, sizeof(rh));
  memset(&cell, 0, sizeof(cell));
  tor_addr_parse(&addr, "30.40.50.60");
  rh.length = connected_cell_format_payload(cell.payload+RELAY_HEADER_SIZE,
                                            &addr, 128);
  tt_int_op(rh.length, ==, 8);
  test_memeq_hex(cell.payload+RELAY_HEADER_SIZE, "1e28323c" "00000080");

  /* Try parsing it. */
  tor_addr_make_unspec(&addr);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, 0);
  tt_int_op(tor_addr_family(&addr), ==, AF_INET);
  tt_str_op(fmt_addr(&addr), ==, "30.40.50.60");
  tt_int_op(ttl, ==, 128);

  /* Try an IPv6 address */
  memset(&rh, 0, sizeof(rh));
  memset(&cell, 0, sizeof(cell));
  tor_addr_parse(&addr, "2620::6b0:b:1a1a:0:26e5:480e");
  rh.length = connected_cell_format_payload(cell.payload+RELAY_HEADER_SIZE,
                                            &addr, 3600);
  tt_int_op(rh.length, ==, 25);
  test_memeq_hex(cell.payload + RELAY_HEADER_SIZE,
                 "00000000" "06"
                 "2620000006b0000b1a1a000026e5480e" "00000e10");

  /* Try parsing it. */
  tor_addr_make_unspec(&addr);
  r = connected_cell_parse(&rh, &cell, &addr, &ttl);
  tt_int_op(r, ==, 0);
  tt_int_op(tor_addr_family(&addr), ==, AF_INET6);
  tt_str_op(fmt_addr(&addr), ==, "2620:0:6b0:b:1a1a:0:26e5:480e");
  tt_int_op(ttl, ==, 3600);

 done:
  tor_free(mem_op_hex_tmp);
}

#define TEST(name, flags)                                               \
  { #name, test_cfmt_ ## name, flags, 0, NULL }

struct testcase_t cell_format_tests[] = {
  TEST(relay_header, 0),
  TEST(begin_cells, 0),
  TEST(connected_cells, 0),
  END_OF_TESTCASES
};

