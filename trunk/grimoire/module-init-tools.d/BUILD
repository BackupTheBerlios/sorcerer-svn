install_conf()  {
  cp     $SCRIPT_DIR/module-init-tools.sh     /etc/init.d
  ln  -sf  ../init.d/module-init-tools.sh     /etc/rcS.d/S20module-init-tools

  mkdir  -p  /etc/modules.d
  touch      /etc/modules  \
             /etc/modprobe.conf
}

sed  -i  "s:share/man/man:man/man:"  Makefile.in

case  $VERSION  in
  3.1)  touch *.5 *.8 ;;
esac

cd      modutils-$MUVERSION        &&
./configure  --build=$BUILD        &&
make                               &&
cd      ..                         &&
./configure  --build=$BUILD        \
             --prefix=/            \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make                               &&
prepare_install                    &&
cd      modutils-$MUVERSION        &&
make    install                    &&
cd      ..                         &&
make    moveold                    &&
make    install                    &&
        install_conf
