if  default_build;  then

  cp     $SCRIPT_DIR/xinetd.sh  /etc/init.d

  ln  -sf  ../init.d/xinetd.sh  /etc/rc0.d/K60xinetd
  ln  -sf  ../init.d/xinetd.sh  /etc/rc1.d/K60xinetd
  ln  -sf  ../init.d/xinetd.sh  /etc/rc2.d/K60xinetd
  ln  -sf  ../init.d/xinetd.sh  /etc/rc6.d/K60xinetd

  ln  -sf  ../init.d/xinetd.sh  /etc/rc3.d/S40xinetd
  ln  -sf  ../init.d/xinetd.sh  /etc/rc4.d/S40xinetd
  ln  -sf  ../init.d/xinetd.sh  /etc/rc5.d/S40xinetd

  mkdir  -p       /var/log/xinetd
  mkdir  -p       /etc/xinetd.d
  ID="includedir  /etc/xinetd.d"
  [  -f           /etc/xinetd.conf  ]  ||
  echo  "$ID"  >  /etc/xinetd.conf
else
  false
fi
