sed  -i  "/	cd libmysqld\/examples; \$(MAKE) link_sources/d"  Makefile.in
sed  -i  "s:examples::"                               libmysqld/Makefile.in

export  CXXFLAGS="$CXXFLAGS  -O3 -felide-constructors -fno-exceptions -fno-rtti -DHAVE_ERRNO_AS_DEFINE=1"
export    CFLAGS="$CFLAGS  -DHAVE_ERRNO_AS_DEFINE=1"

if    $CLIENT_ONLY
then  OPTS="$OPTS --without-server"
fi

groupadd  mysql             2>/dev/null
useradd   mysql  -g  mysql  2>/dev/null

sed  -i  "s:/libssl.a:/libssl.so:"  configure

./configure  --prefix=/usr                   \
             --without-bench                 \
             --enable-assembler              \
             --localstatedir=/var/lib/mysql  \
             --enable-shared                 \
             --with-mysqld-user=mysql        \
             --with-berkeley-db              \
             --with-openssl                  \
             --with-server-suffix='-Max'     \
             --with-mysqld-user=mysql        \
             --with-unix-socket-path=/var/lib/mysql/mysql.sock  \
             --with-extra-charsets=complex   \
             --with-vio                      \
             --with-innodb                   \
             --exec-prefix=/usr              \
             --libexecdir=/usr/sbin          \
             --sysconfdir=/etc               \
             --datadir=/usr/share            \
             --infodir=/usr/info             \
             --includedir=/usr/include       \
             --mandir=/usr/man               \
             --with-embedded-server          \
             --enable-thread-safe-client     \
             --with-comment="MySQL-MAX-$VERSION "  \
             $OPTS                          &&
make  pkglibdir=/usr/lib                    &&
prepare_install                             &&
make  install pkglibdir=/usr/lib  install   &&
 
if  ! $CLIENT_ONLY;  then
  mysql_install_db

  chown    -R  mysql.mysql                     /var/lib/mysql
  install  -m 755  support-files/mysql.server  /etc/init.d/
  if    !  [  -f  /etc/my.cnf  ]
  then  install   support-files/my-medium.cnf  /etc/my.cnf
  fi

  if  $MYSQL_BOOT;  then

    ln  -sf  /etc/init.d/mysql.server  /etc/rc0.d/K10mysql
    ln  -sf  /etc/init.d/mysql.server  /etc/rc1.d/K10mysql
    ln  -sf  /etc/init.d/mysql.server  /etc/rc6.d/K10mysql
    ln  -sf  /etc/init.d/mysql.server  /etc/rc2.d/S90mysql
    ln  -sf  /etc/init.d/mysql.server  /etc/rc3.d/S90mysql
    ln  -sf  /etc/init.d/mysql.server  /etc/rc4.d/S90mysql
    ln  -sf  /etc/init.d/mysql.server  /etc/rc5.d/S90mysql
  fi
fi
