case  ${VERSION}  in
  22.5.3.1)  patch  -p1  <  $(  guess_filename  ${SOURCE[1]}  )  ;;
esac

patch  -p1  <  $SCRIPT_DIR/lilo-22.5.9.patch

make  ROOT=      &&
prepare_install  &&
make  MAN_DIR=/usr/man  ROOT= install
