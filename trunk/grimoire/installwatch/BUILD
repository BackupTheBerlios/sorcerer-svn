(

  LD_PRELOAD_OLD="$LD_PRELOAD"
  unset  LD_PRELOAD

  if    [  -d  /opt/glibc/2.2.5/lib  ]
  then  export   CFLAGS="$CFLAGS   -isystem /opt/glibc/2.2.5/include"
        export  LDFLAGS="-rpath-link /opt/glibc/2.2.5/lib -L/opt/glibc/2.2.5/lib"
  else  unset   LDFLAGS
  fi

  sedit  "s:PREFIX=/usr/local:PREFIX=/usr:"  Makefile
  sedit  "s:gcc :gcc $CFLAGS :"              Makefile
  sedit  "s:ld :ld $LDFLAGS :"               Makefile

  make                                  &&
  prepare_install                       &&
  export  LD_PRELOAD="$LD_PRELOAD_OLD"  &&
  make    install

) > $C_FIFO 2>&1
