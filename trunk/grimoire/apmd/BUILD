(

  if    echo  "$OPTS"  |  grep  -q  "\--without-x11"
  then  patch  -p1  <  $SCRIPT_DIR/apmd.Makefile.nox11.diff
  fi

  sedit "s:CFLAGS=-O -g:CFLAGS=$CFLAGS:"   Makefile   &&	      
  make                                                &&
  prepare_install                                     &&
  make    install

) > $C_FIFO 2>&1
