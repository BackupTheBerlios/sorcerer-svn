if    [  -z   "$BRANCH"  ]
then  echo
else
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --bindir=/usr/games   \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install
fi
