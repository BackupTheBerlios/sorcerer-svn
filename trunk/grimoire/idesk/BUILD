(

  CFLAGS="$CFLAGS  $(  fontconfig-config  --cflags  )"
  CFLAGS="$CFLAGS  $(  freetype-config    --cflags  )"

  patch  -p1  <  $SCRIPT_DIR/idesk-0.3.5.patch

  sed    -i   "s:-g -O2:$CFLAGS:"  Makefile

  make             &&
  prepare_install  &&
  install  -o root  -g root  -m 755  idesk  /usr/bin

) > $C_FIFO 2>&1
