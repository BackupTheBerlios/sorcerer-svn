(

  if    spell_installed  apache  ||
        spell_installed  $(  get_provider  apache  )
  then

    rm  -rf             /usr/src/php-$VERSION-apxs2
    cp  -a  $BUILD_DIR  /usr/src/php-$VERSION-apxs2
    cd                  /usr/src/php-$VERSION-apxs2

    ./configure  --prefix=/usr                 \
                 --sysconfdir=/etc             \
                 --with-config-file-path=/etc  \
                 --with-gettext                \
                 --with-apxs2                  \
                 $OPTS                         &&
    make                                       &&
    cd  $BUILD_DIR
  fi  &&

  ./configure  --prefix=/usr                 \
               --sysconfdir=/etc             \
               --with-config-file-path=/etc  \
               --with-gettext                \
               $WITH_APACHE                  \
               $OPTS                         &&
  make                                       &&
  prepare_install                            &&
  make    install                            &&
  if  [  -d  /usr/src/php-$VERSION-apxs2  ]
  then  cd   /usr/src/php-$VERSION-apxs2
        make   install                       &&
        cd     $BUILD_DIR                    &&
        rm  -rf  /usr/src/php-$VERSION-apxs2
  fi                                         &&

  if    !   [  -e         /etc/php.ini  ]
  then  cp  php.ini-dist  /etc/php.ini
  fi

) > $C_FIFO 2>&1
