(

  install_inits()  {
    [  -f  /etc/init.d/dhcp.sh  ]  ||
    cp     $SCRIPT_DIR/dhcp.sh  /etc/init.d

    [  -f  /etc/init.d/dhclient.sh  ]  ||
    cp     $SCRIPT_DIR/dhclient.sh  /etc/init.d

    true
  }


  sed  -i  "s/\/local//"  Makefile.conf
  ./configure      &&
  make             &&
  prepare_install  &&
  make    install  &&
  install_inits

) > $C_FIFO 2>&1
