# DirectFB can have some sort of weird circular requirement with SDL.
# That is why --disable-sdl is put into the configure.

export  ac_cv_header_linux_wm97xx_h=no

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
