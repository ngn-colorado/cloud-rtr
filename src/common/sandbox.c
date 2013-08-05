/* Copyright (c) 2001 Matej Pfajfar.
 * Copyright (c) 2001-2004, Roger Dingledine.
 * Copyright (c) 2004-2006, Roger Dingledine, Nick Mathewson.
 * Copyright (c) 2007-2013, The Tor Project, Inc. */
/* See LICENSE for licensing information */

/**
 * \file sandbox.c
 * \brief Code to enable sandboxing.
 **/

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "sandbox.h"
#include "torlog.h"
#include "orconfig.h"
#include "torint.h"
#include "util.h"

#if defined(HAVE_SECCOMP_H) && defined(__linux__)
#define USE_LIBSECCOMP
#endif

#define DEBUGGING_CLOSE

#if defined(USE_LIBSECCOMP)

#define _GNU_SOURCE

#include <sys/mman.h>
#include <sys/syscall.h>
#include <sys/types.h>
#include <sys/epoll.h>
#include <sys/prctl.h>
#include <linux/futex.h>
#include <bits/signum.h>

#include <seccomp.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <time.h>
#include <poll.h>

static sandbox_cfg_t *filter_dynamic = NULL;

/** Variable used for storing all syscall numbers that will be allowed with the
 * stage 1 general Tor sandbox.
 */
static int filter_nopar_gen[] = {
    SCMP_SYS(brk),
    SCMP_SYS(close),
    SCMP_SYS(clone),
    SCMP_SYS(epoll_create),
    SCMP_SYS(epoll_wait),
    SCMP_SYS(fcntl),
    SCMP_SYS(fstat),
#ifdef __NR_fstat64
    SCMP_SYS(fstat64),
#endif
    SCMP_SYS(getdents64),
    SCMP_SYS(getegid),
#ifdef __NR_getegid32
    SCMP_SYS(getegid32),
#endif
    SCMP_SYS(geteuid),
#ifdef __NR_geteuid32
    SCMP_SYS(geteuid32),
#endif
    SCMP_SYS(getgid),
#ifdef __NR_getgid32
    SCMP_SYS(getgid32),
#endif
    SCMP_SYS(getrlimit),
    SCMP_SYS(gettimeofday),
    SCMP_SYS(getuid),
#ifdef __NR_getuid32
    SCMP_SYS(getuid32),
#endif
    SCMP_SYS(lseek),
#ifdef __NR__llseek
    SCMP_SYS(_llseek),
#endif
    SCMP_SYS(mkdir),
    SCMP_SYS(mlockall),
    SCMP_SYS(mmap),
    SCMP_SYS(munmap),
    SCMP_SYS(read),
    SCMP_SYS(rename),
    SCMP_SYS(rt_sigreturn),
#ifdef __NR_sigreturn
    SCMP_SYS(sigreturn),
#endif
    SCMP_SYS(stat),
#ifdef __NR_stat64
    SCMP_SYS(stat64),
#endif
    SCMP_SYS(write),
    SCMP_SYS(exit_group),
    SCMP_SYS(exit),

    // Not needed..
//    SCMP_SYS(access),
//    SCMP_SYS(set_robust_list),
//    SCMP_SYS(set_thread_area),
//    SCMP_SYS(set_tid_address),
//    SCMP_SYS(uname),

    // socket syscalls
    SCMP_SYS(bind),
    SCMP_SYS(connect),
    SCMP_SYS(getsockname),
    SCMP_SYS(getsockopt),
    SCMP_SYS(listen),
    SCMP_SYS(recv),
    SCMP_SYS(recvmsg),
    SCMP_SYS(sendto),
    SCMP_SYS(send),
    SCMP_SYS(setsockopt),
    SCMP_SYS(socket),
    SCMP_SYS(socketpair),
    SCMP_SYS(recvfrom),
    SCMP_SYS(unlink),
};

static int
sb_rt_sigaction(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int i, rc;
  int param[] = { SIGINT, SIGTERM, SIGPIPE, SIGUSR1, SIGUSR2, SIGHUP, SIGCHLD,
#ifdef SIGXFSZ
      SIGXFSZ
#endif
      };

  for (i = 0; i < ARRAY_LENGTH(param); i++) {
    rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(rt_sigaction), 1,
        SCMP_CMP(0, SCMP_CMP_EQ, param[i]));
    if (rc)
      break;
  }

  return rc;
}

