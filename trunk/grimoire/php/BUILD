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
--with-zlib
$OPTS"



build_module()  {

  echo  "Building web server module:  $1"
  rm  -rf             apxs
  cp  -a  $BUILD_DIR  apxs
  cd                  apxs
  ./configure  $PHP_CONFIGURE  --with-$1  &&
  make

}


(

  if    spell_installed $( get_provider httpd   ); then build_module apxs2
  elif  spell_installed $( get_provider apapche ); then build_module apxs
  fi    &&

  cd           $BUILD_DIR      &&
  ./configure  $PHP_CONFIGURE  &&
  make                         &&
  prepare_install              &&
  make    install              &&

  if    [  -d  apxs  ]
  then  cd     apxs  2>/dev/null  &&  make  install
  fi
  
) > $C_FIFO 2>&1  &&  (

  if    !   [  -e         /etc/php.ini  ]
  then  cp  php.ini-dist  /etc/php.ini
  fi

)
