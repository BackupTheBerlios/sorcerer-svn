del_cached_glibc()  {

  smote_old_glibc()  {
    for  FILE  in  from/glibc*;  do
      if    [  -f         $FILE  ]
      then  basenames  <  $FILE  |
            xargs  -l256  rm  -f
      fi
      ldconfig
    done
  }

  ldconfig
  [  -d   ${LIBRARY_CACHE:=/usr/lib.old}       ]  &&
  cd      ${LIBRARY_CACHE}                        &&  smote_old_glibc
  [  -d   ${LIBRARY_CACHE_64:=/usr/lib64.old}  ]  &&
  cd      ${LIBRARY_CACHE_64}                     &&  smote_old_glibc
  true

}


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

case  $VERSION  in
  2.3.3)  GCC3_VER=$( installed_version  gcc-v3.3 )
          export  PATH="${PATH/gcc\/current/gcc/$GCC3_VER}"  ;;
esac

mkdir  build
cd     build
#             --with-selinux                \
#             --enable-add-ons=linuxthreads \
../configure  --host=$BUILD                 \
              --build=$BUILD                \
              --prefix=/usr                 \
              --disable-profile             \
              --with-tls                    \
              --with-elf                    \
              --without-gd                  \
              --without-cvs                 \
              --enable-shared               \
              --enable-add-ons              \
              $OPTS                         &&
make                                        &&
make    tests                               &&
prepare_install                             &&
make    install install_root=$INSTALL_ROOT  &&
cd   ../install                             &&
rm     -f   etc/{localtime,ld.so.*}         &&
export  LD_PRELOAD="$LD_PRELOAD_OLD"        &&
cp     -a   *  /                            &&
del_cached_glibc
