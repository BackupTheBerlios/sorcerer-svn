(
 
  sed  -i  "s:-Wl,-Bstatic::"  Makefile.in
  ./configure  --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make  CFLAGS="${CFLAGS} -DMD_VERSION=\\\"${VERSION}\\\""  &&
  prepare_install  &&
  make    install                                           
     
) > $C_FIFO 2>&1
