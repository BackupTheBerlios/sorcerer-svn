export  LDFLAGS="$LDFLAGS -lGL"

if    [  -e  $CONFIG_LOGS/$BSPELL/config.h  ]
then  cp     $CONFIG_LOGS/$BSPELL/config.h  .
fi

if    $DYM_MENU
then  patch Menu.C  $SCRIPT_DIR/Menu.C.diff
fi

./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             --enable-shared       \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install
