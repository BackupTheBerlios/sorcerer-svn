( 

  rm  -f  $(  find . -name .depend )
  make             &&
  prepare_install  &&
  make    install

) > $C_FIFO 2>&1  &&  (

  mkdir  -p     /var/lib/syslinux
  cp     *.bin  /var/lib/syslinux

)
