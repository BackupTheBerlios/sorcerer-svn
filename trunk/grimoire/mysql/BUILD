(

  export  CXXFLAGS="$CXXFLAGS  -O3 -felide-constructors -fno-exceptions -fno-rtti"

  if    $CLIENT_ONLY
  then  OPTS="$OPTS --without-server"
  fi

  groupadd  mysql             2>/dev/null
  useradd   mysql  -g  mysql  2>/dev/null

  LD_PRELOAD_OLD="$LD_PRELOAD"                    &&
  unset   LD_PRELOAD                              &&
  ./configure  --prefix=/usr                      \
               --without-bench                    \
               --enable-assembler                 \
               --with-mysqld-ldflags=-all-static  \
               --localstatedir=/var/lib/mysql     \
               $OPTS                              &&
  export  LD_PRELOAD="$LD_PRELOAD_OLD"            &&
  make             pkglibdir=/usr/lib             &&
  prepare_install                                 &&
  make    install  pkglibdir=/usr/lib  install    &&
  rm    -rf  /usr/mysql-test                      &&

  if  ! $CLIENT_ONLY;  then
    mysql_install_db
    chown  -R  mysql.mysql             /var/lib/mysql
    cp  /usr/share/mysql/mysql.server  /etc/init.d

    if  $MYSQL_BOOT;  then
      ln  -sf  ../init.d/mysql.server  /etc/rc0.d/K10mysql
      ln  -sf  ../init.d/mysql.server  /etc/rc6.d/K10mysql
      ln  -sf  ../init.d/mysql.server  /etc/rc3.d/S90mysql
      ln  -sf  ../init.d/mysql.server  /etc/rc4.d/S90mysql
      ln  -sf  ../init.d/mysql.server  /etc/rc5.d/S90mysql
    fi
  fi

) > $C_FIFO 2>&1
