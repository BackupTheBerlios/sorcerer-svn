(

  install_pc()  {
    if    !  [   -d  /usr/lib/pkgconfig  ]
    then  mkdir  -p  /usr/lib/pkgconfig
    fi
    cp  -v       /opt/Xft2/lib/pkgconfig/xft.pc  \
                     /usr/lib/pkgconfig
  }

  cd  Xft
  ./configure  --build=$BUILD      \
               --prefix=/opt/Xft2  \
               --bindir=/usr/bin   \
               --sysconfdir=/etc   \
               $OPTS               &&
  make                             &&
  prepare_install                  &&
  make    install                  &&
          install_pc

) > $C_FIFO 2>&1
