UBM="/usr/bin/mail"
UBMX=${UBM}x

./configure  --build=$BUILD         \
             --prefix=/usr          \
             --sysconfdir=/etc      \
             --localstatedir=/var   \
             $OPTS                  &&
make                                &&
prepare_install                     &&
rm     -f  $UBM  $UBMX              &&
make    install                     &&
ln     -s  mail  $UBMX
