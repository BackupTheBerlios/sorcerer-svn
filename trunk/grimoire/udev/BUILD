sed  -i  "s:/local::"  Makefile
make             &&
prepare_install  &&
make    install  
cp extras/start_udev /etc/init.d/ 
ln -fs ../init.d/start_udev /etc/rcS.d/S05udev 

cp -f  $SCRIPT_DIR/sysfsmount.sh /etc/init.d/
ln -fs ../init.d/sysfsmount.sh /etc/rcS.d/S00sysfsmount 