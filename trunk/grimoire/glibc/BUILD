(

  patch -p1  <  $SCRIPT_DIR/glibc-2.2.5.patch

  unset  LDFLAGS

  if    !  echo  "$CFLAGS"  |  grep  -q  "\-O"
  then  export     CFLAGS="$CFLAGS -Os"
  fi

  if    !  echo  "$CXXFLAGS"  |  grep  -q  "\-O"
  then  export     CXXFLAGS="$CFLAGS -Os"
  fi

  ./configure  --host=$BUILD                  \
               --build=$BUILD                 \
               --prefix=/usr                  \
               --enable-add-ons=linuxthreads  \
               --with-elf                     \
               --enable-shared                &&
  make                                        &&
  prepare_install                             &&
  make    install                             &&
  LD_PRELOAD_OLD="$LD_PRELOAD"                &&
  unset   LD_PRELOAD                          &&
  make    localedata/install-locales          &&
  export  LD_PRELOAD="$LD_PRELOAD_OLD"        &&
  touch   $(  find  /usr/lib/locale  )

) > $C_FIFO 2>&1
