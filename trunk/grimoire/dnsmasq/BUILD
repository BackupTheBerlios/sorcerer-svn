(
  
  sed  -i  "s:local/::"        Makefile
  sed  -i  "s:-O2:${CFLAGS}:"  Makefile

  make             &&
  prepare_install  &&
  make    install  &&
  
  cp  $SCRIPT_DIR/dnsmasq.sh       /etc/init.d  &&

  if  $PRIVOXY_BOOT;  then
    ln  -sf  ../init.d/dnsmasq.sh  /etc/rc0.d/K50dnsmasq
    ln  -sf  ../init.d/dnsmasq.sh  /etc/rc1.d/K50dnsmasq
    ln  -sf  ../init.d/dnsmasq.sh  /etc/rc2.d/K50dnsmasq
    ln  -sf  ../init.d/dnsmasq.sh  /etc/rc6.d/K50dnsmasq
    
    ln  -sf  ../init.d/dnsmasq.sh  /etc/rc3.d/S35dnsmasq
    ln  -sf  ../init.d/dnsmasq.sh  /etc/rc4.d/S35dnsmasq
    ln  -sf  ../init.d/dnsmasq.sh  /etc/rc5.d/S35dnsmasq
  fi
  
) > $C_FIFO 2>&1  
