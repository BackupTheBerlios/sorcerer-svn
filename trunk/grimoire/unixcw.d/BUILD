mkdir  qt
ln  -s /usr/include/qt  qt/include
ln  -s /usr/bin         qt/bin
ln  -s /usr/lib         qt/lib
export QTDIR=$PWD/qt

sed  -i  "s:-lqt:-lqt-mt:"  xcwcp/Makefile.in

./configure  --prefix=/usr          \
             --sysconfdir=/etc      \
             --localstatedir=/var   \
             $OPTS                  &&
make      all                       &&
make  install                       &&
ln  -sf  /usr/man/man1/xcwcp.1.gz   \
         /usr/man/man1/unixcw.1.gz  &&
cp  $SCRIPT_DIR/unixcw  /usr/bin
