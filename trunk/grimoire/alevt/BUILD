(

  case  $VERSION  in
    1.6.0)  patch  -p1  <  $SCRIPT_DIR/alevt-1.6.0.patch  ;;
  esac

  sed  -i  "s:usr/local:usr:"   Makefile
  sed  -i  "s:-O2 -s:$CFLAGS:"  Makefile
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1  &&  (

  mkdir  -p                      /usr/share/applnk/Multimedia
  cp  $SCRIPT_DIR/AleVT.desktop  /usr/share/applnk/Multimedia

)

