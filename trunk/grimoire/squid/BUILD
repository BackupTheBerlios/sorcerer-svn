sed  -i  "s:\$(localstatedir)/logs/squid\.pid:/var/run/squid\.pid:"  \
         src/Makefile.in

./configure  --prefix=/usr                     \
             --sysconfdir=/etc/squid           \
             --localstatedir=/var/cache/squid  \
             --enable-async-io                 \
             --enable-snmp                     \
             --enable-linux-netfilter          \
             $OPTS                             &&
make                                           &&
make  install                                  &&
mkdir  -p                  /var/cache/squid    &&
chown  -R  nobody.nogroup  /var/cache/squid    &&
cp  $SCRIPT_DIR/squid.sh   /etc/init.d         &&

if  $SQUID_BOOT;  then
  ln  -sf  ../init.d/squid.sh  /etc/rc0.d/K25squid
  ln  -sf  ../init.d/squid.sh  /etc/rc1.d/K25squid
  ln  -sf  ../init.d/squid.sh  /etc/rc2.d/K25squid
  ln  -sf  ../init.d/squid.sh  /etc/rc6.d/K25squid

  ln  -sf  ../init.d/squid.sh  /etc/rc3.d/S90squid
  ln  -sf  ../init.d/squid.sh  /etc/rc4.d/S90squid
  ln  -sf  ../init.d/squid.sh  /etc/rc5.d/S90squid
fi
