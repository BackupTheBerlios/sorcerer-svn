build_apxs2()  {

  rm  -rf             /usr/src/php-$VERSION-apxs2
  cp  -a  $BUILD_DIR  /usr/src/php-$VERSION-apxs2
  cd                  /usr/src/php-$VERSION-apxs2

  ./configure  --prefix=/usr                 \
               --sysconfdir=/etc             \
               --with-config-file-path=/etc  \
               --with-gettext                \
               --with-apxs2                  \
               $OPTS                         &&
  make

}


build_apxs()  {

  rm  -rf             /usr/src/php-$VERSION-apxs
  cp  -a  $BUILD_DIR  /usr/src/php-$VERSION-apxs
  cd                  /usr/src/php-$VERSION-apxs

  ./configure  --prefix=/usr                 \
               --sysconfdir=/etc             \
               --with-config-file-path=/etc  \
               --with-gettext                \
               --with-apxs                   \
               $OPTS                         &&
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

  cd  $BUILD_DIR                             &&
  ./configure  --prefix=/usr                 \
               --sysconfdir=/etc             \
               --with-config-file-path=/etc  \
               --with-gettext                \
               $WITH_APACHE                  \
               $OPTS                         &&
  make                                       &&
  prepare_install                            &&
  make    install                            &&
  if    [  -d  /usr/src/php-$VERSION-apxs  ];  then 
    cd   /usr/src/php-$VERSION-apxs
    make   install
  elif  [  -d  /usr/src/php-$VERSION-apxs2  ];  then 
    cd   /usr/src/php-$VERSION-apxs2
    make   install
  fi

) > $C_FIFO 2>&1  &&  (

  cd  $BUILD_DIR
  rm  -rf  /usr/src/php-$VERSION-apxs  /usr/src/php-$VERSION-apxs2

  if    !   [  -e         /etc/php.ini  ]
  then  cp  php.ini-dist  /etc/php.ini
  fi

)
