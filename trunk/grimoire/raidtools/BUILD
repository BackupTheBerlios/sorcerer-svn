missing_include()  {
  patch  -p1  <  $SCRIPT_DIR/raidtools-1.00.3-linux-2.6.patch
}
  
  
what_linux_ver()  {
  case  $(  installed_version  $(  get_provider linux-kernel  )  )  in
    2.6*)  missing_include  ;;
  esac
}
 
 
case  $VERSION  in
  1.00.3)  patch  -p1  <  $SCRIPT_DIR/raidtools-1.00.3.patch
           what_linux_ver  ;;
esac

sed  -i  "s:-Wl,-Bstatic::"  Makefile.in
./configure  --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make  CFLAGS="${CFLAGS} -DMD_VERSION=\\\"${VERSION}\\\""  &&
make  install
