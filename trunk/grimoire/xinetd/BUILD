install_init()  {

  cp     $SCRIPT_DIR/xinetd.sh  /etc/init.d

  ln  -sf  ../init.d/xinetd.sh  /etc/rc0.d/K60xinetd
  ln  -sf  ../init.d/xinetd.sh  /etc/rc1.d/K60xinetd
  ln  -sf  ../init.d/xinetd.sh  /etc/rc2.d/K60xinetd
  ln  -sf  ../init.d/xinetd.sh  /etc/rc6.d/K60xinetd

  ln  -sf  ../init.d/xinetd.sh  /etc/rc3.d/S40xinetd
  ln  -sf  ../init.d/xinetd.sh  /etc/rc4.d/S40xinetd
  ln  -sf  ../init.d/xinetd.sh  /etc/rc5.d/S40xinetd

}


install_conf()  {
  mkdir  -p       /var/log/xinetd
  mkdir  -p       /etc/xinetd.d
  ID="includedir  /etc/xinetd.d"
  echo  "$ID"  >  /etc/xinetd.conf
  touch           /etc/xinetd.conf
}


default_build  &&
install_init   &&
install_conf
