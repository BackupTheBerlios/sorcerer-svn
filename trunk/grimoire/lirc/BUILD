finish_install()  {
  if    !  [  -f                      /etc/init.d/lircd.sh  ]
  then     cp  $SCRIPT_DIR/lircd.sh   /etc/init.d
  fi

  if  ! [  -f      /etc/modules.d/lirc  ]
  then  mkdir  -p  /etc/modules.d
  mconf   >    /etc/modules.d/lirc
  else  touch  /etc/modules.d/lirc
  fi
}


conf()  {
  if    [  -f  $CONFIG_LOGS/$BSPELL/configure.sh  ]
  then  cp     $CONFIG_LOGS/$BSPELL/configure.sh  .
  else
    patch  -p0  <  $SCRIPT_DIR/lirc-setup.patch
    wiz_kill
    ./setup.sh  &&
    cp  configure.sh  $CONFIG_LOGS/$BSPELL/
  fi
}


mconf()  {
  cat  <<  EOF
alias char-major-61  lirc_driver
#options lirc_serial irq=4 io=0x3e8
EOF
}


save_configure_sh()  {
  if     !   [  -f  configure.sh  ]
  then   cat  $SPELL_CONFIG  >> configure.sh
  fi
}


sed_source()  {
  sed -i 's:"$@":--prefix=/usr --sysconfdir=/etc:' configure.sh
  sed -i "s:-O2 -g:$CFLAGS:" configure
  sed -i "s:-O2 -g:$CFLAGS:" configure.in
}


update_cvs_source()  {
  if   [  "$BRANCH"  ==  "cvs"  ];  then
    [  -x  autogen.sh  ]  &&
    unset  CVSROOT  CVS_RSH
    echo   $OPTS  |  grep  -q  update  &&
    cvs    -z9  update
    ./autogen.sh
  fi
}


groupadd  lirc     2>/dev/null
rm  -f    /dev/lirc*

update_cvs_source  &&
conf               &&
activate_voyeur    &&
save_configure_sh  &&
sed_source         &&

  
{
sh  configure.sh         &&
make                     &&
prepare_install          &&
make    install          &&
chgrp  lirc  /dev/lirc*  && 
chmod  660   /dev/lirc*  &&
finish_install
} &> $C_FIFO
