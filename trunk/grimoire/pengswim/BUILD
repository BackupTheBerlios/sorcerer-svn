(

  configure  --prefix=$PREFIX         \
             --bindir=$PREFIX//games  \
             $OPTS  &&
  make              &&
  prepare_install   &&
  make    install

) > $C_FIFO 2>&1
