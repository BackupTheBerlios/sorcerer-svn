(

  cd     fontconfig

  if    [  -n  "$LD_LIBRARY_PATH"  ]
  then  export   LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$PWD/src"
  else  export   LD_LIBRARY_PATH="$PWD/src"
  fi

  sh  cvscompile.sh  --prefix=/usr      \
                     --sysconfdir=/etc  &&
  make                                  &&
  prepare_install                       &&
  make    install

) > $C_FIFO 2>&1
