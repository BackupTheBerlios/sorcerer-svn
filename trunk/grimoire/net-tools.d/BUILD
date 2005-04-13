install_conf()  {

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

}

case  $VERSION  in
  1.60)  sed  -i  "\,default:,abreak;"  hostname.c  lib/inet_sr.c  ;;
esac


sed  -i  "s:-O2:$CFLAGS:
          s?LOPTS =?LOPTS = $LDFLAGS?"  Makefile

cp  $SCRIPT_DIR/config.h  .

make             &&
prepare_install  &&
make  BASEDIR=/  install  &&
install_conf
