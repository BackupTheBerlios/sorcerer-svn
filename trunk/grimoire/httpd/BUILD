(

remove_perl_module()  {

         LPM="modules/mod_perl.so"
  HTTPD_CONF="/etc/httpd/httpd.conf"
  HTTPD_CONF_TMP="/tmp/httpd.conf.$$.$RANDOM"

  if    grep      "mod_perl.so"  $HTTPD_CONF
  then  grep  -v  "mod_perl.so"  $HTTPD_CONF  >  $HTTPD_CONF_TMP
        cp      $HTTPD_CONF_TMP  $HTTPD_CONF
  fi

}


  sedit  "s:file.bdb, pathname:file.bdb, NULL, pathname:"  srclib/apr-util/dbm/apr_dbm_berkeleydb.c

  APACHE_CONFIGURE=\
"./configure  --enable-so                            \
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
              $OPTS"

  $APACHE_CONFIGURE  &&
  make               &&
  prepare_install    &&
  make    install    &&
  remove_perl_module

) > $C_FIFO 2>&1  &&

(

  mkdir  -p  /usr/share/httpd/logs
  mkdir  -p  /var/lib/httpd/run
  sedit  "s:/usr/bin:/usr/sbin:"  /usr/sbin/apachectl
  cp     $SCRIPT_DIR/httpd.sh     /etc/init.d

  if  $APACHE_BOOT;  then
    ln  -sf  ../init.d/httpd.sh  /etc/rc0.d/K10httpd
    ln  -sf  ../init.d/httpd.sh  /etc/rc1.d/K10httpd
    ln  -sf  ../init.d/httpd.sh  /etc/rc2.d/K10httpd
    ln  -sf  ../init.d/httpd.sh  /etc/rc6.d/K10httpd

    ln  -sf  ../init.d/httpd.sh  /etc/rc3.d/S90httpd
    ln  -sf  ../init.d/httpd.sh  /etc/rc4.d/S90httpd
    ln  -sf  ../init.d/httpd.sh  /etc/rc5.d/S90httpd
  fi

)
