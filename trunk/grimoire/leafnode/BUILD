(

  groupadd  news            2>/dev/null
  useradd   news  -g  news  2>/dev/null

  ./configure  --build=$BUILD              \
               --prefix=/usr               \
               --sysconfdir=/etc/leafnode  \
               --localstatedir=/var        \
               $OPTS                       &&
  make                                     &&
  prepare_install                          &&
  make    install

) > $C_FIFO 2>&1  &&  (

  if    !      [  -f  /etc/leafnode/config  ];  then
    cp                /etc/leafnode/config.example  \
                      /etc/leafnode/config
    chown  news:news  /etc/leafnode/config
    chmod  -R  664    /etc/leafnode/config
  fi

)
