(

  ./configure  --build=$BUILD  \
               --prefix=/usr   \
               $OPTS           &&
  make  "LDFLAGS=$LDFLAGS"     &&
  prepare_install              &&
  make    install              &&
  ln  -sf  flex  /usr/bin/lex

) > $C_FIFO 2>&1
