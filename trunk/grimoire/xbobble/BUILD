(

  mv  libayq-0.01/include/ayq .
  sed  -i  "s:-lGLU:-L/usr/X11R6/lib -lGLU:"  GNUmakefile
  make  &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  XBO="export  XBOBBLE1_OPTIONS=\"'data_root'='/usr/share/xbobble';\""
  cp     -a    data  /usr/share/xbobble
  install  -m 755  -o root  -g root  xbobble1-bin    /usr/share/xbobble
  echo  "#!/bin/sh"                              >   /usr/games/xbobble
  echo  "$XBO"                                   >>  /usr/games/xbobble
  echo  "exec  /usr/share/xbobble/xbobble1-bin"  >>  /usr/games/xbobble
  chmod  755   /usr/games/xbobble

)
