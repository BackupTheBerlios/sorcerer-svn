(

  if  !  grep  -q  privoxy:  /etc/group
    then  groupadd  privoxy
  fi

  if  !  grep  -q  privoxy:  /etc/passwd
    then useradd -g privoxy -s /bin/false -d /etc/privoxy \
       -c "privoxy" privoxy
  fi

  sed -i "s:/usr/local/etc/privoxy/config:/etc/privoxy/config:" \
    privoxy-generic.init

  autoheader
  autoconf

  ./configure  --prefix=/usr              \
               --sysconfdir=/etc/privoxy  \
               --localstatedir=/var       \
               $OPTS                      &&
  make                                        &&
  prepare_install                             &&
  make -s install USER=privoxy GROUP=privoxy  &&

  # replace the init script 
  cp  -f  $SCRIPT_DIR/privoxy.init            \
               /etc/init.d/privoxy            &&
   
  if  $PRIVOXY_BOOT;  then
    ln  -sf  ../init.d/privoxy  /etc/rc0.d/K20privoxy
    ln  -sf  ../init.d/privoxy  /etc/rc1.d/K20privoxy
    ln  -sf  ../init.d/privoxy  /etc/rc2.d/K20privoxy
    ln  -sf  ../init.d/privoxy  /etc/rc6.d/K20privoxy

    ln  -sf  ../init.d/privoxy  /etc/rc3.d/S95privoxy
    ln  -sf  ../init.d/privoxy  /etc/rc4.d/S95privoxy
    ln  -sf  ../init.d/privoxy  /etc/rc5.d/S95privoxy
  fi

) > $C_FIFO 2>&1
