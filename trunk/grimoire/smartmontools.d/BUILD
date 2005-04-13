init_script()  {
  cp  -f  $SCRIPT_DIR/smartd.init  \
          /etc/init.d/smartd       
  ln  -sf   ../init.d/smartd  /etc/rcS.d/S30smartd
  ln  -sf   ../init.d/smartd  /etc/rc0.d/K70smartd
  ln  -sf   ../init.d/smartd  /etc/rc6.d/K70smartd
}
  
default_build  &&
   init_script
