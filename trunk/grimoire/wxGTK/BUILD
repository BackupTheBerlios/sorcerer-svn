(

  export  PATH="/opt/bison/1.35/bin:$PATH"

  ./configure --prefix=/usr            \
              --with-gtk               \
              --enable-zipstream       \
              $OPTS                    &&
  make                                 &&
  cd  contrib/src           	       &&
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

) > $C_FIFO 2>&1
