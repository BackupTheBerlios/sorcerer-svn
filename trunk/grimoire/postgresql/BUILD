(

  ./configure  --prefix=/usr               \
               --enable-integer-datetimes  \
	       --with-nls                  \
	       $OPTS  &&
  make                &&
  prepare_install     &&
  make    install     &&
  make    install-all-headers

) > $C_FIFO 2>&1
