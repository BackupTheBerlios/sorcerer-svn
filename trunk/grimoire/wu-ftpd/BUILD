case  $VERSION  in
  2.6.2)  patch  -p0  <  $(  guess_filename  "${SOURCE[1]}"  )
          patch  -p0  <  $(  guess_filename  "${SOURCE[2]}"  )
          patch  -p1  <  $(  guess_filename  "${SOURCE[3]}"  )
          echo  "skeychallenge.patch applied."
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
