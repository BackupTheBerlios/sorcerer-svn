# keep back-up of old issue, issue.net files
if    [  -f  /etc/issue  ]
then  cp  /etc/issue     \
          /etc/issue.save
fi
  
if    [  -f  /etc/issue.net  ]
then  cp  /etc/issue.net     \
          /etc/issue.net.save
fi
  
sed  -i  "s:-O2 -Wall:${CFLAGS}:"  Makefile
  
echo  "${SCRIPT_DIR}/sorcerer.logo"        >> logo_config
# echo  "${SCRIPT_DIR}/sorcerer-banner.logo"  >>  logo_config

make                           &&
prepare_install                &&
make  DESTDIR=/usr  install    &&
cp  $SCRIPT_DIR/linux_logo.sh  \
               /etc/init.d     &&

if  $LINUXLOGO_BOOT;  then
  ln  -sf  ../init.d/linux_logo.sh  /etc/rc3.d/S99linux_logo
  ln  -sf  ../init.d/linux_logo.sh  /etc/rc5.d/S99linux_logo
fi
