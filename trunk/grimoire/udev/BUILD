sed  -i  "s:/local::"  Makefile
make  &&
make  install  &&
cp  -f   $SCRIPT_DIR/sysfsmount.sh  /etc/init.d/        &&
cp          extras/start_udev       /etc/init.d/        &&
ln  -fs  ../init.d/start_udev       /etc/rcS.d/S05udev  &&
ln  -fs  ../init.d/sysfsmount.sh    /etc/rcS.d/S00sysfsmount 
