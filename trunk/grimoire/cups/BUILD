fake_redhat()  {

  if    !  [  -d  /etc/rc.d  ]   &&
        !  [  -h  /etc/rc.d  ]
  then  ln  -s  . /etc/rc.d
  fi

}


if  spell_installed  Linux-PAM;  then  OPTS="$OPTS  --enable-pam";  fi
if  spell_installed  openssl;    then  OPTS="$OPTS  --enable-ssl";  fi


(

  ./configure  --bindir=/usr/bin     \
               --sbindir=/usr/sbin   \
               --datadir=/usr/share  \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               --libdir=/usr/lib     \
               --mandir=/usr/man     \
               $OPTS                 &&
  make                      &&
  prepare_install           &&
  fake_redhat               &&
  make    install           &&
  cd      drivers           &&
  cp     -R  usr/*  /usr    &&
  cp     -R  var/*  /var    &&
  cd         var/cups/conf  &&
  mkdir  -p  /etc/cups      &&
  cp     *   /etc/cups

) > $C_FIFO 2>&1
