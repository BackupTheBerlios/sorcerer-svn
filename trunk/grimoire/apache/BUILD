(

  patch  -p1  <  $SCRIPT_DIR/apache-1.3.x-db4.patch

  ./configure  --prefix=/usr                      \
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
               --with-layout=GNU                  &&
  make                                            &&
  prepare_install                                 &&
  make    install

) > $C_FIFO 2>&1  &&

(

  cp  $SCRIPT_DIR/apache.sh  /etc/init.d

  case  $APACHE_BOOT  in
    y|Y|j|J)
      ln  -sf  ../init.d/apache.sh  /etc/rc0.d/K10apache
      ln  -sf  ../init.d/apache.sh  /etc/rc1.d/K10apache
      ln  -sf  ../init.d/apache.sh  /etc/rc2.d/K10apache
      ln  -sf  ../init.d/apache.sh  /etc/rc6.d/K10apache

      ln  -sf  ../init.d/apache.sh  /etc/rc3.d/S90apache
      ln  -sf  ../init.d/apache.sh  /etc/rc4.d/S90apache
      ln  -sf  ../init.d/apache.sh  /etc/rc5.d/S90apache
      ;;
          *)  true  ;;
  esac

)
