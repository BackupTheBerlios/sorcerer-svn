install_init()  {

  mkdir  -p  /devices

  cp         lib/uuid/libuuid.a  /usr/lib
  mkdir  -p                      /usr/include/uuid
  cp         lib/uuid/uuid.h     /usr/include/uuid

  [  -e                          /etc/init.d/mount.sh  ]  ||
  cp       $SCRIPT_DIR/mount.sh  /etc/init.d

  ln  -sf  /etc/init.d/mount.sh  /etc/rcS.d/S10mount
  ln  -sf  /etc/init.d/mount.sh  /etc/rc0.d/K90mount
  ln  -sf  /etc/init.d/mount.sh  /etc/rc6.d/K90mount

}


grep  -rl  "#include <linux/fd.h>"  *  |
while  read
do     sed  -i  "\,#include <linux/fd.h>,i#include <linux/compiler.h>"  $REPLY
done


./configure  --host=$BUILD        \
             --prefix=/usr        \
             --with-root-prefix=  \
             --enable-elf-shlibs  &&
make  "LDFLAGS=$LDFLAGS"          &&
prepare_install                   &&
make    install                   &&
make    install-libs              &&
        install_init
