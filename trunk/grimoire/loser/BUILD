case  $VERSION  in
  0.9.12)  patch  -p1  <  $SCRIPT_DIR/loser-0.9.12.patch  ;;
esac

./configure  --build=$BUILD         \
             --prefix=/usr          \
             --bindir=/usr/games    \
             --sysconfdir=/etc      \
             --localstatedir=/var   \
             $OPTS                  &&
make                                &&
prepare_install                     &&
make    install
