sed  -i  "s:src doc tools:src doc:"  Makefile.in

if  $CERTIFICATE;  then
  rm  -f  /etc/ssl/certs/stunnel.pem          &&
  ./configure  --build=$BUILD                 \
               --prefix=/usr                  \
               --sysconfdir=/etc              \
               --localstatedir=/var           \
               --with-pem-dir=/etc/ssl/certs  \
               $OPTS  &&
  cd  tools           &&
  make                &&
  cd  ..              &&
  (  make             &&
     prepare_install  &&
     make    install
  ) > $C_FIFO 2>&1
else
  (
    cp  /etc/ssl/certs/stunnel.pem  .            &&
    ./configure  --build=$BUILD                  \
                  --prefix=/usr                  \
                  --sysconfdir=/etc              \
                  --localstatedir=/var           \
                  --with-pem-dir=/etc/ssl/certs  \
                  $OPTS  &&
     make                &&
     prepare_install     &&
     make    install
  ) > $C_FIFO 2>&1
fi
