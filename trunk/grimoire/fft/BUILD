(

  sed  "s:/local::g"   \
       Makefile.linux  \
    >  Makefile        &&
  make                 &&
  make                 &&
  prepare_install      &&
  make    install

) > $C_FIFO 2>&1
