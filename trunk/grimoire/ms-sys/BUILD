sed  -i  "s:/usr/local:/usr:"                           Makefile
sed  -i  "s:EXTRA_CFLAGS =:EXTRA_CFLAGS = $CFLAGS:"     Makefile
sed  -i  "s?EXTRA_LDFLAGS =?EXTRA_LDFLAGS = $LDFLAGS?"  Makefile

make             &&
prepare_install  &&
make    install
