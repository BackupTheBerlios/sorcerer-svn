if  $CUSTOM;  then
  ./Configure  -Dprefix=/usr -Dusethreads
fi

(

  if  !  $CUSTOM;  then
    ./Configure  -Dprefix=/usr -d -e -Dusethreads
  fi               &&
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1
