(

  case  $VERSION  in
    0.1.2)  export  CFLAGS="$CFLAGS      -I$PWD/src/support"
            export  CXXFLAGS="$CXXFLAGS  -I$PWD/src/support"  ;;
  esac

#              --with-gtk2 not supported in pornview 0.1.2?
#              --with-gtk2           \
  ./configure  --build=$BUILD        \
               --prefix=/usr         \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1
