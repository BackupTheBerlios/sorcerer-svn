( 

  mkdir  bison
  cd     bison-1.35  &&
  ./configure  --prefix=$BUILD_DIR/bison      &&
  make  install                               &&
  cd    ..                                    &&
  export  PATH="$BUILD_DIR/bison/bin:$PATH"   &&

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
