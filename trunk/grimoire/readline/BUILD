(

  ./configure  --build=$BUILD \
               --prefix=/usr  \
               --libdir=/lib  &&
  make    shared              &&
  prepare_install             &&
  make    install             &&
  if    !  [   -d  /etc/inputrc ]
  then  cp  $SCRIPT_DIR/inputrc  /etc
  fi

) > $C_FIFO 2>&1
