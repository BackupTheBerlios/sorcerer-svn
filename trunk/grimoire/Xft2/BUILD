(

  install_pc()  {
    mkdir    -p               /usr/lib/pkgconfig
    install  -m 0644  xft.pc  /usr/lib/pkgconfig
  }

  cd  Xft
  sedit  "s:-lXft:-Wl,-rpath,/opt/Xft2/lib -lXft:"  xft.pc.in
  ./configure  --build=$BUILD          \
               --prefix=/opt/Xft2      \
               --bindir=/usr/bin       \
               --libdir=/opt/Xft2/lib  \
               --includedir=/opt/Xft2/include  \
               --sysconfdir=/etc       \
               $OPTS  &&
  make                &&
  prepare_install     &&
  make    install     &&
          install_pc

) > $C_FIFO 2>&1
