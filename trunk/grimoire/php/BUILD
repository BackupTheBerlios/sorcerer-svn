case  $VERSION  in
  4.3.5)  OPTS="$OPTS  --without-curl"  ;;
  4.3.6)  OPTS="$OPTS  --without-curl"  ;;
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
--with-regex=system           \
--with-pcre-regex=/usr        \
$OPTS"
#  --with-regex=system           \
#  --with-pcre-regex=/usr        \


./configure  $PHP_CONFIGURE  &&
make                         &&
prepare_install              &&
make    install              &&
if    !   [  -e         /etc/php.ini  ]
then  cp  php.ini-dist  /etc/php.ini
fi
