(

  make  &&
  prepare_install

) > $C_FIFO 2>&1  &&  (


  if  [  "$PREFIX"  ==  "/usr"  ];  then
    install  -o root -g root -m 755  lilo                   /sbin
    install  -o root -g root -m 755  mkrescue               /sbin
    install  -o root -g root -m 755  keytab-lilo.pl         /sbin
  else
    install  -o root -g root -m 755  lilo            $PREFIX/sbin
    install  -o root -g root -m 755  mkrescue        $PREFIX/sbin
    install  -o root -g root -m 755  keytab-lilo.pl  $PREFIX/sbin
  fi

  MP="manPages"
  install  -o root -g root -m 644  $MP/lilo.conf.5   $PREFIX/man/man5
  install  -o root -g root -m 644  $MP/lilo.8        $PREFIX/man/man8
  install  -o root -g root -m 644  $MP/mkrescue.8    $PREFIX/man/man8

)
