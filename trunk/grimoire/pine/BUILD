make_install()  {

  cd  bin
  cp  imapd   /usr/sbin
  cp  ipop2d  /usr/sbin
  cp  ipop3d  /usr/sbin
  cp  rpload  /usr/sbin
  cp  rpdump  /usr/sbin
  cp  mtest   /usr/bin
  cp  pico    /usr/bin
  cp  pilot   /usr/bin
  cp  pine    /usr/bin

  mkdir  -p  /usr/include/imap
  cp     -f  $BUILD_DIR/imap/src/c-client/*.h  \
             /usr/include/imap

  cp     -f  $BUILD_DIR/c-client/c-client.a  \
             /usr/lib/libc-client.a

  cd  $BUILD_DIR/doc

  for  MANPAGE  in  `ls  *.1`;  do
    gzip  -9  $MANPAGE
    cp  $MANPAGE.gz  /usr/man/man1
  done

  if  spell_installed  stunnel;  then
    ln  -sf  stunnel.pem  /etc/ssl/certs/imapd.pem
    ln  -sf  stunnel.pem  /etc/ssl/certs/ipop3d.pem
  fi

}

if  spell_installed  openssl;  then

  if    spell_installed  Linux-PAM
  then  ./build  DEBUG="$CFLAGS"  NOSSL=unix  SSLCERTS=/etc/ssl/certs  SSLINCLUDE=/usr/include/openssl  SSLLIB=/usr/lib  lnp
  else  ./build  DEBUG="$CFLAGS"  NOSSL=unix  SSLCERTS=/etc/ssl/certs  SSLINCLUDE=/usr/include/openssl  SSLLIB=/usr/lib  slx
  fi

else

  if    spell_installed  Linux-PAM
  then  ./build  DEBUG="$CFLAGS"  lnp
  else  ./build  DEBUG="$CFLAGS"  slx
  fi

fi               &&
prepare_install  &&
   make_install
