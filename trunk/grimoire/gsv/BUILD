(

  unzip  -a  epstool     &&
  unzip  -a  src         &&
  unzip  -a  pstotext    &&
  cd  src                &&
  cp  gvx.mak  makefile  &&
  make                   &&
  prepare_install        &&
  make    install

) > $C_FIFO 2>&1
