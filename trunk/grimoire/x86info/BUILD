(

#  cp     Makefile  Makefile.original
#  echo  "CFLAGS = $CFLAGS"  >  Makefile
#  grep  -v  "^CFLAGS"  Makefile.original  >>  Makefile

  make  "CFLAGS=$CFLAGS"                            &&
  prepare_install                                   &&
  install  -m 0755 x86info    $PREFIX/sbin/x86info  &&
  install  -m 0644 x86info.1  $PREFIX/man/man1

) > $C_FIFO 2>&1  &&  (

if    [  "$UID"  ==  0  ]
then  make  nodes
fi

)

