(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&

  cd  ${SOURCE[1]}                   &&

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&

  prepare_install                    &&
  make    install                    &&
  cd  ..                             &&
  make    install

) > $C_FIFO 2>&1
