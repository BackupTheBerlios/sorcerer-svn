(

  RUN_DIE="#!/bin/sh
cd  /usr/share/die
/usr/libexec/die
"

  perform_install()  {
    cd  ..
    sed    -i   "s:\./data/:/usr/share/die/data:"  resources.cfg
    sed    -i   "s:./lib/:/usr/lib/OGRE/:"           plugins.cfg
    mkdir  -p               /usr/share/die
    cp     -a  *.cfg  data  /usr/share/die
    echo  "$RUN_DIE"  >     /usr/games/die
    chmod        0775       /usr/games/die
    install  -m  0755  src/die  /usr/libexec/die
  }

  cd  src
  rm  die
  sed  -i  "s:/usr/local:/usr:"  Makefile
  make             &&
  prepare_install  &&
  perform_install

) > $C_FIFO 2>&1
