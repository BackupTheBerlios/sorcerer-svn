(

  cd     fontconfig

  if    [  -n  "$LD_LIBRARY_PATH"  ]
  then  export   LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PWD/src"
  else  export   LD_LIBRARY_PATH="$PWD/src"
  fi

  if    [  "$PREFIX"  ==  "/usr"  ]
  then  SDIR="--sysconfdir=/etc"         PDIR="--prefix=$PREFIX"
  else  SDIR="--sysconfdir=$PREFIX/etc"  PDIR="--prefix=$PREFIX"
  fi

  sh  cvscompile.sh  \
      $SDIR  $PDIR   &&
  make               &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1
