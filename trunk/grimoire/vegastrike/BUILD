(

  aclocal
  automake  -a  --add-missing
  autoconf

  ./configure  --build=$BUILD       \
               --prefix=/usr        \
               --bindir=/usr/games  \
               --enable-boost-128   \
               $OPTS                &&
  make
  prepare_install                   &&
# make    install
  cp      src/vegastrike  /usr/games   &&
  mkdir  -p               /usr/share/vegastrike  &&
  cp     -a  data         /usr/share/vegastrike

) > $C_FIFO 2>&1
