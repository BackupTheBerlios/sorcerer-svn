(

  if    [  "$PREFIX"  ==  "/usr"  ]
  then  LIBDIR="--libdir/lib"
  fi

  ./configure  --build=$BUILD    \
               --prefix=$PREFIX  \
               $LIBDIR           &&
  make    shared                 &&
  prepare_install                &&
  make    install

) > $C_FIFO 2>&1
