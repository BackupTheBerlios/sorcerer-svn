#             --enable-bdb          \
#             --with-bdb-module=dynamic  \
#             --enable-dnssrv       \
#             --with-dnssrv-module=dynamic
# can build dynamic modules advantageous
# for binary based distros, but probably not sorcerer.

./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             --enable-shell        \
             --enable-dynamic      \
             --enable-modules=yes  \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install
