missing_include()  {
  patch  -p1  <  $SCRIPT_DIR/dosfstools-2.10-linux-2.6.patch
}


what_linux_ver()  {
  case  $(  installed_version  $(  get_provider linux-kernel  )  )  in
    2.6*)  missing_include  ;;
  esac
}


case  $VERSION  in
  2.10)  what_linux_ver  ;;
esac


sed  -i  "s/-O2 -fomit-frame-pointer/$CFLAGS/"  Makefile
sed  -i  "1i#include <errno.h>"  mkdosfs/mkdosfs.c

MAKE_OPTS="PREFIX=/usr  MANDIR=/usr/man/man8"

make              $MAKE_OPTS  &&
prepare_install               &&
make    install   $MAKE_OPTS
