case  $VERSION  in
  2.2.1)  patch  -p1  <  $SCRIPT_DIR/fontconfig-2.2.1-freetype.patch  ;;
esac

./configure  --build=$BUILD            \
             --prefix=/opt/fontconfig  \
             --sysconfdir=/etc         \
             --localstatedir=/var      \
             $OPTS                     &&
make                                   &&
prepare_install                        &&
make    install

