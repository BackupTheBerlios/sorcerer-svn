(

  sed  -i  "s:/sbin/rmmod nvidia:true:"     Makefile
  sed  -i  "s:/sbin/rmmod NVdriver:true:"   Makefile
  sed  -i  "s:/sbin/modprobe nvidia:true:"  Makefile

  if  spell_installed  linux;  then
    VERSION=`installed_version  linux`
    cp   Makefile  Makefile.old
    sed  "s/\$(shell uname -r)/$VERSION/"  Makefile.old  >  Makefile
  fi

  sed  -i  "s/: gcc-check/:/"  Makefile

  prepare_install              
  make    install  IGNORE_CC_MISMATCH=1

) > $C_FIFO 2>&1
