conf()  {

  if  !  grep  -q  "driver="  $SPELL_CONFIG;  then

  bzip2 -dc  $SCRIPT_DIR/lirc-setup.patch.bz2  |  patch  -p0
  ./setup.sh                                              &&
  cat configure.sh >>  $SPELL_CONFIG

  fi

}

mconf()  {

  cat  <<  EOF
alias char-major-61  lirc_driver
#options lirc_serial irq=4 io=0x3e8
EOF

}


remove_old_modules()  {

  LINUX_VER=$(  installed_version  $(  get_provider  linux  )  )
  rm  -rf  /lib/modules/$LINUX_VER/kernel/misc/*lirc*

}


(
  
  groupadd  lirc     2>/dev/null
  rm  -f    /dev/lirc*
  
  conf
  if     !   [  -f  configure.sh  ]
  then   cat  $SPELL_CONFIG  >> configure.sh
  fi

  sed -i 's:"$@":--prefix=/usr --sysconfdir=/etc:' configure.sh

  sed -i "s:-O2 -g:$CFLAGS:" configure
  sed -i "s:-O2 -g:$CFLAGS:" configure.in
  
  sh configure.sh                         &&
  make			                  &&
  prepare_install                         &&
  remove_old_modules                      &&
  make    install                         &&
  chgrp  lirc  /dev/lirc*                 && 
  chmod  660   /dev/lirc*                 &&
  cp  $SCRIPT_DIR/lircd.sh   /etc/init.d  &&
  message  "`cat  $SCRIPT_DIR/message.txt`"

) > $C_FIFO 2>&1  &&  (

  if  ! [  -f      /etc/modules.d/lirc  ]
  then  mkdir  -p  /etc/modules.d
  mconf   >    /etc/modules.d/lirc
  else  touch  /etc/modules.d/lirc
  fi

)
