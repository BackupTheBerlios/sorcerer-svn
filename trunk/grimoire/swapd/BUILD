install_conf()  {

  mkdir  -p         /swap
  chmod  700        /swap
  cp     $SCRIPT_DIR/swapd.sh  /etc/init.d
  ln  -sf  ../init.d/swapd.sh  /etc/rc0.d/K95swapd 
  ln  -sf  ../init.d/swapd.sh  /etc/rc6.d/K95swapd  
  ln  -sf  ../init.d/swapd.sh  /etc/rcS.d/S95swapd

}

sed  -i  "s:/usr/local/etc/:/etc/:"  config.h

./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make  "CFLAGS=$CFLAGS -I."         &&
prepare_install                    &&
make    install                    &&
        install_conf
