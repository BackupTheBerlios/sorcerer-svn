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
  sed  -i  "s:-O:$CFLAGS -I/usr/include/asm/mach-default:"                          */Makefile
  sed  -i  "s:pdev->driver_data;:pci_get_drvdata(pdev);:"                           nvnet/nvnet.c
fi


make             &&
prepare_install  &&
make    install
