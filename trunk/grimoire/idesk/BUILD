(

  sed -i   "s:-g -O2:$CFLAGS:"  Makefile
  make			&&
  prepare_install	&&
  install -o root -g root -m 755 idesk /usr/bin

) > $C_FIFO 2>&1
