if    [  -f  $CONFIG_CACHE/$SPELL/makefile.unix  ]
then  cp     $CONFIG_CACHE/$SPELL/makefile.unix  .
fi

while  $EDIT_MAKEFILE;  do
  ${EDITOR:-nano}  makefile.unix
  if    query  "Repeat  edit"  n
  then  EDIT_MAKEFILE="true"
  else  EDIT_MAKEFILE="false"
  fi
done

(
  mkdir  -p          $CONFIG_CACHE/$SPELL
  cp  makefile.unix  $CONFIG_CACHE/$SPELL
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