static int
sb_execve(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc;
  sandbox_cfg_t *elem = NULL;

  // for each dynamic parameter filters
  for (elem = filter; elem != NULL; elem = elem->next) {
    if (elem->prot == 1 && elem->syscall == SCMP_SYS(execve)) {
      rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(execve), 1,
            SCMP_CMP(0, SCMP_CMP_EQ, elem->param));
      if (rc != 0) {
        log_err(LD_BUG,"(Sandbox) failed to add execve syscall, received libseccomp "
            "error %d", rc);
        return rc;
      }
    }
  }

  return 0;
}

static int
sb_time(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  return seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(time), 1,
       SCMP_CMP(0, SCMP_CMP_EQ, 0));
}

static int
sb_accept4(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  return seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(socketcall), 1,
       SCMP_CMP(0, SCMP_CMP_EQ, 18));
}

#ifdef __NR_mmap2
static int
sb_mmap2(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(mmap2), 2,
       SCMP_CMP(2, SCMP_CMP_EQ, PROT_READ),
       SCMP_CMP(3, SCMP_CMP_EQ, MAP_PRIVATE));
  if (rc) {
    return rc;
  }

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(mmap2), 2,
       SCMP_CMP(2, SCMP_CMP_EQ, PROT_READ|PROT_WRITE),
       SCMP_CMP(3, SCMP_CMP_EQ, MAP_PRIVATE|MAP_ANONYMOUS));
  if (rc) {
    return rc;
  }

  return 0;
}
#endif

// TODO parameters
static int
sb_open(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc;
  sandbox_cfg_t *elem = NULL;

  // for each dynamic parameter filters
  for (elem = filter; elem != NULL; elem = elem->next) {
    if (elem->prot == 1 && elem->syscall == SCMP_SYS(open)) {
      rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(open), 1,
            SCMP_CMP(0, SCMP_CMP_EQ, elem->param));
      if (rc != 0) {
        log_err(LD_BUG,"(Sandbox) failed to add open syscall, received libseccomp "
            "error %d", rc);
        return rc;
      }
    }
  }

  return 0;
}

// TODO parameters
static int
sb_openat(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc;
  sandbox_cfg_t *elem = NULL;

  // for each dynamic parameter filters
  for (elem = filter; elem != NULL; elem = elem->next) {
    if (elem->prot == 1 && elem->syscall == SCMP_SYS(openat)) {
      rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(openat), 1,
            SCMP_CMP(1, SCMP_CMP_EQ, elem->param));
      if (rc != 0) {
        log_err(LD_BUG,"(Sandbox) failed to add openat syscall, received libseccomp "
            "error %d", rc);
        return rc;
      }
    }
  }

  return 0;
}

static int
sb_clock_gettime(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  return seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(clock_gettime), 1,
     SCMP_CMP(0, SCMP_CMP_EQ, CLOCK_MONOTONIC));
}

// TODO: param not working
static int
sb_socket(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(socketcall), 4,
      SCMP_CMP(0, SCMP_CMP_EQ, 1),
      SCMP_CMP(1, SCMP_CMP_EQ, PF_INET),
      SCMP_CMP(2, SCMP_CMP_EQ, SOCK_STREAM|SOCK_CLOEXEC),
      SCMP_CMP(3, SCMP_CMP_EQ, IPPROTO_TCP));
  if (rc)
    return rc;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(socketcall), 4,
      SCMP_CMP(0, SCMP_CMP_EQ, 1),
      SCMP_CMP(1, SCMP_CMP_EQ, PF_NETLINK),
      SCMP_CMP(2, SCMP_CMP_EQ, SOCK_RAW),
      SCMP_CMP(3, SCMP_CMP_EQ, 0));
  if (rc)
    return rc;

  return 0;
}

// TODO: param not working
static int
sb_setsockopt(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(setsockopt), 2,
      SCMP_CMP(1, SCMP_CMP_EQ, SOL_SOCKET),
      SCMP_CMP(2, SCMP_CMP_EQ, SO_REUSEADDR));
  if (rc)
    return rc;

  return 0;
}

#ifdef __NR_fcntl64
static int
sb_fcntl64(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(fcntl64), 1,
      SCMP_CMP(1, SCMP_CMP_EQ, F_GETFL));
  if (rc)
    return rc;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(fcntl64), 2,
      SCMP_CMP(1, SCMP_CMP_EQ, F_SETFL),
      SCMP_CMP(2, SCMP_CMP_EQ, O_RDWR|O_NONBLOCK));
  if (rc)
    return rc;

  return 0;
}
#endif

