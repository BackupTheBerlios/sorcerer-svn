# uses expat or libxml2
#            --with-libxml2        \
./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             --with-expat          \
             --with-glib           \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install
