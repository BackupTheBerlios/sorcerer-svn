case  $VERSION  in
  4.3.5)  OPTS="$OPTS  --without-curl --without-imap"  ;;
  4.3.6)  OPTS="$OPTS  --without-curl --without-imap"  ;;
  4.3.7)  OPTS="$OPTS  --without-imap"  ;;
esac

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
--with-versioning             \
--with-gettext                \
--with-mod_charset            \
--with-layout=GNU             \
--with-zlib                   \
--with-bz2                    \
--enable-exif                 \
$OPTS"
#  --with-regex=system           \
#  --with-pcre-regex=/usr        \


case  $VERSION  in
  4.3.1)

    GLIBC_VER=$(  installed_version  glibc  )
    if    [  "$GLIBC_VER"  ==  "2.3.2"  ]
    then
      for  FILE  in  my_lib.c     my_malloc.c   my_realloc.c  \
                     my_delete.c  my_tempnam.c  my_error.c    \
                     my_getwd.c   safemalloc.c  my_once.c
      do   sed  -i  "1i#include \"errno.h\""  ext/mysql/libmysql/$FILE
      done
    fi    ;;

  4.3.2)  true  ;;
#    if    [   -f  /usr/include/httpd/pcreposix.h  ]
#    then  ln  -s  /usr/include/httpd/pcreposix.h  \
#                  main/regex.h
#    fi  ;;
    #  sed  -i  "s:#include <regex.h>:// #include <regex.h>:"  \
    #           main/php_regex.h  ;;
esac

./configure  $PHP_CONFIGURE  &&
make                         &&
prepare_install              &&
make    install              &&
if    !   [  -e         /etc/php.ini  ]
then  cp  php.ini-dist  /etc/php.ini
fi