// allows everything but will keep for now..
static int
sb_epoll_ctl(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(epoll_ctl), 1,
      SCMP_CMP(1, SCMP_CMP_EQ, EPOLL_CTL_ADD));
  if (rc)
    return rc;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(epoll_ctl), 1,
      SCMP_CMP(1, SCMP_CMP_EQ, EPOLL_CTL_MOD));
  if (rc)
    return rc;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(epoll_ctl), 1,
      SCMP_CMP(1, SCMP_CMP_EQ, EPOLL_CTL_DEL));
  if (rc)
    return rc;

  return 0;
}

/**
 * If multiple filters need to be added, seccomp needs to be whitelisted in
 * this list.
 */
static int
sb_prctl(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(prctl), 1,
      SCMP_CMP(0, SCMP_CMP_EQ, PR_SET_DUMPABLE));
  if (rc)
    return rc;

  return 0;
}

/**
 * does not NEED tobe here.. only occurs before filter
 */
static int
sb_mprotect(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(mprotect), 1,
      SCMP_CMP(2, SCMP_CMP_EQ, PROT_READ));
  if (rc)
    return rc;

  return 0;
}

/**
 * does not NEED tobe here.. only occurs before filter
 */
static int
sb_rt_sigprocmask(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(rt_sigprocmask), 1,
      SCMP_CMP(0, SCMP_CMP_EQ, SIG_UNBLOCK));
  if (rc)
    return rc;

  return 0;
}

/**
 * does not NEED tobe here.. only occurs before filter
 */
static int
sb_flock(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(flock), 1,
      SCMP_CMP(1, SCMP_CMP_EQ, LOCK_EX|LOCK_NB));
  if (rc)
    return rc;

  return 0;
}

/**
 * does not NEED tobe here.. only occurs before filter
 */
static int
sb_futex(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(futex), 1,
      SCMP_CMP(1, SCMP_CMP_EQ,
          FUTEX_WAIT_BITSET_PRIVATE|FUTEX_CLOCK_REALTIME));
  if (rc)
    return rc;

  return 0;
}

/**
 * does not NEED tobe here.. only occurs before filter
 */
static int
sb_mremap(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(mremap), 1,
      SCMP_CMP(3, SCMP_CMP_EQ, MREMAP_MAYMOVE));
  if (rc)
    return rc;

  return 0;
}

static int
sb_poll(scmp_filter_ctx ctx, sandbox_cfg_t *filter)
{
  int rc = 0;

  rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, SCMP_SYS(poll), 2,
      SCMP_CMP(1, SCMP_CMP_EQ, 1),
      SCMP_CMP(2, SCMP_CMP_EQ, 10));
  if (rc)
    return rc;

  return 0;
}

static sandbox_filter_func_t filter_func[] = {
    sb_rt_sigaction,
    sb_rt_sigprocmask,
    sb_execve,
    sb_time,
    sb_accept4,
    sb_mmap2,
    sb_open,
    sb_openat,
    sb_clock_gettime,
    sb_fcntl64,
    sb_epoll_ctl,
    sb_prctl,
    sb_mprotect,
    sb_flock,
    sb_futex,
    sb_mremap,
    sb_poll
};

const char*
sandbox_intern_string(const char *param)
{
  sandbox_cfg_t *elem;

  if (param == NULL)
    return NULL;

  for (elem = filter_dynamic; elem != NULL; elem = elem->next) {
    if (elem->prot  && elem->ptype == PARAM_PTR
        && !strncmp(param, (char*)(elem->param), MAX_PARAM_LEN)) {
      return (char*)(elem->param);
    }
  }

  log_warn(LD_BUG, "(Sandbox) Parameter %s not found", param);
  return param;
}

static char*
prot_strdup(char* str)
{
  int param_size = 0;
  char *res = NULL;

  if (str == NULL)
    goto out;

  // allocating protected memory region for parameter
  param_size = 1 + strnlen(str, MAX_PARAM_LEN);
  if (param_size == MAX_PARAM_LEN) {
    log_warn(LD_BUG, "(Sandbox) Parameter length too large!");
  }

  res = (char*) mmap(NULL, param_size, PROT_READ | PROT_WRITE, MAP_PRIVATE |
      MAP_ANON, -1, 0);
  if (!res) {
    log_err(LD_BUG,"(Sandbox) failed allocate protected memory!");
    goto out;
  }

  // copying from non protected to protected + pointer reassign
  memcpy(res, str, param_size);

  // protecting from writes
  if (mprotect(res, param_size, PROT_READ)) {
    log_err(LD_BUG,"(Sandbox) failed to protect memory!");
    return NULL;
  }

 out:
   return res;
}

