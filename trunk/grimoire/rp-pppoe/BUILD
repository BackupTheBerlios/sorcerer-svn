(

  sed  -i  "s/read a/a=0/"  scripts/adsl-setup.in
  cd  src
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  cd  ../gui                         &&
  make                               &&
  prepare_install                    &&
  make  install                      &&
  cd  ../src                         &&
  make  install

) > $C_FIFO 2>&1  &&  (

  mkdir  -p  /usr/share/applnk/Internet
  mkdir  -p  /usr/share/gnome/apps/Internet
  cp  $SCRIPT_DIR/tkpppoe.kdelnk   /usr/share/applnk/Internet
  cp  $SCRIPT_DIR/tkpppoe.desktop  /usr/share/gnome/apps/Internet

)
