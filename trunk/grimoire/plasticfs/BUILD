(

  sedit  "s:friend:friend class:"  lib/rcstring.h
  sedit  "s:-version-info:-lc -ldl -lstdc++ $LDFLAGS -version-info:"  Makefile.in
# sedit  "s:-version-info:-lc -ldl -lstdc++ \$LDFLAGS -version-info:" etc/Makefile.sh

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
