./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install  datadir=/usr/share
