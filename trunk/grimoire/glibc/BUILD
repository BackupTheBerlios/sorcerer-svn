make_locales()  {

  LD_PRELOAD_OLD="$LD_PRELOAD"
  unset   LD_PRELOAD
  rm      -rf  /usr/lib/locale
  mkdir   -p   /usr/lib/locale
  make    localedata/install-locales
  export  LD_PRELOAD="$LD_PRELOAD_OLD"
  touch   $(  find  /usr/lib/locale  )

}


(

  patch -p1  <  $SCRIPT_DIR/glibc-2.2.5.patch

  unset  LDFLAGS

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
               --with-elf                     \
               --enable-shared                &&
  make                                        &&
  prepare_install                             &&
  make    install                             &&
  make_locales

) > $C_FIFO 2>&1
