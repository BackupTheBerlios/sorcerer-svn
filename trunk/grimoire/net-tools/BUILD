if  [  -f  $CONFIG_LOGS/$SPELL/config.h  ];  then
  cp       $CONFIG_LOGS/$SPELL/config.h  config.h
else
  ./configure.sh  config.in
  cp  config.h  $CONFIG_LOGS/$SPELL
fi

activate_voyeur

(

  sedit  "s:-O2:$CFLAGS:"               Makefile
  sedit  "s?LOPTS =?LOPTS = $LDFLAGS?"  Makefile
  make             &&
  prepare_install  &&
  make  BASEDIR=/  install

) > $C_FIFO 2>&1  &&  (

  if  !  [  -e  /etc/init.d/networking.sh  ]
  then   cp  $SCRIPT_DIR/networking.sh  /etc/init.d
  fi

  if  !  [  -e  /etc/init.d/hostname.sh    ]
  then  cp  $SCRIPT_DIR/hostname.sh    /etc/init.d
  fi

  ln     -sf  ../init.d/networking.sh  /etc/rc0.d/K70networking
  ln     -sf  ../init.d/networking.sh  /etc/rc1.d/K70networking
  ln     -sf  ../init.d/networking.sh  /etc/rc2.d/K70networking
  ln     -sf  ../init.d/networking.sh  /etc/rc6.d/K70networking

  ln     -sf  ../init.d/networking.sh  /etc/rc3.d/S30networking
  ln     -sf  ../init.d/networking.sh  /etc/rc4.d/S30networking
  ln     -sf  ../init.d/networking.sh  /etc/rc5.d/S30networking

  ln     -sf    ../init.d/hostname.sh  /etc/rcS.d/S20hostname

)
