(

  ./configure  --build=$BUILD        \
               --prefix=/            \
               --sysconfdir=/etc     \
               --localstatedir=/var  \
               $OPTS                 &&
  make                               &&
  prepare_install                    &&
  make    install

) > $C_FIFO 2>&1  &&  (

  cp     $SCRIPT_DIR/modutils.sh     /etc/init.d
  ln  -sf  ../init.d/modutils.sh     /etc/rcS.d/S20modutils

  mkdir  -p  /etc/modules.d

  #  /etc/modules and /etc/modprobe.conf 
  #  are files excluded from install logs.

  touch  /etc/modules  /etc/modprobe.conf

)
