install_inits()  {
  [  -f  /etc/init.d/dhcpd.sh  ]  ||
  cp     $SCRIPT_DIR/dhcpd.sh  /etc/init.d

  [  -f  /etc/init.d/dhclient.sh  ]  ||
  cp     $SCRIPT_DIR/dhclient.sh  /etc/init.d

  true
}


sed  -i  "s/\/local//"  Makefile.conf
./configure    &&
make           &&
make  install  &&
install_inits
