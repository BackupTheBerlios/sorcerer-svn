(

  ./configure  --build=$BUILD    \
               --prefix=$PREFIX  \
               $OPTS             &&
  make                           &&
  prepare_install                &&
  make    install                &&
  chmod  a-s  $PREFIX/bin/make

) > $C_FIFO 2>&1
