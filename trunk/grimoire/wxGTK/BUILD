case  $VERSION  in
  2.4.2)  patch  -p1  <  $SCRIPT_DIR/wxGTK-2.4.2.patch  ;;
esac

export  PATH="/opt/bison/1.35/bin:$PATH"

sed  -i  "s:##name##:##name:"  contrib/src/mmedia/sndcpcm.cpp

./configure --prefix=/usr            \
            --with-gtk               \
            --enable-zipstream       \
 --enable-gtk2
            $OPTS                    &&
make                                 &&
cd  contrib && make                  &&
cd  ../                              &&
prepare_install                      &&
make    install                      &&
cd  contrib/src   && make  install

