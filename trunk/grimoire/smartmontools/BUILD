init_script()  {
# replace the redhatish init script ;)
  cp  -f  $SCRIPT_DIR/smartd.init  \
         /etc/init.d/smartd       
  ln  -sf   ../init.d/smartd  /etc/rcS.d/S30smartd
  ln  -sf   ../init.d/smartd  /etc/rc0.d/K70smartd
  ln  -sf   ../init.d/smartd  /etc/rc6.d/K70smartd
}
  
sed  -i  "s:-O2:${CFLAGS}:"  Makefile
sed  -i  "s:rc.d/::"         Makefile
  
make             &&
prepare_install  &&
make    install  &&
init_script
