(

  export  PATH="$CANTRIP/opt/bison/1.35/bin:$PATH"

  ./configure --prefix=/usr       \
              --with-gtk          \
              --enable-zipstream  \
              $OPTS               &&
  make                            &&
  prepare_install                 &&
  make    install

) > $C_FIFO 2>&1
