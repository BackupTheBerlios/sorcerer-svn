(

  # problem in 4.04.02 with es.po therefore avoid making it.
  rm  -f  po/es.po
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  sedit  "s/es\.po//"   po/Makefile  &&
  sedit  "s/es\.gmo//"  po/Makefile  &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1

