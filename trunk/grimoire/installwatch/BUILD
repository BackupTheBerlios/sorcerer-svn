(

  sedit  "s:PREFIX=/usr/local:PREFIX=/usr:"  Makefile
  sedit  "s/gcc /gcc $CFLAGS /"              Makefile

  bzcat  $SCRIPT_DIR/iw.patch.bz2  |  patch

  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
