install_etc()  {

  set    -x
  sed    -i  "s:../rules:.:"   etc/snort.conf
  mkdir  -p                   /etc/snort  /var/log/snort
  cp     etc/*  rules/*       /etc/snort
  rm     -f                   /etc/snort/Makefile*
  chmod  0644                 /etc/snort/*

  install  -m 0755  -o root  -g root  \
           $SCRIPT_DIR/snort.sh  /etc/init.d/

  ln  -sf  ../init.d/snort.sh  /etc/rc0.d/K60snort
  ln  -sf  ../init.d/snort.sh  /etc/rc1.d/K60snort
  ln  -sf  ../init.d/snort.sh  /etc/rc2.d/K60snort
  ln  -sf  ../init.d/snort.sh  /etc/rc6.d/K60snort
                     
  ln  -sf  ../init.d/snort.sh  /etc/rc3.d/S40snort            
  ln  -sf  ../init.d/snort.sh  /etc/rc4.d/S40snort
  ln  -sf  ../init.d/snort.sh  /etc/rc5.d/S40snort
  set +x

}

sed  -i  "s:/etc/snort.conf:/etc/snort/snort.conf:"  src/snort.c
./configure  --build=$BUILD           \
             --prefix=/usr            \
             --sysconfdir=/etc/snort  \
             --localstatedir=/var     \
             $OPTS                    &&
make                                  &&
prepare_install                       &&
make    install                       &&
install_etc
