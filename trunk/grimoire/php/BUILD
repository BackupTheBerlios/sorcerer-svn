PHP_CONFIGURE="\
--prefix=/usr                 \
--sysconfdir=/etc             \
--with-config-file-path=/etc  \
--disable-static              \
--disable-debug               \
--disable-rpath               \
--enable-inline-optimization  \
--enable-pic                  \
--enable-bcmath               \
--enable-magic-quotes         \
--enable-track-vars           \
--enable-safe-mode            \
--enable-sysvsem              \
--enable-sysvshm              \
--enable-force-cgi-redirect   \
--enable-trans-sid            \
--enable-yp                   \
--enable-ftp                  \
--enable-wddx                 \
--enable-filepro              \
--enable-dbase                \
--with-regex=system           \
--with-versioning             \
--with-gettext                \
--with-mod_charset            \
--with-layout=GNU             \
--with-zlib                   \
--with-bz2                    \
--enable-exif                 \
$OPTS"


(

  GLIBC_VER=$(  installed_version  glibc  )
  if    [  "$VERSION"    ==  "4.3.1"  ]  &&
        [  "$GLIBC_VER"  ==  "2.3.2"  ]
  then
    for  FILE  in  my_lib.c     my_malloc.c   my_realloc.c  \
                   my_delete.c  my_tempnam.c  my_error.c    \
                   my_getwd.c   safemalloc.c  my_once.c
    do   sed  -i  "1i#include \"errno.h\""  ext/mysql/libmysql/$FILE
    done
  fi

  ./configure  $PHP_CONFIGURE  &&
  make                         &&
  prepare_install              &&
  make    install
  
) > $C_FIFO 2>&1  &&  (

  if    !   [  -e         /etc/php.ini  ]
  then  cp  php.ini-dist  /etc/php.ini
  fi

)
