(

  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1  &&  (

  if  !  [  -e  /etc/syslog.conf  ];  then
    sed  -i  "s/usr/var/"  syslog.conf
    sed  -i  "s/adm/log/"  syslog.conf
    cp                     syslog.conf  /etc
  fi

  cp  $SCRIPT_DIR/sysklogd.sh        /etc/init.d
  ln      -sf ../init.d/sysklogd.sh  /etc/rcS.d/S20sysklogd
  ln      -sf ../init.d/sysklogd.sh  /etc/rc0.d/K70sysklogd
  ln      -sf ../init.d/sysklogd.sh  /etc/rc6.d/K70sysklogd

)
