case  $VERSION  in
  2.06)  patch  -p1  <  $SCRIPT_DIR/syslinux-2.06.patch  ;;
esac

make             &&
prepare_install  &&
make    install  &&
mkdir  -p     /var/lib/syslinux  &&
cp     *.bin  /var/lib/syslinux
