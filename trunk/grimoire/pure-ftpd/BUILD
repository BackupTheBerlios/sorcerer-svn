install_conf()  {

  if    [  !  -f  /etc/ftplockout  ]
  then  cp  pam/ftplockout  /etc
  fi

  cp  $SCRIPT_DIR/pure-ftpd.sh  /etc/init.d

  if  $FTPD_BOOT;  then
    ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc0.d/K10pure-ftpd
    ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc1.d/K10pure-ftpd
    ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc2.d/K10pure-ftpd
    ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc6.d/K10pure-ftpd

    ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc3.d/S90pure-ftpd
    ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc4.d/S90pure-ftpd
    ln  -sf  ../init.d/pure-ftpd.sh  /etc/rc5.d/S90pure-ftpd
  fi

}


install_contrib()  {

  cp  -rv  contrib  /usr/share/pure-ftpd

}


if  spell_installed  Linux-PAM  ||
    spell_held       Linux-PAM
then  WITH_PAM="--with-pam"
fi


./configure  --sysconfdir=/etc     \
             --prefix=/usr         \
             --with-largefile      \
             --with-everything     \
             --without-banner      \
             --with-virtualchroot  \
             $WITH_PAM             \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install                    &&
        install_conf               &&
        install_contrib
