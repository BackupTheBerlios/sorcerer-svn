case  $VERSION  in
  4.2.1)  patch  -p1  <  $SCRIPT_DIR/sharutils-4.2.1-shar-bof.patch  ;;
esac

./configure  --prefix=/usr       \
             --with-gnu-gettext  &&
make                             &&
prepare_install                  &&
make    install
