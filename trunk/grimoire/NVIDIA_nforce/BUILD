(

  if  !  $NVIDIA_AUDIO; then
    sed -i "s:SUBDIRS = nvnet nvaudio:SUBDIRS = nvnet:" \
    Makefile
  fi

   if  spell_installed  linux;  then

      LINUX_VERSION=$(  installed_version  linux  )

      sed  -i  "s;\$(shell uname -r);$LINUX_VERSION;"                                   nvaudio/Makefile
      sed  -i  "s;/usr/src/linux-\$(LINUXDIR);/usr/src/linux;"                          nvaudio/Makefile
      sed  -i  "s;depmod -a;depmod -a -q -F /usr/src/linux/System.map $LINUX_VERSION;"  nvaudio/Makefile
      sed  -i  "s;\$(shell uname -r);$LINUX_VERSION;"                                   nvnet/Makefile
      sed  -i  "s;/usr/src/linux-\$(LINUXDIR);/usr/src/linux;"                          nvnet/Makefile
      sed  -i  "s;depmod -a;depmod -a -q -F /usr/src/linux/System.map $LINUX_VERSION;"  nvnet/Makefile

   fi


  make             &&
  prepare_install  &&
  make    install  

) > $C_FIFO 2>&1
