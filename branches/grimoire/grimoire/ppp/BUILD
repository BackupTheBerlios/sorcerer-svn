default_build  &&
( 

  mkdir  -p  /etc/ppp/peers
  mkdir  -p  /etc/ppp/chat

  ln  -f  /etc/ppp/resolv.conf /etc/resolv.conf

  cp  $SCRIPT_DIR/pon   /usr/bin
  cp  $SCRIPT_DIR/poff  /usr/bin

  if  !  [  -f               /etc/ppp/options  ];  then
    cp  $SCRIPT_DIR/options  /etc/ppp/options
  fi

  if  [  !  -e                 /etc/ppp/peers/isp  ];  then
    cp  $SCRIPT_DIR/peers.isp  /etc/ppp/peers/isp
  fi

  if  [  !  -e           /etc/ppp/chat/isp  ];  then
    cp  $SCRIPT_DIR/isp  /etc/ppp/chat/isp
  fi


  cat  $SCRIPT_DIR/message

  chown  root:ppp     /usr/sbin/pppd
  chmod  4750         /usr/sbin/pppd
  chown  -R root:ppp  /etc/ppp
  chmod  600          /etc/ppp/*-secrets

)
