# cd  Xft
# rm  -f  /usr/X11R6/include/X11/Xft/XftFreetype.h
# rm  -f  /usr/X11R6/include/X11/Xft/Xft.h
# default_build


(

  install_pc()  {
    if    !  [   -d  /usr/lib/pkgconfig  ]
    then  mkdir  -p  /usr/lib/pkgconfig
    fi
    cp  -v       /opt/Xft/lib/pkgconfig/xft.pc  \
                     /usr/lib/pkgconfig
  }

  cd  Xft
  ./configure  --build=$BUILD        \
               --prefix=/opt/Xft     \
               --bindir=/usr/bin     \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install                    &&
          install_pc

) > $C_FIFO 2>&1

