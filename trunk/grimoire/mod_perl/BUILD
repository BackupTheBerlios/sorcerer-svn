(

  MPXS="MP_APXS=/usr/sbin/apxs"
  OMIZ="OPTIMIZE=$CFLAGS"

  perl    Makefile.PL  \
          "$MPXS"      &&
  make    "$OMIZ"      &&
  prepare_install      &&
  make    install

) > $C_FIFO 2>&1
