sed  -i  "s:doc contrib:contrib:"  Makefile.in

./configure  --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  &&
make             &&
prepare_install  &&
make    install  &&
  
if    [  !  -f                /etc/init.d/gpm.sh  ]
then  cp  $SCRIPT_DIR/gpm.sh  /etc/init.d                  
fi
