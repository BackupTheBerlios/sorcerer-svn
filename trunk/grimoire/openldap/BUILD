(

  sedit  "s:ret, name:ret, NULL, name:"  libraries/libldbm/ldbm.c

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --enable-shell        \
               --disable-debug       \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
