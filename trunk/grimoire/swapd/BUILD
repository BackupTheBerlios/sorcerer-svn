(

  if    [  -f  /etc/swapd.conf  ]
  then  cp     /etc/swapd.conf  .
  else
    #  Keep at least 64MB of mem+swap available
    #  2 GB max swap on linux 2.4.20
    sed  -i  "s:memlimit 16384:memlimit 65536:"  swapd.conf
    sed  -i  "s:swapsize 4096:swapsize 65536:"  swapd.conf
    sed  -i  "s:pause 1000:pause 100:"           swapd.conf
  fi

  sed  -i  "s:/usr/local/etc/:/etc/:"  config.h

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make  "CFLAGS=$CFLAGS -I."         &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1  &&  (

  mkdir  -p         /swap
  chmod  700        /swap
  cp     $SCRIPT_DIR/swapd.sh  /etc/init.d
  ln  -sf  ../init.d/swapd.sh  /etc/rc0.d/K95swapd 
  ln  -sf  ../init.d/swapd.sh  /etc/rc6.d/K95swapd  
  ln  -sf  ../init.d/swapd.sh  /etc/rcS.d/S95swapd

)
