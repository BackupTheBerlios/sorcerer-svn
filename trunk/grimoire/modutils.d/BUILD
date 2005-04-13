mod_conf_message()  {
  echo  "
	Customize /etc/modules.conf
	List all modules that should load
	during boot in /etc/modules
	Execute depmod."
}

install_conf()  {

  mod_conf_message
  cp     $SCRIPT_DIR/modutils.sh  /etc/init.d
  ln  -sf  ../init.d/modutils.sh  /etc/rcS.d/S20modutils

  mkdir  -p  /etc/modules.d

  #  /etc/modules and /etc/modules.conf
  #  are files excluded from install logs.

  touch  /etc/modules  /etc/modules.conf

}


./configure  --build=$BUILD  &&
make                         &&
prepare_install              &&
make    install              &&
        install_conf
