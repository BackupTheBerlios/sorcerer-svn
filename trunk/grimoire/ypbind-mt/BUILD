(

 ./configure  --prefix=/usr  &&
  make                       &&
  prepare_install            &&
  make    install

) > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIR/ypbind.sh     /etc/init.d
  if  $YPBIND_BOOT;  then
    ln  -sf  ../init.d/ypbind.sh  /etc/rc0.d/K60ypbind
    ln  -sf  ../init.d/ypbind.sh  /etc/rc1.d/K60ypbind
    ln  -sf  ../init.d/ypbind.sh  /etc/rc2.d/K60ypbind
    ln  -sf  ../init.d/ypbind.sh  /etc/rc6.d/K60ypbind

    ln  -sf  ../init.d/ypbind.sh  /etc/rc3.d/S40ypbind
    ln  -sf  ../init.d/ypbind.sh  /etc/rc4.d/S40ypbind
    ln  -sf  ../init.d/ypbind.sh  /etc/rc5.d/S40ypbind
  fi

)
