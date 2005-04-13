install_init()  {


  cp  $SCRIPT_DIR/portmap.sh     /etc/init.d

  if  $PORTMAP_BOOT;  then
    ln  -sf  ../init.d/portmap.sh  /etc/rc0.d/K70portmap
    ln  -sf  ../init.d/portmap.sh  /etc/rc1.d/K70portmap
    ln  -sf  ../init.d/portmap.sh  /etc/rc2.d/K70portmap
    ln  -sf  ../init.d/portmap.sh  /etc/rc6.d/K70portmap

    ln  -sf  ../init.d/portmap.sh  /etc/rc3.d/S30portmap
    ln  -sf  ../init.d/portmap.sh  /etc/rc4.d/S30portmap
    ln  -sf  ../init.d/portmap.sh  /etc/rc5.d/S30portmap
  fi

}

# fix problems with glibc-2.3.2
patch -p1 < $SCRIPT_DIR/portmap_5beta.patch

make  WRAP_DIR=/usr/lib  &&
prepare_install          &&
cp  portmap    /sbin     &&
cp  pmap_dump  /sbin     &&
cp  pmap_set   /sbin     &&
install_init
