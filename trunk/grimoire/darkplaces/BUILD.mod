(

  prepare_install                       &&
  mkdir  -p     /usr/share/games/quake  &&
  cp     -a  *  /usr/share/games/quake

) > $C_FIFO 2>&1
