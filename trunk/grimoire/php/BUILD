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


build_apxs2()  {
    
  rm  -rf             $SOURCE_DIR/php-$VERSION-apxs2
  cp  -a  $BUILD_DIR  $SOURCE_DIR/php-$VERSION-apxs2
  cd                  $SOURCE_DIR/php-$VERSION-apxs2
  ./configure  $PHP_CONFIGURE  \
               --with-apxs2    &&
  make

}


build_apxs()  {

  rm  -rf             $SOURCE_DIR/php-$VERSION-apxs
  cp  -a  $BUILD_DIR  $SOURCE_DIR/php-$VERSION-apxs
  cd                  $SOURCE_DIR/php-$VERSION-apxs
  ./configure  $PHP_CONFIGURE  \
               --with-apxs     &&
  make

}


(

  APACHE_PROVIDER="$(  get_provider  apache  )"

  if    spell_installed  $APACHE_PROVIDER;  then
    case  $APACHE_PROVIDER  in
      apache)  build_apxs   ;;
       httpd)  build_apxs2  ;;
    esac
  fi  &&

  cd           $BUILD_DIR               &&
  ./configure  $PHP_CONFIGURE           &&
  make                                  &&
  prepare_install                       &&
  make    install                       &&
  if    [  -d  $SOURCE_DIR/php-$VERSION-apxs   ]
  then  cd     $SOURCE_DIR/php-$VERSION-apxs;    make   install
  elif  [  -d  $SOURCE_DIR/php-$VERSION-apxs2  ]
  then  cd     $SOURCE_DIR/php-$VERSION-apxs2;   make   install
  fi

  
) > $C_FIFO 2>&1  &&  (

  cd  $BUILD_DIR
  rm  -rf  $SOURCE_DIR/php-$VERSION-apxs  \
           $SOURCE_DIR/php-$VERSION-apxs2

  if    !   [  -e         /etc/php.ini  ]
  then  cp  php.ini-dist  /etc/php.ini
  fi

)
