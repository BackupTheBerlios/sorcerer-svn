cp  /bin/bash  /tmp

(

  ./configure  --build=$BUILD  \
               --prefix=/usr   \
               --bindir=/bin   \
               --with-installed-readline  \
               --with-curses  &&
  make                        &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  cp  -f  bash     /bin
  cp  -f  bashbug  /bin
  ln  -sf  bash    /bin/sh

  cd  doc

  for  MANPAGE  in  `ls  *.1`;  do
    gzip  -9  $MANPAGE
    cp  $MANPAGE.gz  /usr/man/man1
  done

)
