(

  patch -p1  <  $SCRIPT_DIR/glibc-2.3.patch

  LD_PRELOAD_OLD="$LD_PRELOAD"
  unset  LD_PRELOAD
  unset  LDFLAGS LTDL_LIBRARY_PATH LD_LIBRARY_PATH LD_RUN_PATH

  export    CFLAGS="${CFLAGS/-O0/}"
  export  CXXFLAGS="${CXXFLAGS/-O0/}"

  echo  "$CFLAGS"  |
  grep  -q  "\-O"  ||
  export  CFLAGS="$CFLAGS -Os"

  echo  "$CXXFLAGS"  |
  grep  -q  "\-O"    ||
  export  CXXFLAGS="$CXXFLAGS -Os"
  ./configure  --host=$BUILD                  \
               --build=$BUILD                 \
               --prefix=/usr                  \
               --enable-add-ons=linuxthreads  \
               --disable-profile              \
               --with-elf                     \
               --enable-kernel=2.4.11         \
               --enable-shared                &&
  make                                        &&
  prepare_install                             &&
  export  LD_PRELOAD="$LD_PRELOAD_OLD"        &&
  make    install                             &&
  LD="ld-${VERSION}.so"                       &&
  ln     -sf  $LD  /lib/ld-linux.so.2         &&
  ldconfig

) > $C_FIFO 2>&1
