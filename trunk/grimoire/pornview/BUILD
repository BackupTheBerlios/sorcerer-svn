if    [  -d  pornview-$VERSION  ]
then  mv     pornview-$VERSION/*  .
fi

(

# pornview 0.1.0 gtk+,v1.2 version runs more stable
#              --with-gtk2           \

  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
