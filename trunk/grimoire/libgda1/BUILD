(

  bzcat  $SCRIPT_DIR/libgda-0.2.96.patch.bz2  |
  patch  -p1

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
