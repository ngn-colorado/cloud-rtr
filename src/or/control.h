/* Copyright (c) 2001 Matej Pfajfar.
 * Copyright (c) 2001-2004, Roger Dingledine.
 * Copyright (c) 2004-2006, Roger Dingledine, Nick Mathewson.
 * Copyright (c) 2007-2013, The Tor Project, Inc. */
/* See LICENSE for licensing information */

/**
 * \file control.h
 * \brief Header file for control.c.
 **/

#ifndef TOR_CONTROL_H
#define TOR_CONTROL_H

void control_update_global_event_mask(void);
void control_adjust_event_log_severity(void);

void control_ports_write_to_file(void);

/** Log information about the connection <b>conn</b>, protecting it as with
 * CONN_LOG_PROTECT. Example:
 *
 * LOG_FN_CONN(conn, (LOG_DEBUG, "Socket %d wants to write", conn->s));
 **/
#define LOG_FN_CONN(conn, args)                 \
  CONN_LOG_PROTECT(conn, log_fn args)

int connection_control_finished_flushing(control_connection_t *conn);
int connection_control_reached_eof(control_connection_t *conn);
void connection_control_closed(control_connection_t *conn);

int connection_control_process_inbuf(control_connection_t *conn);

#define EVENT_AUTHDIR_NEWDESCS 0x000D
#define EVENT_NS 0x000F
int control_event_is_interesting(int event);

int control_event_circuit_status(origin_circuit_t *circ,
                                 circuit_status_event_t e, int reason);
int control_event_circuit_purpose_changed(origin_circuit_t *circ,
                                          int old_purpose);
int control_event_circuit_cannibalized(origin_circuit_t *circ,
                                       int old_purpose,
                                       const struct timeval *old_tv_created);
int control_event_stream_status(entry_connection_t *conn,
                                stream_status_event_t e,
                                int reason);
int control_event_or_conn_status(or_connection_t *conn,
                                 or_conn_status_event_t e, int reason);
int control_event_bandwidth_used(uint32_t n_read, uint32_t n_written);
int control_event_stream_bandwidth(edge_connection_t *edge_conn);
int control_event_stream_bandwidth_used(void);
int control_event_circ_bandwidth_used(void);
int control_event_conn_bandwidth(connection_t *conn);
int control_event_conn_bandwidth_used(void);
int control_event_circuit_cell_stats(void);
int control_event_tb_empty(const char *bucket, uint32_t read_empty_time,
                           uint32_t write_empty_time,
                           int milliseconds_elapsed);
void control_event_logmsg(int severity, uint32_t domain, const char *msg);
int control_event_descriptors_changed(smartlist_t *routers);
int control_event_address_mapped(const char *from, const char *to,
                                 time_t expires, const char *error,
                                 const int cached);
int control_event_or_authdir_new_descriptor(const char *action,
                                            const char *desc,
                                            size_t desclen,
                                            const char *msg);
int control_event_my_descriptor_changed(void);
int control_event_networkstatus_changed(smartlist_t *statuses);

int control_event_newconsensus(const networkstatus_t *consensus);
int control_event_networkstatus_changed_single(const routerstatus_t *rs);
int control_event_general_status(int severity, const char *format, ...)
  CHECK_PRINTF(2,3);
int control_event_client_status(int severity, const char *format, ...)
  CHECK_PRINTF(2,3);
int control_event_server_status(int severity, const char *format, ...)
  CHECK_PRINTF(2,3);
int control_event_guard(const char *nickname, const char *digest,
                        const char *status);
int control_event_conf_changed(const smartlist_t *elements);
int control_event_buildtimeout_set(const circuit_build_times_t *cbt,
                                   buildtimeout_set_event_t type);
int control_event_signal(uintptr_t signal);

int init_cookie_authentication(int enabled);
smartlist_t *decode_hashed_passwords(config_line_t *passwords);
void disable_control_logging(void);
void enable_control_logging(void);

void monitor_owning_controller_process(const char *process_spec);

void control_event_bootstrap(bootstrap_status_t status, int progress);
void control_event_bootstrap_problem(const char *warn, int reason);

void control_event_clients_seen(const char *controller_str);

#ifdef CONTROL_PRIVATE
/* Used only by control.c and test*.c */
size_t write_escaped_data(const char *data, size_t len, char **out);
size_t read_escaped_data(const char *data, size_t len, char **out);

/** Helper structure: temporarily stores cell statistics for a circuit. */
typedef struct cell_stats_t {
  /** Number of cells added in app-ward direction by command. */
  uint64_t added_cells_appward[CELL_COMMAND_MAX_ + 1];
  /** Number of cells added in exit-ward direction by command. */
  uint64_t added_cells_exitward[CELL_COMMAND_MAX_ + 1];
  /** Number of cells removed in app-ward direction by command. */
  uint64_t removed_cells_appward[CELL_COMMAND_MAX_ + 1];
  /** Number of cells removed in exit-ward direction by command. */
  uint64_t removed_cells_exitward[CELL_COMMAND_MAX_ + 1];
  /** Total waiting time of cells in app-ward direction by command. */
  uint64_t total_time_appward[CELL_COMMAND_MAX_ + 1];
  /** Total waiting time of cells in exit-ward direction by command. */
  uint64_t total_time_exitward[CELL_COMMAND_MAX_ + 1];
} cell_stats_t;
void sum_up_cell_stats_by_command(circuit_t *circ,
                                  cell_stats_t *cell_stats);
void append_cell_stats_by_command(smartlist_t *event_parts,
                                  const char *key,
                                  const uint64_t *include_if_non_zero,
                                  const uint64_t *number_to_include);
void format_cell_stats(char **event_string, circuit_t *circ,
                       cell_stats_t *cell_stats);
#endif

#endif

