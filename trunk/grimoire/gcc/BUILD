finish_install()  {

  rm     -f                                /opt/gcc/current
  ln     -s    $VERSION                    /opt/gcc/current
  ln     -sf   /opt/gcc/$VERSION/bin/cpp   /lib/cpp
  ln     -sf   gcc                         /opt/gcc/$VERSION/bin/cc
  rm     -f                                /usr/bin/cc

  if    [   -h  /usr/info/dir  ]
  then  rm  -f  /usr/info/dir
  fi

  SEDIT="s:-L/usr/src/sorcery[^ ]*::g
         s:${VERSION//./\\.}:current:g"

  for  FILE  in  /opt/gcc/$VERSION/lib/lib*.la
  do   sed  -i  "$SEDIT"  $FILE
  done

  STRSTREAM=/opt/gcc/$VERSION/include/c++/$VERSION/backward/strstream

  if        [  -f             ${STRSTREAM}    ]  &&
        !   [  -f             ${STRSTREAM}.h  ]
  then  ln     -s  strstream  ${STRSTREAM}.h
  fi

  true

}


ENABLE_LANGS="--enable-languages=${GCC_LANGUAGES:=c++}"

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

case  $VERSION  in
    3.3)  patch  -p1  <  $SCRIPT_DIR/gcc-3.3.patch    ;;
  3.2.3)  patch  -p1  <  $SCRIPT_DIR/gcc-3.2.1.patch  ;;
  3.2.2)  patch  -p1  <  $SCRIPT_DIR/gcc-3.2.1.patch  ;;
  3.2.1)  patch  -p1  <  $SCRIPT_DIR/gcc-3.2.1.patch  ;;
  3.3.1)  patch  -p1  <  $SCRIPT_DIR/gcc-3.3.1.patch  ;;
  3.3.2)  patch  -p1  <  $SCRIPT_DIR/gcc-3.3.2.patch  ;;
esac

# 3.2.2 now supports the DESTDIR Makefile variable
# but isn't specifying a prefix good enough?

if    [  "$BRANCH"  ==  "ssp"  ]
then
  mv  protector.c  protector.h  gcc
  patch  -p0  <  protector.dif
  if    echo  "$OPTS"  |  grep  -q  "protectonly"
  then  patch  -p0  <  protectonly.dif
  fi
fi

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
