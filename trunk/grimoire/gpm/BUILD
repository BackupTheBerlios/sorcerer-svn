(

  ./configure  --prefix=/usr                           &&
  sed  -i  "s/src doc contrib/src contrib/"  Makefile  &&
  make                                                 &&
  prepare_install                                      &&
  make    install
  
) > $C_FIFO 2>&1
