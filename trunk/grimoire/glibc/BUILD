(

  fix_glibc_install_log()  {

    FILE=$INSTALL_LOGS/glibc
    if    [  -f  $FILE  ]  &&
          !  grep  -q  -w  "/lib/ld-linux.so.2"      $FILE
    then  echo             "/lib/ld-linux.so.2"  >>  $FILE
    fi

  }

  fix_glibc_install_log

  case  $VERSION  in
    2.3.2)  patch  -p1  <  $SCRIPT_DIR/glibc-2.3.2-xdr_mem.c.patch
            patch  -p1  <  $SCRIPT_DIR/glibc-2.3.2.sscanf.patch
            ;;
  esac

  sed    -i  "s:tst-atime::"  libio/Makefile

# Uncomment the sed line below to retry glibc build 
# without the tst-leaks if you previously encounted
# [/usr/src/sorcery/glibc-2.3.2/build/localedata/tst-leaks.out] Error 139

# sed    -i  "s:tst-leaks tst-mbswcs6:tst-mbswcs6:"  localedata/Makefile


  LD_PRELOAD_OLD="$LD_PRELOAD"
  unset  LD_PRELOAD
  unset  LDFLAGS LTDL_LIBRARY_PATH LD_LIBRARY_PATH LD_RUN_PATH

#  export    CFLAGS="${CFLAGS/-O0/}"
#  export  CXXFLAGS="${CXXFLAGS/-O0/}"

#  export    CFLAGS="${CFLAGS/-O3/-O2}"
#  export  CXXFLAGS="${CXXFLAGS/-03/-O2}"

  export    CFLAGS="${CFLAGS/-O*/-O2}"
  export  CXXFLAGS="${CXXFLAGS/-O*/-O2}"

  export    CFLAGS="${CFLAGS/-fomit-frame-pointer/}"
  export  CXXFLAGS="${CXXFLAGS/-fomit-frame-pointer/}"

  export    CFLAGS="${CFLAGS/-ffast-math/}"
  export  CXXFLAGS="${CXXFLAGS/-ffast-math/}"


  echo  "$CFLAGS"  |
  grep  -q  "\-O"  ||
  export  CFLAGS="$CFLAGS -O2"
# export  CFLAGS="$CFLAGS -Os"

  echo  "$CXXFLAGS"  |
  grep  -q  "\-O"    ||
  export  CXXFLAGS="$CXXFLAGS -O2"
# export  CXXFLAGS="$CXXFLAGS -Os"

  grep  -q  -x  "/lib/ld-linux.so.2"      $INSTALL_LOGS/glibc  ||
  echo          "/lib/ld-linux.so.2"  >>  $INSTALL_LOGS/glibc

  unset  LANG  LC_CTYPE

  mkdir  build
  cd     build
# thread-local storage is available in newer 2.5.x kernels.
#              --with-tls                     \
  ../configure  --host=$BUILD                 \
               --build=$BUILD                 \
               --prefix=/usr                  \
               --enable-add-ons=linuxthreads  \
               --disable-profile              \
               --with-elf                     \
               --enable-shared                &&
  make                                        &&
  make    tests                               &&
  prepare_install                             &&
  export  LD_PRELOAD="$LD_PRELOAD_OLD"        &&
  make    install                             &&
  ldconfig                                    &&
  rm     -rf  $LIBRARY_CACHE/glibc

) > $C_FIFO 2>&1
