(

  WD="--with-data-dir=/usr/share/tuxracer-data-$VERSION"

  ./configure  --prefix=/usr             \
               --bindir=/usr/games       \
               --disable-sdltest         \
               $WD                       \
               $OPTS                     &&
  make                                   &&
  prepare_install                        &&
  make    install                        &&
  chmod  -R a+r  tuxracer-data-$VERSION  &&
  cp     -r      tuxracer-data-$VERSION  /usr/share

) > $C_FIFO 2>&1
