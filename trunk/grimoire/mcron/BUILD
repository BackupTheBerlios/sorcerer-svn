install_init()  {

  [  -f  /usr/bin/cron  ]  &&
  mv     /usr/bin/cron  /usr/sbin/cron

  mkdir  -p  /var/cron/tabs

  cp  $SCRIPT_DIR/mcron.sh        /etc/init.d

  ln     -sf  ../init.d/mcron.sh  /etc/rcS.d/S80mcron
  ln     -sf  ../init.d/mcron.sh  /etc/rc0.d/K20mcron
  ln     -sf  ../init.d/mcron.sh  /etc/rc6.d/K20mcron

}

default_build  &&
install_init
