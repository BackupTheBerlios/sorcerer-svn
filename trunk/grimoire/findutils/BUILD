patch  -p 1  <  $SCRIPT_DIR/findutils-4.1.patch

WHERE="sysconfdir=/etc localstatedir=/var/cache libexecdir=/usr/bin"

./configure   --build=$BUILD  \
              --prefix=/usr   &&
make             $WHERE       &&
prepare_install               &&
make    install  $WHERE
