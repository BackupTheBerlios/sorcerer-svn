(

  sed  -i  "s:-g -O2 -Wall:${CFLAGS}:"  configure

  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
	       --lang=en	  \
               $OPTS              &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1
