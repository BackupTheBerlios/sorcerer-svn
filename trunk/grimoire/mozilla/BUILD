(

  export    CFLAGS="${CFLAGS/-ffast-math/}"
  export  CXXFLAGS="${CXXFLAGS/-ffast-math/}"
  export    CFLAGS="${CFLAGS/-fomit-frame-pointer/}"
  export  CXXFLAGS="${CXXFLAGS/-fomit-frame-pointer/}"

  export  MOZILLA_OFFICIAL=1
  export  BUILD_OFFICIAL=1
  export  MOZ_INTERNAL_LIBART_LGPL=1

  cat  <<  EOF  >  .mozconfig
ac_add_options --prefix=/usr
ac_add_options --with-system-jpeg
ac_add_options --with-system-zlib
ac_add_options --with-system-png
ac_add_options --with-system-mng
ac_add_options --enable-crypto
ac_add_options --enable-xinerama
ac_add_options --disable-tests
ac_add_options --disable-debug
ac_add_options --enable-optimize="$CFLAGS"

ac_add_options --enable-reorder
ac_add_options --enable-strip
ac_add_options --enable-elf-dynstr-gc
ac_add_options --enable-cpp-rtti
ac_add_options --enable-xterm-updates
ac_add_options --enable-svg
ac_add_options --enable-toolkit-gtk2
ac_add_options --enable-default-toolkit=gtk2
ac_add_options --enable-old-abi-compat-wrappers

ac_add_options --enable-xft
ac_add_options --disable-freetype2
EOF

  ./configure  $OPTS  &&
  make                &&
  prepare_install     &&
  make    install

) > $C_FIFO 2>&1  &&  (

  rm  -rf                                   /usr/include/mozilla
  ln  -sf    /usr/include/mozilla-$VERSION  /usr/include/mozilla

  rm  -rf                                   /usr/lib/mozilla
  ln  -sf        /usr/lib/mozilla-$VERSION  /usr/lib/mozilla

  rm  -rf                                   /usr/share/idl/mozilla
  ln  -sf  /usr/share/idl/mozilla-$VERSION  /usr/share/idl/mozilla

)
