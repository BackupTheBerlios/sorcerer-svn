export  LDFLAGS="$LDFLAGS -lGL"

if    [  -e  $CONFIG_LOGS/$BSPELL/config.h  ]
then  cp     $CONFIG_LOGS/$BSPELL/config.h  .
fi

if    $DYM_MENU
then  patch Menu.C  $SCRIPT_DIR/Menu.C.diff
fi

sed  -i  "1i#ifndef FLTK_1_0_COMPAT
          1i#define FLTK_1_0_COMPAT
          1i#endif"  main.C

./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             --enable-shared       \
             $OPTS                 &&
make                               &&
make  install
