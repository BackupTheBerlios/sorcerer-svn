sed  -i  "s:-O:$CFLAGS:"  Makefile.in

./configure  --prefix=/usr         &&
make                               &&
make  install         prefix=/usr  &&
make  install-compat  prefix=/usr  &&
ln    -sf  libgdbm.so.2.0.0  /usr/lib/libndbm.so
