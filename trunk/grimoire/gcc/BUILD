(

  if    [  -f             $CONFIG_LOGS/DEFAULT/$VERSION/LANGUAGE  ]
  then  LANGUAGE=$(  cat  $CONFIG_LOGS/DEFAULT/$VERSION/LANGAUGE  )
  fi

  LANGUAGE="${LANGUAGE// /,}"
  ENABLE_LANGS="--enable-languages=${LANGUAGE:=c++}"

    LCF="LIBCFLAGS=$CFLAGS"
   LCXF="LIBCXXFLAGS=$CXXFLAGS"
     BF="BOOT_CFLAGS=$CFLAGS"
   LJCF="LIBGCJ_CFLAGS=$CFLAGS"
  LJCXF="LIBGCJ_CXXFLAGS=$CXXFLAGS"
   LJJF="LIBGCJ_JAVAFLAGS=$CFLAGS"
    LDF="LDFLAGS=$LDFLAGS"

  LD_PRELOAD_OLD="$LD_PRELOAD"
  unset  LD_PRELOAD

  patch  -p1  <  $SCRIPT_DIR/gcc-3.2.1.patch

  # 3.2.2 now supports the DESTDIR Makefile variable
  # but isn't specifying a prefix good enough?

  ./configure  --host=$BUILD               \
               --prefix=/opt/gcc/$VERSION  \
               --enable-threads=posix      \
               --enable-__cxa_atexit       \
               --enable-clocale=gnu        \
               --enable-shared             \
               "$ENABLE_LANGS"             &&
  make         bootstrap-lean   "$BF"      \
               "$LCF"  "$LCXF"  "$LDF"     \
               "$LJCF" "$LJCXF"            &&
  prepare_install                          &&
  export  LD_PRELOAD="$LD_PRELOAD_OLD"     &&
  make    install

) > $C_FIFO 2>&1  &&  (

  ln  -sf   /opt/gcc/$VERSION/bin/cpp   /lib/cpp
  ln  -sf   /opt/gcc/$VERSION/bin/gcc   /opt/gcc/$VERSION/bin/cc
  cp  -sfa  /opt/gcc/$VERSION/man/*     /usr/man/
  cp  -sfa  /opt/gcc/$VERSION/info/*    /usr/info/
  cp  -sfa  /opt/gcc/$VERSION/share/*   /usr/share/
  rm  -f    /usr/bin/cc

  # old .la, libtool archives, will point to other .la files 
  # that were in /opt/gcc/3.2.1

  mkdir  -p  /opt/gcc/3.2.1/
  rm     -r  /opt/gcc/3.2.1/lib     2>/dev/null
  ln     -s  /opt/gcc/$VERSION/lib  /opt/gcc/3.2.1/lib

  if    [   -h  /usr/info/dir  ]
  then  rm  -f  /usr/info/dir
  fi

  true

)
