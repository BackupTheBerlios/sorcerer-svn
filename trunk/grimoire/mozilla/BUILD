check_space()  {
  KILOBYTES=$(
    df    -Pkm  $SOURCE_DIR  |
    tr    -s ' '             |
    tail  -1                 |
    cut   -d ' '  -f4
  )
  if    ((  KILOBYTES < 1152  ));  then
    echo  "Insufficient disk space available for compiling mozilla."
    false
  fi
}


install_symlinks()  {

  rm  -rf                                   /usr/include/mozilla
  ln  -sf    /usr/include/mozilla-$VERSION  /usr/include/mozilla

  rm  -rf                                   /usr/lib/mozilla
  ln  -sf        /usr/lib/mozilla-$VERSION  /usr/lib/mozilla

  rm  -rf                                   /usr/share/idl/mozilla
  ln  -sf  /usr/share/idl/mozilla-$VERSION  /usr/share/idl/mozilla

}

IVERSION=$(  installed_version  $BSPELL  )


  # mozilla doesn't install nss headers by default
  # so we do it manually :^)
  install_security()  {
    NSS_DIR=/usr/include/mozilla-$VERSION/nss 
    mkdir  -p  $NSS_DIR
    for  dir  in  private  public;  do
      cp  -f  $BUILD_DIR/dist/${dir}/nss/*.h \
      $NSS_DIR
    done

  }
  
# already-running patch for running multiple
# instances of mozilla without -remote option.
bzip2  -cd  $SCRIPT_DIR/already-running.patch.bz2  |  patch -p1

export    CFLAGS="${CFLAGS/-ffast-math/}"
export  CXXFLAGS="${CXXFLAGS/-ffast-math/}"
export    CFLAGS="${CFLAGS/-fomit-frame-pointer/}"
export  CXXFLAGS="${CXXFLAGS/-fomit-frame-pointer/}"

export  MOZILLA_OFFICIAL=1
export  BUILD_OFFICIAL=1

# The following 2 lines stopped working with mozilla 1.4.1
# the source came without the internal libart library.
# export  MOZ_INTERNAL_LIBART_LGPL=1
# ac_add_options --enable-svg

cat  <<  EOF  >  .mozconfig
ac_add_options --prefix=/usr
ac_add_options --enable-shared
ac_add_options --disable-static
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
ac_add_options --enable-toolkit-gtk2
ac_add_options --enable-default-toolkit=gtk2
ac_add_options --enable-old-abi-compat-wrappers
ac_add_options --enable-xft
ac_add_options --disable-freetype2
ac_add_options --disable-gnomevfs
EOF

# mail/news support
if  ! $MAIL_NEWS;  then
  echo "ac_add_options --disable-mailnews" >> .mozconfig
fi   

# composer support
if  ! $COMPOSER;  then
  echo "ac_add_options --disable-composer" >> .mozconfig
fi

# chatzilla support
if  ! $CHATZILLA;  then
  echo 'ac_add_options --enable-extensions="default,-irc"' >> .mozconfig
fi  

check_space         &&
./configure  $OPTS  &&
make                &&
prepare_install     &&
make    install     &&
install_security    &&
install_symlinks
