(

  case  $VERSION  in
    3.1.11)  sed  -i  "s://extern:extern:" proc/sysinfo.c  ;;
  esac

  make   -e        &&
  prepare_install  &&
  make    install  -e  XSCPT=''  DESTDIR=

) > $C_FIFO 2>&1  &&  (

  cp  $SCRIPT_DIR/sysctl.sh     /etc/init.d
  ln  -sf  ../init.d/sysctl.sh  /etc/rcS.d/S99sysctl

)
