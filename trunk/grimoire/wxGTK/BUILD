case  $VERSION  in
  2.4.2)  patch  -p1  <  $SCRIPT_DIR/wxGTK-2.4.2.patch  ;;
esac

export  PATH="/opt/bison/1.35/bin:$PATH"

sed  -i  "s:##name##:##name:"  contrib/src/mmedia/sndcpcm.cpp

./configure --prefix=/usr            \
            --with-gtk               \
            --enable-zipstream       \
            $OPTS                    &&
make                                 &&
cd  contrib/src                      &&
( cd  canvas     &&  make )          &&
( cd  fl         &&  make )          &&
( cd  gizmos     &&  make )          &&
( cd  mmedia     &&  make )          &&
( cd  net        &&  make )          &&
( cd  ogl        &&  make )          &&
( cd  plot       &&  make )          &&
( cd  stc        &&  make )          &&
( cd  svg        &&  make )          &&
( cd  xrc        &&  make )          &&
cd  ../../                           &&
prepare_install                      &&
make    install                      &&
cd  contrib/src                      &&
( cd  canvas     &&  make  install ) &&
( cd  fl         &&  make  install ) &&
( cd  gizmos     &&  make  install ) &&
( cd  mmedia     &&  make  install ) &&
( cd  net        &&  make  install ) &&
( cd  ogl        &&  make  install ) &&
( cd  plot       &&  make  install ) &&
( cd  stc        &&  make  install ) &&
( cd  svg        &&  make  install ) &&
( cd  xrc        &&  make  install )
