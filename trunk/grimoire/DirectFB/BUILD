(

# DirectFB can have some sort of weird circular requirement with SDL.
# That is why --disable-sdl is put into the configure.

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --disable-avifile     \
               --disable-sdl         \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
