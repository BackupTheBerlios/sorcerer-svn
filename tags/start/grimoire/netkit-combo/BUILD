(

  bunzip2  -cd  $SCRIPT_DIR/netkit-combo-0.17.patch.bz2  |
  patch    -p1

  ./configure  --prefix=/usr  &&
  make                        &&
  prepare_install             &&
  make    install

) > $C_FIFO 2>&1  &&  (

  cd  netkit-base/etc.sample
  for   FILE  in  `ls`;  do
    if    [  !  -e  /etc/$FILE      ]  &&
          [  "$FILE"  !=  "README"  ]
    then  cp  $FILE  /etc            
    fi                   
  done


  [  -f  /etc/init.d/inetd.sh           ]  ||  cp  $SCRIPT_DIR/inetd.sh           /etc/init.d
  [  -f  /etc/init.d/rpc.bootparamd.sh  ]  ||  cp  $SCRIPT_DIR/rpc.bootparamd.sh  /etc/init.d
  [  -f  /etc/bootparams                ]  ||  cp  $SCRIPT_DIR/bootparams         /etc
  [  -f  /usr/man/man5/bootparams.5.gz  ]  ||  cp  $SCRIPT_DIR/bootparams.5.gz    /usr/man/man5


  if  $INETD_BOOT;  then
    ln  -sf  ../init.d/inetd.sh  /etc/rc0.d/K60inetd
    ln  -sf  ../init.d/inetd.sh  /etc/rc1.d/K60inetd
    ln  -sf  ../init.d/inetd.sh  /etc/rc2.d/K60inetd
    ln  -sf  ../init.d/inetd.sh  /etc/rc6.d/K60inetd

    ln  -sf  ../init.d/inetd.sh  /etc/rc3.d/S40inetd
    ln  -sf  ../init.d/inetd.sh  /etc/rc4.d/S40inetd
    ln  -sf  ../init.d/inetd.sh  /etc/rc5.d/S40inetd
  fi

  if  $BOOTPARAMD_BOOT;  then
    ln  -sf  ../init.d/rpc.bootparamd.sh  /etc/rc0.d/K60rpc.bootparamd
    ln  -sf  ../init.d/rpc.bootparamd.sh  /etc/rc1.d/K60rpc.bootparamd
    ln  -sf  ../init.d/rpc.bootparamd.sh  /etc/rc2.d/K60rpc.bootparamd
    ln  -sf  ../init.d/rpc.bootparamd.sh  /etc/rc6.d/K60rpc.bootparamd

    ln  -sf  ../init.d/rpc.bootparamd.sh  /etc/rc3.d/S40rpc.bootparamd
    ln  -sf  ../init.d/rpc.bootparamd.sh  /etc/rc4.d/S40rpc.bootparamd
    ln  -sf  ../init.d/rpc.bootparamd.sh  /etc/rc5.d/S40rpc.bootparamd
  fi

  groupadd  tty		2>/dev/null
  useradd   nobody	2>/dev/null
  true

)