int
sandbox_cfg_allow_open_filename(sandbox_cfg_t **cfg, char *file)
{
  sandbox_cfg_t *elem = NULL;

  elem = (sandbox_cfg_t*) malloc(sizeof(sandbox_cfg_t));
  elem->syscall = SCMP_SYS(open);
  elem->pindex = 0;
  elem->ptype = PARAM_PTR;
  elem->param = (intptr_t) prot_strdup((char*) file);
  elem->prot = 1;

  elem->next = *cfg;
  *cfg = elem;

  return 0;
}

int
sandbox_cfg_allow_openat_filename(sandbox_cfg_t **cfg, char *file)
{
  sandbox_cfg_t *elem = NULL;

  elem = (sandbox_cfg_t*) malloc(sizeof(sandbox_cfg_t));
  elem->syscall = SCMP_SYS(openat);
  elem->pindex = 1;
  elem->ptype = PARAM_PTR;
  elem->param = (intptr_t) prot_strdup((char*) file);;
  elem->prot = 1;

  elem->next = *cfg;
  *cfg = elem;

  return 0;
}

int
sandbox_cfg_allow_execve(sandbox_cfg_t **cfg, char *com)
{
  sandbox_cfg_t *elem = NULL;

  elem = (sandbox_cfg_t*) malloc(sizeof(sandbox_cfg_t));
  elem->syscall = SCMP_SYS(openat);
  elem->pindex = 1;
  elem->ptype = PARAM_PTR;
  elem->param = (intptr_t) prot_strdup((char*) com);;
  elem->prot = 1;

  elem->next = *cfg;
  *cfg = elem;

  return 0;
}

static int
add_param_filter(scmp_filter_ctx ctx, sandbox_cfg_t* cfg)
{
  int i, rc = 0;

  // function pointer
  for (i = 0; i < ARRAY_LENGTH(filter_func); i++) {
    if ((filter_func[i])(ctx, cfg)) {
      log_err(LD_BUG,"(Sandbox) failed to add syscall %d, received libseccomp "
          "error %d", i, rc);
      return rc;
    }
  }

  return 0;
}

static int
add_noparam_filter(scmp_filter_ctx ctx)
{
  int i, filter_size, rc = 0;

  if (filter_nopar_gen != NULL) {
    filter_size = sizeof(filter_nopar_gen) / sizeof(filter_nopar_gen[0]);
  } else {
    filter_size = 0;
  }

  // add general filters
  for (i = 0; i < filter_size; i++) {
    rc = seccomp_rule_add(ctx, SCMP_ACT_ALLOW, filter_nopar_gen[i], 0);
    if (rc != 0) {
      log_err(LD_BUG,"(Sandbox) failed to add syscall index %d, "
          "received libseccomp error %d", i, rc);
      return rc;
    }
  }

  return 0;
}

/**
 * Function responsible for setting up and enabling a global syscall filter.
 * The function is a prototype developed for stage 1 of sandboxing Tor.
 * Returns 0 on success.
 */
static int
install_syscall_filter(sandbox_cfg_t* cfg)
{
  int rc = 0;
  scmp_filter_ctx ctx;

  ctx = seccomp_init(SCMP_ACT_TRAP);
  if (ctx == NULL) {
    log_err(LD_BUG,"(Sandbox) failed to initialise libseccomp context");
    rc = -1;
    goto end;
  }

  // add parameter filters
  if ((rc = add_param_filter(ctx, cfg))) {
    log_err(LD_BUG, "(Sandbox) failed to add param filters!");
    goto end;
  }

  // adding filters with no parameters
  if ((rc = add_noparam_filter(ctx))) {
    log_err(LD_BUG, "(Sandbox) failed to add param filters!");
    goto end;
  }

  rc = seccomp_load(ctx);

 end:
  seccomp_release(ctx);
  return (rc < 0 ? -rc : rc);
}

/** Additional file descriptor to use when logging seccomp2 failures */
static int sigsys_debugging_fd = -1;

/** Use the file descriptor <b>fd</b> to log seccomp2 failures. */
static void
sigsys_set_debugging_fd(int fd)
{
  sigsys_debugging_fd = fd;
}

/**
 * Function called when a SIGSYS is caught by the application. It notifies the
 * user that an error has occurred and either terminates or allows the
 * application to continue execution, based on the DEBUGGING_CLOSE symbol.
 */
