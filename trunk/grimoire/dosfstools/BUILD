(

#  sed  -i  "s/-O2 -fomit-frame-pointer/$CFLAGS/"  Makefile

  MAKE_OPTS="PREFIX=/usr  MANDIR=/usr/man/man8"

  make  $MAKE_OPTS  &&
  prepare_install   &&
  make    install   $MAKE_OPTS

) > $C_FIFO 2>&1
