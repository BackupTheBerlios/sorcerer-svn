cp  $SCRIPT_DIR/jed.rc lib   &&
JED_ROOT=/var/lib/jed        \
./configure  --build=$BUILD  \
             --prefix=/usr   &&
make                         &&
make  getmail		 &&
if    echo      "$OPTS"      |
      grep  -q  "\--with-x"
then  make  xjed
fi                           &&
prepare_install              &&
make    install
