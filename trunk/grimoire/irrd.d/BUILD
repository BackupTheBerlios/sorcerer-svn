finish_install()  {
  cp  src/programs/irrdcacher/irrdcacher     /usr/sbin
  cp  src/programs/irrdcacher/ripe2rpsl      /usr/sbin
  cp  src/programs/irrdcacher/update_source  /usr/sbin

  if    !  [  -f  /etc/irrd.conf  ]
  then  cp     samples/irrd.conf.sample  \
                  /etc/irrd.conf
  fi

  mkdir  -p        /usr/doc/irrd
  cp  irrd-user.*  /usr/doc/irrd

  mkdir  -p             /var/spool/irr_database
  chown  -R  irrd:irrd  /var/spool/irr_database

  [  -f  /etc/init.d/irrd.sh  ]  ||
  cp  $SCRIPT_DIR/irrd.sh  /etc/init.d/

  ln  -sf  ../init.d/irrd.sh  /etc/rc0.d/K50irrd
  ln  -sf  ../init.d/irrd.sh  /etc/rc6.d/K50irrd

  ln  -sf  ../init.d/irrd.sh  /etc/rc2.d/S40irrd
  ln  -sf  ../init.d/irrd.sh  /etc/rc3.d/S40irrd
  ln  -sf  ../init.d/irrd.sh  /etc/rc4.d/S40irrd
  ln  -sf  ../init.d/irrd.sh  /etc/rc5.d/S40irrd

}


groupadd  irrd           2>/dev/null
useradd   irrd  -g  irrd  2>/dev/null

unset  BUILD
cd  src                            &&
./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install                    &&
 finish_install
