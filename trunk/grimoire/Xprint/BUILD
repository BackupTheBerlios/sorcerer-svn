(

  copy_file()  {
    local  SOURCE  DESTINATION  OVERWRITE
 
         SOURCE=$1
    DESTINATION=$2
      OVERWRITE=$3

    mkdir  -p  $(  dirname  $DESTINATION  )
    if    !  [  -e          $DESTINATION  ]  ||
             [  -n         "$OVERWRITE"   ]
    then  cp  -a  $SOURCE   $DESTINATION
    fi

  }


  install_files()  {
    cd  $BUILD_DIR/dest/

    copy_file  etc/init.d/xprint         /etc/init.d/xprint
    copy_file  etc/profile.d/xprint.csh  /etc/profile.d/xprint.csh
    copy_file  etc/profile.d/xprint.sh   /etc/profile.d/xprint.sh

    for  FILE  in  Xprt  xplsprinters    xphelloworld  \
                         xpawhelloworld  xpsimplehelloworld
    do  copy_file   usr/X11R6/bin/$FILE  \
                   /usr/X11R6/bin/$FILE  overwrite
    done

    rm     -rf      usr/X11R6/lib/X11/xserver/C/print/models/HPDJ1600C
    rm     -rf      usr/X11R6/lib/X11/xserver/C/print/models/HPLJ4family
    mkdir  -p      /usr/X11R6/lib/X11/xserver
    cp     -a       usr/X11R6/lib/X11/xserver/*  \
                   /usr/X11R6/lib/X11/xserver
    true
  }


  mkdir   dest
  cd      src/xprint_main/xc
  make    World                             &&
  prepare_install                           &&
  make    install  DESTDIR=$BUILD_DIR/dest  &&
  install_files

  if  $XPRINT_BOOT;  then
     
      ln  -sf  /etc/init.d/xprint  /etc/rc0.d/K10xprint
      ln  -sf  /etc/init.d/xprint  /etc/rc1.d/K10xprint
      ln  -sf  /etc/init.d/xprint  /etc/rc6.d/K10xprint
      ln  -sf  /etc/init.d/xprint  /etc/rc2.d/S99xprint
      ln  -sf  /etc/init.d/xprint  /etc/rc3.d/S99xprint
      ln  -sf  /etc/init.d/xprint  /etc/rc4.d/S99xprint
      ln  -sf  /etc/init.d/xprint  /etc/rc5.d/S99xprint
  fi

) > $C_FIFO 2>&1
