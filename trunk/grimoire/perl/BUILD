if    echo  "$CFLAGS"  |  grep  -q  "march=i586"
then         SETARCH="-Darchname=i586-linux"
else  unset  SETARCH
fi

unset  LANG  LC_CTYPE

./Configure  -Dprefix=/usr -d -e -Dusethreads  $SETARCH
make  "OPTIMIZE=$CFLAGS"  &&
prepare_install           &&
make    install
