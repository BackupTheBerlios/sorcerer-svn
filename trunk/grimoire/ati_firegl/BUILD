make_install()  {

  chmod      0755   $(  find  $BUILD_DIR  -type d  )
  mkdir  -p         $MOD_DIR
  cp     -r  *.o    $MOD_DIR
  cd                $BUILD_DIR/usr
  cp     -a  share            /usr

  cd         X11R6/bin
  mv         fireglcontrol.qt3.gcc3.2.bz2  \
             fireglcontrol.bz2
  bunzip2    fireglcontrol.bz2
  rm         fireglcontrol.*  LICENSE.*

  cd         $BUILD_DIR/usr
  cp     -a  X11R6     /usr
  true

}


LINUX_VER=$(  installed_version  $(  get_provider  linux  )  )
  MOD_DIR="/lib/modules/$LINUX_VER/kernel/drivers/video"

cd  lib/modules/fglrx/build_mod
sed  -i  "s:\`uname -r\`:\"$LINUX_VER\":"  make.sh

bash  ./make.sh  &&
prepare_install  &&
   make_install
