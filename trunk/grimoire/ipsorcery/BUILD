(

  sedit  "s:-O2:$CFLAGS:g"  Makefile
  make clean       &&
  make gtk         &&
  prepare_install  &&
  install  magic  -m 755  /usr/bin/ipsorcery 

) > $C_FIFO 2>&1
