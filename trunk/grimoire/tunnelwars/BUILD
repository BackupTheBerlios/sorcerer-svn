(

  ./configure  --build=$BUILD          \
               --prefix=/usr           \
               --bindir=$PREFIX/games  \
               $OPTS                   &&
  make                                 &&
  prepare_install                      &&
  make    install

) > $C_FIFO 2>&1
