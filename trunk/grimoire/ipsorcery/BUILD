(

  sedit  "s:-O2:$CFLAGS:g"  Makefile
  make clean       &&
  make gtk         &&
  prepare_install  &&
  cp     magic  $PREFIX/bin/ipsorcery
  chmod  755    $PREFIX/bin/ipsorcery

) > $C_FIFO 2>&1
