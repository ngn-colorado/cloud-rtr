/* Added for Tor */
#ifndef SRC_EXT_ED25519_REF10_H_INCLUDED_
#define SRC_EXT_ED25519_REF10_H_INCLUDED_
#include <torint.h>

int ed25519_ref10_seckey(unsigned char *sk);
int ed25519_ref10_pubkey(unsigned char *pk,const unsigned char *sk);
int ed25519_ref10_keygen(unsigned char *pk,unsigned char *sk);
int ed25519_ref10_open(
  unsigned char *m,uint64_t *mlen,
  const unsigned char *sm,uint64_t smlen,
  const unsigned char *pk);
int ed25519_ref10_sign(
  unsigned char *sm,uint64_t *smlen,
  const unsigned char *m,uint64_t mlen,
  const unsigned char *sk);

#endif
