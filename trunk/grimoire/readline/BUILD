./configure  --build=$BUILD \
             --prefix=/usr  \
             --libdir=/lib  &&
make  shared                &&
make  install               &&
if    !  [   -d  /etc/inputrc ]
then  cp  $SCRIPT_DIR/inputrc  /etc
fi
