echo  "gcc ${CFLAGS}"  >  conf-cc
echo  "gcc"            >  conf-ld
echo  "/usr/"          >  conf-home

case  $VERSION  in
  0.90)  patch  -p1  <  $SCRIPT_DIR/checkpassword-0.90-errno.patch
esac

make             &&
prepare_install  &&
make setup check
