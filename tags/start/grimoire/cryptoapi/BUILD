no_export_symbol()  {
  cp  api/cryptoapi.c api/cryptoapi.c.old
  sed  "s/EXPORT_SYMBOL/\/\/ EXPORT_SYMBOL/"  \
      api/cryptoapi.c.old  >  api/cryptoapi.c
}

# no_export_symbol

  patch  -p1  <  $SCRIPT_DIR/cryptoapi.patch

(

  sedit  "s/-O2/$CFLAGS/"  configure

  ./configure  --prefix=/usr  &&
  make                        &&
  prepare_install             &&
  make    install             &&
  depmod

) > $C_FIFO 2>&1
