(

  aclocal                            &&
  automake     -af                   &&
  libtoolize   -f                    &&
  autoconf                           &&
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
  ln  -s  /usr/share/whiteBOX        \
          /usr/local/share/whiteBOX

) > $C_FIFO 2>&1
