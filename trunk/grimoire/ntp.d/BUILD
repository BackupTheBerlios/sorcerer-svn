CONF="/etc/ntp.conf"

install_conf()  {  install  -m 0644  $SCRIPT_DIR/ntp.conf  /etc;  }
install_man()   {  cp  -r  html  /usr/doc/ntp;  }

install_init()  {
  install  -m  0744  $SCRIPT_DIR/ntp.sh  /etc/init.d

  ln  -sf  ../init.d/ntp.sh  /etc/rc0.d/K65ntp
  ln  -sf  ../init.d/ntp.sh  /etc/rc1.d/K65ntp
  ln  -sf  ../init.d/ntp.sh  /etc/rc2.d/K65ntp
  ln  -sf  ../init.d/ntp.sh  /etc/rc6.d/K65ntp

  ln  -sf  ../init.d/ntp.sh  /etc/rc3.d/S35ntp
  ln  -sf  ../init.d/ntp.sh  /etc/rc4.d/S35ntp
  ln  -sf  ../init.d/ntp.sh  /etc/rc5.d/S35ntp
}


./configure   	--build=$BUILD		\
              	--prefix=/usr		\
		--libexecdir=/usr/bin	\
		--sysconfdir=/etc	\
		--localstatedir=/var	&&
make           			       	&&
prepare_install                         &&
make    install				&&
install_conf				&&
install_man                             &&
install_init
