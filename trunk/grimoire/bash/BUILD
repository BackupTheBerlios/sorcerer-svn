./configure  --build=$BUILD  \
             --prefix=/usr   \
             --bindir=/bin   \
             --with-installed-readline  \
             --with-curses   &&
make                         &&
prepare_install              &&
make    install              &&
ln     -sf  bash  /bin/sh
