if    [  -z   "$BRANCH"  ]
then  echo  >  $C_FIFO
else
(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --bindir=/usr/games   \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
fi
