(

  echo  "gcc ${CFLAGS}"  >  conf-cc
  echo  "gcc"            >  conf-ld
  echo  "/usr/"          >  conf-home

  case  $VERSION  in
    0.88)  patch  -p1  <  $SCRIPT_DIR/ucspi-tcp-0.88-errno.patch
  esac

  make             &&
  prepare_install  &&
  make setup check  
   
) > $C_FIFO 2>&1
