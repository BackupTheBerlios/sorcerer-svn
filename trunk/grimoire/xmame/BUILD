if    [  -f  $CONFIG_LOGS/$SPELL/makefile.unix  ]
then  cp     $CONFIG_LOGS/$SPELL/makefile.unix  .
else
  EDIT_MAKEFILE="true"
  while  $EDIT_MAKEFILE;  do
    ${EDITOR:-nano}  makefile.unix
    if    query  "Repeat  edit"  n
    then  EDIT_MAKEFILE="true"
    else  EDIT_MAKEFILE="false"
    fi
  done
fi

activate_voyeur
(
  mkdir  -p          $CONFIG_LOGS/$SPELL
  cp  makefile.unix  $CONFIG_LOGS/$SPELL

  patch  -p1  <  $SCRIPT_DIR/xmame.int.fix

  make  PREFIX=/usr           \
        BINDIR=/usr/games     \
        CFLAGS="$CFLAGS"      \
        CXXFLAGS="$CXXFLAGS"  \
        -f  makefile.unix     &&
  prepare_install             &&
  make  PREFIX=/usr           \
        BINDIR=/usr/games     \
        -f  makefile.unix     \
        install

) > $C_FIFO 2>&1
