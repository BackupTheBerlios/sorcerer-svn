if    [  -d  pornview-$VERSION  ]
then  mv     pornview-$VERSION/*  .
fi

(

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --with-gtk2           \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
