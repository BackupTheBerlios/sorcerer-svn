sed  -i  "s:src doc tools:src doc:"  Makefile.in

./configure  --build=$BUILD                  \
							--prefix=/usr                  \
							--sysconfdir=/etc              \
							--localstatedir=/var           \
							--with-pem-dir=/etc/ssl/certs  \
							$OPTS  &&
 make                &&
 prepare_install     &&
 make    install
