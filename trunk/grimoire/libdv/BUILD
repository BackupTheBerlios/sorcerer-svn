if  !  grep      "flags"  <  /proc/cpuinfo  |
       grep  -q  "mmx"
then   patch  -p1  <  $SCRIPT_DIR/libdv-mmx.patch
else   patch  -p1  <  $SCRIPT_DIR/libdv-no-mmx.patch
fi

#            --disable-xv       \
#            --disable-gtk  \
#            --disable-gtktest  \

./configure  --prefix=/usr  \
             --enable-sdl   &&
make                        &&
make  install
