(

  if  !  grep      "flags"  <  /proc/cpuinfo  |
         grep  -q  "mmx"
  then   patch  -p1  <  $SCRIPT_DIR/libdv-mmx.patch
  else   patch  -p1  <  $SCRIPT_DIR/libdv-no-mmx.patch
  fi

  ./configure --prefix=/usr  &&
  make                       &&
  prepare_install            &&
  make    install

) > $C_FIFO 2>&1
