(

  rm  -rf  ext/DB_File
  mv  DB_File-1.806  ext/DB_File
  ./Configure  -Dprefix=/usr -d -e -Dusethreads
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
