(

  make_shared_lib()  {
    ld  --whole-archive  -share  -o  $1.so.1  $1.a
    ln  -sf  $1.so.1  $1.so
  }

  ./configure  --build=$BUILD      \
               --prefix=/usr       \
               $OPTS               &&
  make  "LDFLAGS=$LDFLAGS"         &&
  prepare_install                  &&
  make    install                  &&
  make_shared_lib  /usr/lib/libfl  &&
  ln  -sf  flex    /usr/bin/lex

) > $C_FIFO 2>&1
