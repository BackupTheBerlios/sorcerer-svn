(

  export    CFLAGS="$(  echo  $CFLAGS    |  sed  s/-ffast-math//  )"
  export  CXXFLAGS="$(  echo  $CXXFLAGS  |  sed  s/-ffast-math//  )"

  export  MOZILLA_OFFICIAL=1
  export  BUILD_OFFICIAL=1

  ./configure  --disable-tests              \
               --disable-debug              \
               --enable-optimize="$CFLAGS"  \
               --with-system-jpeg           \
               --with-system-zlib           \
               --with-system-png            \
               --with-system-mng            \
               --enable-crypto              \
               --enable-xinerama            &&
  make                                      &&
  prepare_install

) > $C_FIFO 2>&1  &&  (

  rm     -f                          /usr/lib/mozilla/component.reg
  mkdir  -p                          /usr/lib/mozilla
  cp     -rL  dist/bin/*             /usr/lib/mozilla
  mkdir  -p                          /usr/include/mozilla
  cp	 -rL  dist/include/*         /usr/include/mozilla
  cp  $SCRIPT_DIR/mozilla            /usr/bin
  mkdir  -p                          /usr/include/mozilla/nss
  cp     -rL  dist/public/security/* /usr/include/mozilla/nss
  export  MOZILLA_FIVE_HOME=/usr/lib/mozilla
  export    LD_LIBRARY_PATH=/usr/lib/mozilla:$LD_LIBRARY_PATH

         /usr/lib/mozilla/regxpcom
         /usr/lib/mozilla/regchrome
  touch  /usr/lib/mozilla/chrome/user-skins.rdf
  touch  /usr/lib/mozilla/chrome/user-locales.rdf

)
