cp  /bin/bash  /tmp

(

  ./configure  --build=$BUILD    \
               --prefix=$PREFIX  \
               --with-installed-readline  \
               --with-curses  &&
  make                        &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1  &&  (

  ln  -sf  bash  $PREFIX/bin/sh

  if    [  "$UID"  ==   "0"  ];  then
    rm  -f         /usr/bin/bash
    cp  -f   bash  /bin
    ln  -sf  bash  /bin/sh
    true
  fi

)