static void
sigsys_debugging(int nr, siginfo_t *info, void *void_context)
{
  ucontext_t *ctx = (ucontext_t *) (void_context);
  char message[64];
  int rv = 0, syscall, length, err;
  (void) nr;

  if (info->si_code != SYS_SECCOMP)
    return;

  if (!ctx)
    return;

  syscall = ctx->uc_mcontext.gregs[REG_SYSCALL];

  /* XXXX Avoid use of snprintf; it isn't on the list of Stuff You're Allowed
   * To Do In A Signal Handler. */
  length = snprintf(message, sizeof(message),
      "\n\n(Sandbox) bad syscall (%d) was caught.\n",
      syscall);

  err = 0;
  if (sigsys_debugging_fd >= 0) {
    rv = write(sigsys_debugging_fd, message, length);
    err += rv != length;
  }

  rv = write(STDOUT_FILENO, message, length);
  err += rv != length;

  if (err)
    _exit(2);

#if defined(DEBUGGING_CLOSE)
  _exit(1);
#endif // DEBUGGING_CLOSE
}

/**
 * Function that adds a handler for SIGSYS, which is the signal thrown
 * when the application is issuing a syscall which is not allowed. The
 * main purpose of this function is to help with debugging by identifying
 * filtered syscalls.
 */
static int
install_sigsys_debugging(void)
{
  struct sigaction act;
  sigset_t mask;

  memset(&act, 0, sizeof(act));
  sigemptyset(&mask);
  sigaddset(&mask, SIGSYS);

  act.sa_sigaction = &sigsys_debugging;
  act.sa_flags = SA_SIGINFO;
  if (sigaction(SIGSYS, &act, NULL) < 0) {
    log_err(LD_BUG,"(Sandbox) Failed to register SIGSYS signal handler");
    return -1;
  }

  if (sigprocmask(SIG_UNBLOCK, &mask, NULL)) {
    log_err(LD_BUG,"(Sandbox) Failed call to sigprocmask()");
    return -2;
  }

  return 0;
}

static int register_cfg(sandbox_cfg_t* cfg) {
  sandbox_cfg_t *elem = NULL;

  if (filter_dynamic == NULL) {
    filter_dynamic = cfg;
    return 0;
  }

  for (elem = filter_dynamic; elem->next != NULL; elem = elem->next);

  elem->next = cfg;

  return 0;
}

#endif // USE_LIBSECCOMP

#ifdef USE_LIBSECCOMP
/**
 * Initialises the syscall sandbox filter for any linux architecture, taking
 * into account various available features for different linux flavours.
 */
static int
initialise_libseccomp_sandbox(sandbox_cfg_t* cfg)
{
  if (install_sigsys_debugging())
    return -1;

  if (install_syscall_filter(cfg))
    return -2;

  if (register_cfg(cfg))
    return -3;

  return 0;
}

#endif // USE_LIBSECCOMP

sandbox_cfg_t*
sandbox_cfg_new()
{
  return NULL;
}

int
sandbox_init(sandbox_cfg_t* cfg)
{
#if defined(USE_LIBSECCOMP)
  return initialise_libseccomp_sandbox(cfg);

#elif defined(_WIN32)
  log_warn(LD_BUG,"Windows sandboxing is not implemented. The feature is "
      "currently disabled.");
  return 0;

#elif defined(TARGET_OS_MAC)
  log_warn(LD_BUG,"Mac OSX sandboxing is not implemented. The feature is "
      "currently disabled");
  return 0;
#else
  log_warn(LD_BUG,"Sandboxing is not implemented for your platform. The "
      "feature is currently disabled");
  return 0;
#endif
}

/**
 * Enables the stage 1 general sandbox. It applies a syscall filter which does
 * not restrict any Tor features. The filter is representative for the whole
 * application.
 */
int
tor_global_sandbox(void)
{

#if defined(USE_LIBSECCOMP)
  return initialise_libseccomp_sandbox(NULL);

#elif defined(_WIN32)
  log_warn(LD_BUG,"Windows sandboxing is not implemented. The feature is "
      "currently disabled.");
  return 0;

#elif defined(TARGET_OS_MAC)
  log_warn(LD_BUG,"Mac OSX sandboxing is not implemented. The feature is "
      "currently disabled");
  return 0;
#else
  log_warn(LD_BUG,"Sandboxing is not implemented for your platform. The "
      "feature is currently disabled");
  return 0;
#endif
}

/** Use <b>fd</b> to log non-survivable sandbox violations. */
void
sandbox_set_debugging_fd(int fd)
{
#ifdef USE_LIBSECCOMP
  sigsys_set_debugging_fd(fd);
#else
  (void)fd;
#endif
}

