./configure  --sysvdir=/etc/init.d/               \
             --cgidir=/usr/share/httpd/cgi-bin/   \
             --runas_usr=nobody                   \
             --runas_grp=nogroup                  \
             $OPTS                                &&
make                                              &&
make  install                                     &&

# replace the redhatish init script ;)
cp  -f  $SCRIPT_DIR/dansguardian.init             \
        /etc/init.d/dansguardian                  &&
   
if  $DG_BOOT;  then
  ln  -sf  ../init.d/dansguardian  /etc/rc0.d/K35dansguardian
  ln  -sf  ../init.d/dansguardian  /etc/rc1.d/K35dansguardian
  ln  -sf  ../init.d/dansguardian  /etc/rc2.d/K35dansguardian
  ln  -sf  ../init.d/dansguardian  /etc/rc6.d/K35dansguardian

  ln  -sf  ../init.d/dansguardian  /etc/rc3.d/S92dansguardian
  ln  -sf  ../init.d/dansguardian  /etc/rc4.d/S92dansguardian
  ln  -sf  ../init.d/dansguardian  /etc/rc5.d/S92dansguardian
fi
