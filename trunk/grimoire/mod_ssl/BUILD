export  SSL_BASE=SYSTEM
export  EAPI_MM=SYSTEM

APACHE_CONFIGURE=\
"./configure  --prefix=/usr
              --sysconfdir=/etc/httpsd
              --localstatedir=/var/lib/httpsd
              --logfiledir=/var/log/httpsd
              --proxycachedir=/var/cache/httpsd
              --runtimedir=/var/run/httpsd
              --datadir=/usr/share/httpsd
              --enable-module=ssl
              --enable-module=most
              --enable-shared=max
              --enable-module=auth_db
              --enable-module=mmap_static
              --disable-module=auth_dbm
              --with-layout=GNU"

if  $CERTIFICATE;  then
  ./configure  --with-apache=apache_$APACHE_VER  &&
  cd  apache_$APACHE_VER                         &&
  $APACHE_CONFIGURE                              &&
  make  certificate  TYPE="custom"               &&
  echo  "CERTIFICATE=false"  >>  $SPELL_CONFIG   &&
  activate_voyeur
  (  patch  -p1  <  $SCRIPT_DIR/apache-1.3.x-db4.patch  &&
     make                                               &&
     prepare_install                                    &&
     make    install
  ) > $C_FIFO 2>&1
else
  activate_voyeur
  (  ./configure  --with-apache=apache_$APACHE_VER      &&
     cd  apache_$APACHE_VER                             &&
     patch  -p1  <  $SCRIPT_DIR/apache-1.3.x-db4.patch  &&
     $APACHE_CONFIGURE                                  &&
     make  certificate  TYPE="existing"                 \
           CRT=/etc/httpsd/ssl.crt/server.crt           &&
     make                                               &&
     prepare_install                                    &&
     make    install
  ) > $C_FIFO 2>&1
fi  &&

(

  cp  $SCRIPT_DIR/mod_ssl.sh  /etc/init.d

  SOURCE="../init.d/mod_ssl.sh"
   START="S90mod_ssl"
    STOP="K10mod_ssl"

  if  $MODSSL_BOOT;  then
    ln  -sf  $SOURCE  /etc/rc0.d/$STOP
    ln  -sf  $SOURCE  /etc/rc1.d/$STOP
    ln  -sf  $SOURCE  /etc/rc2.d/$STOP
    ln  -sf  $SOURCE  /etc/rc6.d/$STOP

    ln  -sf  $SOURCE  /etc/rc3.d/$START
    ln  -sf  $SOURCE  /etc/rc4.d/$START
    ln  -sf  $SOURCE  /etc/rc5.d/$START
  fi

)
