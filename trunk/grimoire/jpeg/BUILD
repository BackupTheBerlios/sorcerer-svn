install_extra_headers()  {
  for  FILE  in  jinclude.h  jpegint.h
  do   install  -m 644  $FILE  /usr/include
  done
}

case  $MACHTYPE  in
  x86_64-pc-linux-gnu)
    sed  -i  '179i  | x86-* | x86_64-* \\'            config.sub
    sed  -i  's:i\[34567\]86):i\[34567\]86|x86_64):'  config.sub
  ;;
esac


./configure  --prefix=/usr    \
             --enable-shared  \
             --enable-static  &&
make                          &&
prepare_install               &&
make    install               &&
        install_extra_headers
