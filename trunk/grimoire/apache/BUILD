export  SSL_BASE=SYSTEM
export  EAPI_MM=SYSTEM

APACHE_CONFIGURE=\
"./configure  --prefix=/usr                      \
              --sysconfdir=/etc/apache           \
              --localstatedir=/var/lib/apache    \
              --logfiledir=/var/log/apache       \
              --proxycachedir=/var/cache/apache  \
              --runtimedir=/var/run/apache       \
              --enable-module=most               \
              --enable-shared=max                \
              --enable-module=auth_db            \
              --enable-module=mmap_static        \
              --disable-module=auth_dbm          \
              --with-layout=GNU"

if  !  show_depends_of  apache  2>/dev/null  |
       grep  -q  -w  "openssl\|perl"
then

  activate_voyeur
  (

    patch  -p1  <  $SCRIPT_DIR/apache-1.3.x-db4.patch

    $APACHE_CONFIGURE  &&
    make               &&
    prepare_install    &&
    make    install

  ) > $C_FIFO 2>&1

else

  if    show_depends_of  apache  2>/dev/null  |
        grep  -q  -w  "openssl"
  then

    APACHE_CONFIGURE="$APACHE_CONFIGURE  --enable-module=ssl"

    cd  ${DIR[1]}
    ./configure  --with-apache=$BUILD_DIR  &&
    cd  ..                                 &&
    $APACHE_CONFIGURE                      &&

    if  $CERTIFICATE;  then
      make  certificate  TYPE="custom"  &&
      echo  "CERTIFICATE=false"  >>  $SPELL_CONFIG
    else
      make  certificate  TYPE="existing"  CRT=/etc/apache/ssl.crt/server.crt
    fi

  fi  &&

  if    show_depends_of  apache  2>/dev/null  |
        grep  -q  -w  "perl"
  then

    activate_voyeur
    (  patch  -p1  <  $SCRIPT_DIR/apache-1.3.x-db4.patch  &&
       cd   ${DIR[2]}                    &&
       perl  Makefile.PL  APACHE_SRC=..  \
                          USE_APACI=1    \
                          DO_HTTPD=1     \
                          EVERYTHING=1   \
                          PREP_HTTPD=1   &&
       make                              &&
       cd  ..                            &&
       $APACHE_CONFIGURE  --activate-module=src/modules/perl/libperl.a  &&
       make             &&
       prepare_install  &&
       make  install    &&
       cd  ${DIR[2]}    &&
       make  install
    ) > $C_FIFO 2>&1

  else

    activate_voyeur
    (  patch  -p1  <  $SCRIPT_DIR/apache-1.3.x-db4.patch  &&
       $APACHE_CONFIGURE  --acitvate-module=src/modules/perl/libperl.a
       make             &&
       prepare_install  &&
       make    install
    )

  fi

fi  &&

(

  if    show_depends_of  apache  2>/dev/null  |
        grep  -q  -w  "openssl"
  then  cp  $SCRIPT_DIR/apache-ssl.sh  /etc/init.d/apache.sh
  else  cp  $SCRIPT_DIR/apache.sh      /etc/init.d/apache.sh
  fi

  if  $APACHE_BOOT;  then
    ln  -sf  ../init.d/apache.sh  /etc/rc0.d/K10apache
    ln  -sf  ../init.d/apache.sh  /etc/rc1.d/K10apache
    ln  -sf  ../init.d/apache.sh  /etc/rc2.d/K10apache
    ln  -sf  ../init.d/apache.sh  /etc/rc6.d/K10apache

    ln  -sf  ../init.d/apache.sh  /etc/rc3.d/S90apache
    ln  -sf  ../init.d/apache.sh  /etc/rc4.d/S90apache
    ln  -sf  ../init.d/apache.sh  /etc/rc5.d/S90apache
  fi

)
