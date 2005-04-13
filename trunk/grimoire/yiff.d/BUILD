case  $VERSION  in
  2.14.2)  patch  -p1  <  $SCRIPT_DIR/yiff-2.14.2.patch  ;;
esac

CF="CFLAGS=$CFLAGS $(  gtk-config --cflags  )"

make    linux    "$CF"  &&
prepare_install  &&
make    install
