(

  ./configure  --enable-so                            \
               --enable-ssl                           \
               --enable-modules=all                   \
               --enable-mods-shared=all               \
               --prefix=/usr/share/httpd              \
               --exec-prefix=/usr/share/httpd         \
               --bindir=/usr/bin                      \
               --sbindir=/usr/sbin                    \
               --libexecdir=/usr/share/httpd/modules  \
               --datadir=/usr/share/httpd             \
               --sysconfdir=/etc/httpd                \
               --sharedstatedir=/usr/share/httpd      \
               --localstatedir=/var/lib/httpd         \
               --libdir=/usr/lib                      \
               --includedir=/usr/include/httpd        \
               --infodir=/usr/info                    \
               --mandir=/usr/man                      \
               --enable-layout=GNU                    \
               --build=$BUILD                         \
               $OPTS                                  &&
  make                                                &&
  prepare_install                                     &&
  make    install

) > $C_FIFO 2>&1  &&

(

  mkdir  -p  /usr/share/httpd/logs
  mkdir  -p  /var/lib/httpd/run
  sedit  "s:/usr/bin:/usr/sbin:"           /usr/sbin/apachectl
  cp  $SCRIPT_DIR/apache.sh       /etc/init.d

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
