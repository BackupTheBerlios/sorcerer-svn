missing_include()  {
  patch  -p1  <  $SCRIPT_DIR/dump-0.4b36-linux-2.6.patch
}
   
   
what_linux_ver()  {
  case  $(  installed_version  $(  get_provider linux-kernel  )  )  in
    2.6*)  missing_include  ;;
  esac
}
  
  
case  $VERSION  in
  0.4b36)  what_linux_ver  ;;
esac


    CC="--with-cc=gcc $CFLAGS"
LDOPTS="--with-ldopts=$LDFLAGS"

# --disable-readline added for dump version 0.4b33
# because it complained that it required termcap.

./configure  --prefix=/usr       \
             --enable-largefile  \
             --enable-rmt        \
             --disable-readline  \
             "$CC"               \
             "$LDOPTS"           &&
make  &&
make  install
