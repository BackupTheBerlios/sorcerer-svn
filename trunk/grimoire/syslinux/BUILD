case  $VERSION  in
  2.06)  patch  -p1  <  $SCRIPT_DIR/syslinux-2.06.patch  ;;
  2.07)  patch  -p1  <  $SCRIPT_DIR/syslinux-2.06.patch  ;;
  2.08)  patch  -p1  <  $SCRIPT_DIR/syslinux-2.06.patch  ;;
  2.09)  patch  -p1  <  $SCRIPT_DIR/syslinux-2.06.patch  ;;
  2.10)  patch  -p1  <  $SCRIPT_DIR/syslinux-2.06.patch  ;;
  2.11)  patch  -p1  <  $SCRIPT_DIR/syslinux-2.06.patch  ;;
  2.13)  patch  -p1  <  $SCRIPT_DIR/syslinux-2.06.patch  ;;
  3.00)  patch  -p1  <  $SCRIPT_DIR/syslinux-3.00.patch  ;;
esac

if    spell_installed  gcc,ssp;  then
  FFP="-fomit-frame-pointer"
  FSP="-fno-stack-protector"
  sed  -i  "s:$FFP:$FFP $FSP:"          Makefile
  sed  -i  "s:$FFP:$FFP $FSP:"   sample/Makefile
  sed  -i  "s:$FFP:$FFP $FSP:"  memdisk/Makefile
fi

make             &&
prepare_install  &&
make    install  &&
mkdir  -p     /var/lib/syslinux  &&
cp     *.bin  /var/lib/syslinux
