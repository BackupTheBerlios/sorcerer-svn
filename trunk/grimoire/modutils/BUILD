mod_conf_message()  {
  echo  "
	Customize /etc/modules.conf
	List all modules that should load
	during boot in /etc/modules
	Execute depmod."
}


(

  ./configure  --build=$BUILD  &&
  make                         &&
  prepare_install              &&
  make    install              &&
  mod_conf_message

)  > $C_FIFO 2>&1  &&  (

  cp     $SCRIPT_DIR/modutils.sh  /etc/init.d
  ln  -sf  ../init.d/modutils.sh  /etc/rcS.d/S20modutils

  mkdir  -p  /etc/modules.d

  #  /etc/modules and /etc/modules.conf
  #  are files excluded from install logs.

  touch  /etc/modules  /etc/modules.conf

)
