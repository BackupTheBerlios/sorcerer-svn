case  $VERSION  in
  1.6.0)  patch  -p1  <  $SCRIPT_DIR/alevt-1.6.0.patch  ;;
esac

USAM="/usr/share/applnk/Multimedia"

sed  -i  "s:usr/local:usr:"   Makefile
sed  -i  "s:-O2 -s:$CFLAGS:"  Makefile
make           &&
make  install  &&
mkdir  -p                      $USAM  &&
cp  $SCRIPT_DIR/AleVT.desktop  $USAM
