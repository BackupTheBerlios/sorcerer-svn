(

  ./configure  --build=$BUILD    \
               --prefix=$PREFIX  \
               $OPTS             &&
  make                           &&
  prepare_install                &&
  make    install                &&
  ln  -sf  flex  $PREFIX/bin/lex

) > $C_FIFO 2>&1
