(

  ./configure  --host=$BUILD        \
               --prefix=/usr        \
               --with-root-prefix=  \
               --enable-elf-shlibs  &&
  make                              &&
  prepare_install                   &&
  make    install                   &&
  make    install-libs

) > $C_FIFO 2>&1  &&  (

  mkdir  -p  /devices

  cp         lib/uuid/libuuid.a  /usr/lib
  mkdir  -p                      /usr/include/uuid
  cp         lib/uuid/uuid.h     /usr/include/uuid

  [  -e                          /etc/init.d/mount.sh  ]  ||
  cp       $SCRIPT_DIR/mount.sh  /etc/init.d

  ln  -sf  /etc/init.d/mount.sh  /etc/rcS.d/S10mount
  ln  -sf  /etc/init.d/mount.sh  /etc/rc0.d/K90mount
  ln  -sf  /etc/init.d/mount.sh  /etc/rc6.d/K90mount

)
