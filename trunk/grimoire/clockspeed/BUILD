(

  echo  "gcc ${CFLAGS}"  >  conf-cc
  echo  "gcc"            >  conf-ld
  echo  "/usr/"          >  conf-home

  case  $VERSION  in
    0.62)  patch  -p1  <  $SCRIPT_DIR/clockspeed-0.62.patch
  esac

  make             &&
  prepare_install  &&
  make setup check  
   
) > $C_FIFO 2>&1
