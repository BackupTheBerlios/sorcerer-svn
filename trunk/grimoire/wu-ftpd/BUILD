case  $VERSION  in
  2.6.2)  SCX=1
          while  [  -n                         "${SOURCE[$SCX]}"  ];  do
            patch  -p0  <  $(  guess_filename  "${SOURCE[$SCX]}"  )
            ((  SCX++  ))
          done
          ;;
esac

export  PATH="/opt/bison/1.35/bin:$PATH"
./configure  --build=$BUILD        \
             --prefix=/usr         \
             --sysconfdir=/etc     \
             --localstatedir=/var  \
             --enable-chmod        \
             --enable-passwd       \
             --disable-daemon      \
             --enable-ls           \
             --disable-hidesetuid  \
             $OPTS                 &&
make                               &&
prepare_install                    &&
make    install
