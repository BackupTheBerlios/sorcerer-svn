(

  patch  -p 1  <  $SCRIPT_DIR/tcp_wrappers_7.6.patch
  
  RDR="REAL_DAEMON_DIR=/usr/sbin"

  make  "$RDR"  linux           &&
  prepare_install               &&
  for  EXECUTABLE in *; do
    if    [  -x  $EXECUTABLE ]
    then  cp     $EXECUTABLE  /usr/sbin
    fi
  done                          &&
  cp  tcpd.h     /usr/include   &&
  cp  libwrap.a  /usr/lib       &&
  cp  *.3        /usr/man/man3  &&
  cp  *.5        /usr/man/man5  &&
  cp  *.8        /usr/man/man8 

) > $C_FIFO 2>&1
