(

  bunzip2  -cd  $SCRIPT_DIR/gcc-2.95.3-2.patch.bz2  |
  patch    -p 1

  ./configure  --host=$BUILD     \
               --prefix=/usr     \
               --enable-shared   &&
  make  bootstrap                &&
  prepare_install                && 

  make	prefix=/usr install      &&
  ln    -sf gcc /usr/bin/cc      &&

  # symlinks to make work  
  # gcc -print-file-name=cpp
  ln    -sf  ../../../../bin/cpp  /usr/lib/gcc-lib/$BUILD/$VERSION/cpp  &&
  ln    -sf  ../usr/bin/cpp  /lib/cpp

) > $C_FIFO 2>&1
