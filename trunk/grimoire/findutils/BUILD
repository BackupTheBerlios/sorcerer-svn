(

  patch  -p 1  <  $SCRIPT_DIR/findutils-4.1.patch

  if    [  "$PREFIX"  ==  "/usr"  ]
  then  WHERE="sysconfdir=/etc localstatedir=/var/cache libexecdir=/usr/bin"
  fi

  ./configure   --build=$BUILD    \
                --prefix=$PREFIX  &&
   make             $WHERE        &&
   prepare_install                &&
   make    install  $WHERE

) > $C_FIFO 2>&1
