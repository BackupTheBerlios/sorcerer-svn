(

  if    spell_installed  apache
  then  WITH_APACHE="--with-apxs2"
  fi

  ./configure  --prefix=/usr                 \
               --sysconfdir=/etc             \
               --with-config-file-path=/etc  \
               --with-gettext                \
               $WITH_APACHE                  \
               $OPTS                         &&
  make                                       &&
  prepare_install                            &&
  make    install                            &&
  if    !   [  -e         /etc/php.ini  ]
  then  cp  php.ini-dist  /etc/php.ini
  fi

) > $C_FIFO 2>&1
