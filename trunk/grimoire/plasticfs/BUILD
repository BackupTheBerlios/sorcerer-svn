(

  sed  -i  "s:-version-info:-lc -ldl -lstdc++ $LDFLAGS -version-info:"  Makefile.in
  sed  -i  "1i#define NOT_IN_libc 1"  lib/plasticfs/opendir.cc

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
