sed  -i  "s:doc contrib:contrib:"      Makefile.in
sed  -i  "40iLIBS  = -lm"          src/Makefile.in

./configure  --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  &&
make             &&
prepare_install  &&
make    install  &&
  
if    [  !  -f                /etc/init.d/gpm.sh  ]
then  cp  $SCRIPT_DIR/gpm.sh  /etc/init.d                  
fi
