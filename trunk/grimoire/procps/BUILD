(

  LD="-Wl,-warn-common"

  sed  -i  "s:-O2 -g3:$CFLAGS:
            s:$LD:$LD $LDFLAGS:"  Makefile
  make             &&
  prepare_install  &&
  make    install  -e  XSCPT=''  DESTDIR=

) > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIR/sysctl.sh     /etc/init.d
  ln  -sf  ../init.d/sysctl.sh  /etc/rcS.d/S99sysctl

)
