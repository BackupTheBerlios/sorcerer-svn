(

  sedit  "s:-version-info:-lc -ldl -lstdc++ $LDFLAGS -version-info:"  Makefile.in

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
