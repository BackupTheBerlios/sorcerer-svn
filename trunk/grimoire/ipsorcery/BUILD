sed  -i  "s:-O2:$CFLAGS:g"  Makefile
make clean       &&
make gtk         &&
prepare_install  &&
install  magic  -m 755  /usr/bin/ipsorcery
