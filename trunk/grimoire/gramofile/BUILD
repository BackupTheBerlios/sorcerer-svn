( 

  patch  -p1  <  $SCRIPT_DIR/schewe1.patch   &&
  patch  -p4  <  $SCRIPT_DIR/pophal1.patch   &&
  patch  -p1  <  $SCRIPT_DIR/specht1.patch   &&
  patch  -p1  <  $SCRIPT_DIR/lemley1.patch   &&
  patch  -p1  <  $SCRIPT_DIR/tappin3a.patch  &&
  patch  -p1  <  $SCRIPT_DIR/tappin3b.patch  &&
  make                                       &&
  prepare_install                            &&
  install -m 755 -o root bplay_gramo  /usr/bin  &&
  install -m 755 -o root brec_gramo   /usr/bin  &&
  install -m 755 -o root gramofile    /usr/bin    

) > $C_FIFO 2>&1
