(

  sedit  "s:/usr/local:/usr:"                           Makefile
  sedit  "s:EXTRA_CFLAGS =:EXTRA_CFLAGS = $CFLAGS:"     Makefile
  sedit  "s?EXTRA_LDFLAGS =?EXTRA_LDFLAGS = $LDFLAGS?"  Makefile

  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
