(

  sed  -i  "s:/sbin/rmmod nvidia:true:"     Makefile
  sed  -i  "s:/sbin/rmmod NVdriver:true:"   Makefile
  sed  -i  "s:/sbin/modprobe nvidia:true:"  Makefile
  sed  -i  "s:depmod -a:depmod -a -q -F /usr/src/linux/System.map:"  Makefile

  if  spell_installed  linux;  then
    VERSION=$(  installed_version  linux  )
    sed  -i  "s/\$(shell uname -r)/$VERSION/"  Makefile
  fi

  sed  -i  "s/: gcc-check/:/"  Makefile

  prepare_install              
  make    install  IGNORE_CC_MISMATCH=1

) > $C_FIFO 2>&1
