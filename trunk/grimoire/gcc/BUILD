(

  ENABLE_LANGS="--enable-languages=${GCC_LANGS[1]:=c++}"

  export  LIBCFLAGS="$CFLAGS"
  export  LIBCXXFLAGS="$CXXFLAGS"

  ./configure  --host=$BUILD               \
               --prefix=/usr/gcc-$VERSION  \
               --enable-threads            \
               --enable-shared             \
               --enable-__cxa_atexit       \
               $ENABLE_LANGS               &&
  make   -j 2  bootstrap-lean              &&
  prepare_install                          &&
  make    install

) > $C_FIFO 2>&1  &&  (

  remove_header()  {
    ls  /usr/lib/gcc-lib/*  |
    directories             |
    while  read  DIR
    do     rm  -f  /usr/lib/gcc-lib/$DIR/$VERSION/include/$1
    done
  }

  remove_header   curses.h
  remove_header  ncurses.h

  ln  -sf   /usr/gcc-$VERSION/bin/cpp   /lib/cpp
  ln  -sf   /usr/gcc-$VERSION/bin/gcc   /usr/gcc-$VERSION/bin/cc
  cp  -sfa  /usr/gcc-$VERSION/man/*     /usr/man/
  cp  -sfa  /usr/gcc-$VERSION/info/*    /usr/info/
  cp  -sfa  /usr/gcc-$VERSION/share/*   /usr/share/
  rm  -rf   /usr/bin/cc

  true

)
