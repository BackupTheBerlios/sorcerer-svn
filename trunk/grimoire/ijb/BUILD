(
    
  if    [  -d  /etc/junkbuster  ]
  then  cp     /etc/junkbuster/*  .
  fi

  make             &&
  prepare_install  &&
  install -s -m 755 junkbuster /usr/sbin/junkbuster

) > $C_FIFO 2>&1  &&  (

  mkdir  -p                 /var/log/junkbuster
  mkdir  -p                 /usr/doc/junkbuster
  cp     -f  ijbman.html    /usr/doc/junkbuster
  cp     -f  ijbfaq.html    /usr/doc/junkbuster
  cp     -f  junkbuster.1   /usr/man/man8/junkbuster.8
  mkdir  -p                 /etc/junkbuster
  cp         *.ini          /etc/junkbuster/

  [  -f  /etc/init.d/junkbuster.sh  ]  ||
  cp     $SCRIPT_DIR/junkbuster.sh  /etc/init.d

  ln     -sf  ../init.d/junkbuster.sh  /etc/rc3.d/S40junkbuster
  ln     -sf  ../init.d/junkbuster.sh  /etc/rc4.d/S40junkbuster
  ln     -sf  ../init.d/junkbuster.sh  /etc/rc5.d/S40junkbuster

  ln     -sf  ../init.d/junkbuster.sh  /etc/rc0.d/K60junkbuster
  ln     -sf  ../init.d/junkbuster.sh  /etc/rc1.d/K60junkbuster
  ln     -sf  ../init.d/junkbuster.sh  /etc/rc2.d/K60junkbuster
  ln     -sf  ../init.d/junkbuster.sh  /etc/rc6.d/K60junkbuster

)
