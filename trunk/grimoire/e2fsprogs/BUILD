(

  ./configure  --host=$BUILD        \
               --prefix=$PREFIX     \
               --with-root-prefix=  \
               --enable-elf-shlibs  &&
  make                              &&
  prepare_install                   &&
  make    install                   &&
  make    install-libs

) > $C_FIFO 2>&1  &&  (

  mkdir  -p  /devices
  mkdir  -p  $PREFIX/include/uuid
  cp  lib/uuid/libuuid.a  $PREFIX/lib
  cp  lib/uuid/uuid.h     $PREFIX/include/uuid

  cp      $SCRIPT_DIR/mount.sh  /etc/init.d
  ln  -sf /etc/init.d/mount.sh  /etc/rcS.d/S10mount
  ln  -sf /etc/init.d/mount.sh  /etc/rc0.d/K90mount
  ln  -sf /etc/init.d/mount.sh  /etc/rc6.d/K90mount

)
