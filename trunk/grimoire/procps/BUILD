(

  sedit  "s|-O3|$CFLAGS|"  Makefile
  make                                  &&
  prepare_install                       &&
  mkdir  -p  /etc/X11/applnk/Utilities  &&
  make    install  -e  XSCPT=''  DESTDIR=

) > $C_FIFO 2>&1  &&  (

  mv  /usr/bin/kill /bin
  cp  $SCRIPT_DIR/sysctl.sh     /etc/init.d
  ln  -sf  ../init.d/sysctl.sh  /etc/rcS.d/S99sysctl

)
