./configure  --build=$BUILD \
             --prefix=/usr  \
             --libdir=/lib  &&
make  shared                &&
make  install               &&
install  -m 0644  -o root  -g root  $SCRIPT_DIR/inputrc  /etc
