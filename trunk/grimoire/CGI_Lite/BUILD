(

  patch  -p1  <  $SCRIPT_DIR/CGI-Lite-2.0.patch
  perl  Makefile.PL  &&
  make               &&
  prepare_install    &&
  make    install

) > $C_FIFO 2>&1
