make_install()  {

  chmod      0755   $(  find  $BUILD_DIR  -type d  )
  mkdir  -p             $MOD_DIR
  cp     -r  *.o  *.ko  $MOD_DIR
  cd                $BUILD_DIR/usr
  cp     -a  share            /usr

# We don't have ancient libpng installed on Sorcerer boxes.
# ldd fireglcontrol.qt3.gcc3.2 | grep not
#         libpng10.so.0 => not found

  cd         X11R6/bin
# mv         fireglcontrol.qt3.gcc3.2.bz2  \
#            fireglcontrol.bz2
# bunzip2    fireglcontrol.bz2
  rm  -f     fireglcontrol.*  LICENSE.*

  cd         $BUILD_DIR/usr
  cp     -a  X11R6     /usr
  true

}


LVER=$(  installed_version  $(  get_provider  linux  )  )

if    [  -z  "$LVER"  ]
then           LVER=$( uname -r )
fi

case  $LVER  in
  2.4)  MOD_DIR="/lib/modules/$LVER/kernel/drivers/video"       ;;
    *)  MOD_DIR="/lib/modules/$LVER/kernel/drivers/char/drm/"  ;;
esac


cd  lib/modules/fglrx/build_mod

chmod  0755  make.sh
sed  -i  "s:\`uname -r\`:\"$LVER\":"  make.sh

./make.sh        &&
prepare_install  &&
   make_install
