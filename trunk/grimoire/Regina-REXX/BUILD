fix_init_location()  {
  sed  -i  "s:rc.d/::"  Makefile
}

./configure  --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
fix_init_location                  &&
make                               &&
make  install                      &&

# replace the redhatish init script ;)  
cp  -f  $SCRIPT_DIR/rxstack.init   \
        /etc/init.d/rxstack
