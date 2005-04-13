install_init()  {

  cp  $SCRIPT_DIR/devfsd.sh     /etc/init.d
  ln  -sf  ../init.d/devfsd.sh  /etc/rc0.d/K85devfsd 
  ln  -sf  ../init.d/devfsd.sh  /etc/rc6.d/K85devfsd  
  ln  -sf  ../init.d/devfsd.sh  /etc/rcS.d/S15devfsd

}

sed  -i  "s:-O2:$CFLAGS:"  GNUmakefile
make             &&
prepare_install  &&
make    install  &&
        install_init
