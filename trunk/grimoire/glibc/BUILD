fix_glibc_install_log()  {
  GLIBC=$(  get_provider  glibc  )
  FILE=$INSTALL_LOGS/$GLIBC

  if    [  -f  $FILE  ]  &&
        !  grep  -qx  "/lib/ld-linux.so.2"      $FILE
  then  echo          "/lib/ld-linux.so.2"  >>  $FILE
  fi
}

fix_glibc_install_log

LD_PRELOAD_OLD="$LD_PRELOAD"
unset  LD_PRELOAD
unset  LDFLAGS LTDL_LIBRARY_PATH LD_LIBRARY_PATH LD_RUN_PATH

export    CFLAGS="${CFLAGS/-O?/-O2}"
export  CXXFLAGS="${CXXFLAGS/-O?/-O2}"

export    CFLAGS="${CFLAGS/-fomit-frame-pointer/}"
export  CXXFLAGS="${CXXFLAGS/-fomit-frame-pointer/}"

export    CFLAGS="${CFLAGS/-ffast-math/}"
export  CXXFLAGS="${CXXFLAGS/-ffast-math/}"


echo  "$CFLAGS"  |
grep  -q  "\-O"  ||
export  CFLAGS="$CFLAGS -O2"

echo  "$CXXFLAGS"  |
grep  -q  "\-O"    ||
export  CXXFLAGS="$CXXFLAGS -O2"

grep  -qx  "/lib/ld-linux.so.2"      $INSTALL_LOGS/glibc  ||
echo       "/lib/ld-linux.so.2"  >>  $INSTALL_LOGS/glibc


case  $VERSION  in
  2.3.3)  sed    -i      "s: \$(objpfx)tst-numeric.out::"  localedata/Makefile
          # patch  -p1  <  $SCRIPT_DIR/glibc-2.3.3-gcc-3.4.patch
          # grep   -rl     "\-fno-inline-functions" csu linuxthreads  |
          # xargs  -l64  \
          # sed    -i  "s:-fno-inline-functions:-fno-inline-functions -fno-unit-at-a-time:"
          ;;
esac

export  LANGUAGE=C
export    LC_ALL=C

            INSTALL_ROOT=$PWD/install
mkdir  -p  $INSTALL_ROOT/etc
touch      $INSTALL_ROOT/etc/ld.so.conf

echo  "$OPTS"  |
grep  -q   "\--enable-add-ons=nptl"  ||
OPTS="$OPTS  --enable-add-ons=linuxthreads"

GCC3_VER=$( installed_version  gcc-v3.3 )

export  PATH="${PATH/gcc\/current/gcc/$GCC3_VER}"

mkdir  build
cd     build
../configure  --host=$BUILD                 \
             --build=$BUILD                 \
             --prefix=/usr                  \
             --disable-profile              \
             --with-elf                     \
             --without-gd                   \
             --without-cvs                  \
             --enable-shared                \
             $OPTS                          &&
make                                        &&
make    tests                               &&
prepare_install                             &&
make    install install_root=$INSTALL_ROOT  &&
cd   ../install                             &&
rm     -f   etc/{localtime,ld.so.*}         &&
export  LD_PRELOAD="$LD_PRELOAD_OLD"        &&
cp     -a   *  /                            &&
ldconfig                                    &&
rm     -rf  $LIBRARY_CACHE/glibc*
