(

  #  Patch to get glibc 2.2.5 compiled  -Kyle
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
  unset   LD_PRELOAD                          &&
  make    localedata/install-locales

) > $C_FIFO 2>&1
