WHERE="sysconfdir=/etc localstatedir=/var/cache libexecdir=/usr/bin"

CONF="/etc/ntp.conf"

save_conf()  {
  if    [  -f  $CONF  ]
  then  cp     $CONF  $CONF.ss
  fi
}

restore_conf()  {
  if    [  -f  $CONF.ss  ]
  then
    cp         $CONF     $CONF.default
    cp         $CONF.ss  $CONF
    rm     -f  $CONF.ss
  fi
}


save_conf
./configure   --build=$BUILD  \
              --prefix=/usr   &&
make             $WHERE       &&
prepare_install               &&
make    install  $WHERE       &&
restore_conf
