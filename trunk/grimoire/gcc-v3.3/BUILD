finish_install()  {

  ln     -sf   /opt/gcc/$VERSION/bin/cpp   /lib/cpp
  ln     -sf   gcc                         /opt/gcc/$VERSION/bin/cc
  rm     -f                                /usr/bin/cc

  if    [   -h  /usr/info/dir  ]
  then  rm  -f  /usr/info/dir
  fi

  SEDIT="s:-L/usr/src/sorcery[^ ]*::g"

  sed  -i  "$SEDIT"  /opt/gcc/$VERSION/lib/lib*.la  2>/dev/null

  STRSTREAM=/opt/gcc/$VERSION/include/c++/$VERSION/backward/strstream

  if        [  -f             ${STRSTREAM}    ]  &&
        !   [  -f             ${STRSTREAM}.h  ]
  then  ln     -s  strstream  ${STRSTREAM}.h
  fi

  true

}


ENABLE_LANGS="--enable-languages=c"

export    CFLAGS="${CFLAGS/-fomit-frame-pointer/}"
export  CXXFLAGS="${CXXFLAGS/-fomit-frame-pointer/}"
export  CCACHE_DISABLE=1

  LCF="LIBCFLAGS=$CFLAGS"
 LCXF="LIBCXXFLAGS=$CXXFLAGS"
   BF="BOOT_CFLAGS=$CFLAGS"
 LJCF="LIBGCJ_CFLAGS=$CFLAGS"
LJCXF="LIBGCJ_CXXFLAGS=$CXXFLAGS"
 LJJF="LIBGCJ_JAVAFLAGS=$CFLAGS"
  LDF="LDFLAGS=$LDFLAGS"

patch  -p1  <  $SCRIPT_DIR/gcc-3.3.2.patch

# 3.2.2 now supports the DESTDIR Makefile variable
# That variable is for packagers.

find  .  -name configure  |
xargs  -l64  sed  -i  "s:/bin/sh:/bin/bash:g"
export  CONFIG_SHELL=/bin/bash

./configure  --host=$BUILD               \
             --prefix=/opt/gcc/$VERSION  \
             --enable-threads=posix      \
             --enable-__cxa_atexit       \
             --enable-clocale=gnu        \
             --enable-shared             \
             --infodir=/usr/info         \
             --mandir=/usr/man           \
             --datadir=/usr/share        \
             "$ENABLE_LANGS"             &&
make         bootstrap-lean   "$BF"      \
             "$LCF"  "$LCXF"  "$LDF"     \
             "$LJCF" "$LJCXF"            &&
prepare_install                          &&
make    install                          &&
 finish_install
