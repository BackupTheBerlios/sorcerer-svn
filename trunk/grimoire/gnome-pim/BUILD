patch  -p1  <  $SCRIPT_DIR/gnome-pim.patch
./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make                               &&
make  install
