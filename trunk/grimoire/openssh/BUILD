if    spell_installed  Linux-PAM  ||
      spell_installed  $(  get_provider  Linux-PAM  )
then  WITH_PAM="--with-pam"
fi

(

  ./configure  --prefix=/usr          \
               --sysconfdir=/etc/ssh  \
               --with-md5-passwords   \
               $WITH_PAM              \
               $OPTS                  &&
  make                                &&
  prepare_install                     &&
  make    install

) > $C_FIFO 2>&1
