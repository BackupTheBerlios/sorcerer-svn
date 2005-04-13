sed  -i  "s:/usr/local/djbfft:/usr:"              conf-home
sed  -i  "s:-O1 -fomit-frame-pointer:${CFLAGS}:"  conf-cc

case  $VERSION  in
  0.76)  patch  -p0  <  $SCRIPT_DIR/djbfft-0.76-errno.patch	
esac

make                &&
prepare_install     &&
make  setup  check
