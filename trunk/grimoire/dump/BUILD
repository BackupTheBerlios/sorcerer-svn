(

      CC="--with-cc=gcc $CFLAGS"
  LDOPTS="--with-ldopts=$LDFLAGS"

  ./configure  --prefix=/usr       \
               --enable-largefile  \
               --enable-rmt        \
               "$CC"               \
               "$LDOPTS"           &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
