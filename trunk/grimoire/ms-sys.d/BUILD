case  $VERSION  in
  2.0.0)  patch  -p1  <  $SCRIPT_DIR/ms-sys-2.0.0-linux-2.6.patch  ;;
esac

sed  -i  "s:/usr/local:/usr:"                           Makefile
sed  -i  "s:EXTRA_CFLAGS =:EXTRA_CFLAGS = $CFLAGS:"     Makefile
sed  -i  "s?EXTRA_LDFLAGS =?EXTRA_LDFLAGS = $LDFLAGS?"  Makefile

make  &&
make  install
