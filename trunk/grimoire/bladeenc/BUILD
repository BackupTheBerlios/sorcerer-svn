case  $VERSION  in
  0.94.2)  patch  -p1  <  $SCRIPT_DIR/bladeenc-0.94.2.patch  ;;
esac

./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install
