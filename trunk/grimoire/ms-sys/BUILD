missing_include()  {
  patch  -p1  <  $SCRIPT_DIR/ms-sys-1.0.4-linux-2.6.patch
}
 
 
what_linux_ver()  {
  case  $(  installed_version  $(  get_provider linux-kernel  )  )  in
    2.6*)  missing_include  ;;
  esac
}


case  $VERSION  in
  1.0.2)  what_linux_ver  ;;
esac


sed  -i  "s:/usr/local:/usr:"                           Makefile
sed  -i  "s:EXTRA_CFLAGS =:EXTRA_CFLAGS = $CFLAGS:"     Makefile
sed  -i  "s?EXTRA_LDFLAGS =?EXTRA_LDFLAGS = $LDFLAGS?"  Makefile

make  &&
make  install
