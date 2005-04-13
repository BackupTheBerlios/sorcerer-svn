install_inits()  {
  [  -f  /etc/init.d/dhcpd.sh  ]  ||
  cp     $SCRIPT_DIR/dhcpd.sh  /etc/init.d

  [  -f  /etc/init.d/dhclient.sh  ]  ||
  cp     $SCRIPT_DIR/dhclient.sh  /etc/init.d

  true
}


case  $VERSION  in
  3.0.2)  patch  -p1  <  ${SOURCE_CACHE}/dhcp/3.0.2/${SOURCE[1]}  ;;
esac


sed  -i  "s/\/local//"  Makefile.conf
./configure      &&
make             &&
prepare_install  &&
make    install  &&
install_inits
