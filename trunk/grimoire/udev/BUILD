sed  -i  "s:/local::"  Makefile
make             &&
prepare_install  &&
make    install  
cp extras/start_udev /etc/init.d/ 
ln -fs ../init.d/start_udev /etc/rcS.d/S10udev 
