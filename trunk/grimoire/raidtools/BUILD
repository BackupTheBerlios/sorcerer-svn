case  $VERSION  in
  1.00.3)  patch  -p1  <  $SCRIPT_DIR/raidtools-1.00.3.patch  ;;
esac

sed  -i  "s:-Wl,-Bstatic::"  Makefile.in
./configure  --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make  CFLAGS="${CFLAGS} -DMD_VERSION=\\\"${VERSION}\\\""  &&
make  install
