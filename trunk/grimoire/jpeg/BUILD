(

  install_extra_headers()  {
    for  FILE  in  jinclude.h  jpegint.h
    do   install  -m 644  $FILE  /usr/include
    done
  }

  ./configure  --prefix=/usr    \
               --enable-shared  \
               --enable-static  &&
  make                          &&
  prepare_install               &&
  make    install               &&
          install_extra_headers

) > $C_FIFO 2>&1
