(

  if  !  $NVIDIA_AUDIO; then
    sed -i "s:SUBDIRS = nvnet nvaudio:SUBDIRS = nvnet:" \
    Makefile
  fi

  make             &&
  prepare_install  &&
  make    install  

) > $C_FIFO 2>&1
