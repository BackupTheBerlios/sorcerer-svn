(

  groupadd  thttpd             2>/dev/null
  useradd   thttpd  -g thttpd  2>/dev/null

  WD="WEBDIR=/usr/share/thttpd"
  CD="CGIBINDIR=/usr/share/thttpd/cgi-bin"
  WG="WEBGROUP=thttpd"

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make             $WD  $CD  $WG     &&
  prepare_install                    &&
  make    install  $WD  $CD  $WG

) > $C_FIFO 2>&1  &&  (

  if  !  [  -f     /etc/thttpd.conf  ]
  then  cp  $SCRIPT_DIR/thttpd.conf  \
                   /etc/thttpd.conf
  fi

  cp     $SCRIPT_DIR/thttpd    /etc/init.d

   if  $THTTPD_BOOT;  then
     ln  -sf  ../init.d/thttpd  /etc/rc0.d/K10thttpd
     ln  -sf  ../init.d/thttpd  /etc/rc1.d/K10thttpd
     ln  -sf  ../init.d/thttpd  /etc/rc2.d/K10thttpd
     ln  -sf  ../init.d/thttpd  /etc/rc6.d/K10thttpd

     ln  -sf  ../init.d/thttpd  /etc/rc3.d/S90thttpd
     ln  -sf  ../init.d/thttpd  /etc/rc4.d/S90thttpd
     ln  -sf  ../init.d/thttpd  /etc/rc5.d/S90thttpd
   fi

)
