sed  -i  "s/-O2 -fomit-frame-pointer/$CFLAGS/"  Makefile
sed  -i  "1i#include <errno.h>"  mkdosfs/mkdosfs.c

MAKE_OPTS="PREFIX=/usr  MANDIR=/usr/man/man8"

make  $MAKE_OPTS  &&
prepare_install   &&
make    install   $MAKE_OPTS
