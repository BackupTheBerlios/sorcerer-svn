if    [  -z  "$BRANCH"  ]
then  echo  "Enlightenment theme profile installed."
else
  ./configure  --prefix=/usr      \
               --sysconfdir=/etc  \
               --enable-fsstd     &&
  make                            &&
  prepare_install                 &&
  make    install
fi
