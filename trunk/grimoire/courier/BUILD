(

  ./configure  --prefix=/usr                     \
               --localstatedir=/var/lib/courier  \
               --sysconfdir=/etc/courier         \
               --disable-root-check              \
               $OPTS                             &&
  make             &&
  prepare_install  &&
  make    install  &&
  make    install-configure

) > $C_FIFO 2>&1 && (

  clns()  {
    ln  -sf  $1/$2  /etc/rc0.d/K10$2
    ln  -sf  $1/$2  /etc/rc1.d/K10$2
    ln  -sf  $1/$2  /etc/rc2.d/K10$2
    ln  -sf  $1/$2  /etc/rc6.d/K10$2

    ln  -sf  $1/$2  /etc/rc3.d/S90$2
    ln  -sf  $1/$2  /etc/rc4.d/S90$2
    ln  -sf  $1/$2  /etc/rc5.d/S90$2
  }

  cp    $SCRIPT_DIR/courier.sh  /etc/init.d
  clns  /etc/init.d courier.sh

  if    $IMAP_BOOT;   then  clns  /usr/sbin  imapd;      fi
  if    $IMAPS_BOOT;  then  clns  /usr/sbin  imapd-ssl;  fi
  if    $POP3_BOOT;   then  clns  /usr/sbin  pop3d;      fi
  if    $POP3S_BOOT;  then  clns  /usr/sbin  pop3d-ssl;  fi

)
