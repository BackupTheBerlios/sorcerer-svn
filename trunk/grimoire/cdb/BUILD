(

  echo  "gcc ${CFLAGS}"  >  conf-cc
  echo  "/usr/"          >  conf-home
  echo  "gcc"            >  conf-ld
 
  case  $VERSION  in
    0.75)  patch  -p0  <  $SCRIPT_DIR/cdb-0.75-errno.patch
  esac

  make              &&
  prepare_install   &&
  make setup check  
    
) > $C_FIFO 2>&1
