( 


  if    [  "$PREFIX"  ==  "/usr"  ]
  then  SCD="/etc"
  else  SCD="$PREFIX/etc"
  fi

  export  PATH="$CANTRIP/opt/bison/1.35/bin:$PATH"

  ./configure  --build=$BUILD        \
               --prefix=$PREFIX      \
               --sysconfdir=$SCD     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
