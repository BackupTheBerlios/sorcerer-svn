(

  install_config()  {
    mkdir    -p       /etc/init.d        /etc/acpi/events
    install  -m 755   debian/default.sh  /etc/acpi
    install           debian/default     /etc/acpi/events
    cp           $SCRIPT_DIR/acpid.sh    /etc/init.d
  }

  CF="CFLAGS=${CFLAGS} -g -Wall -DVERSION=\"\\\"${VERSION}\\\"\""
  MD="MAN8DIR=/usr/man/man8"

  make             "$CF"  &&
  prepare_install         &&
  make    install  "$MD"  &&
          install_config

) > $C_FIFO 2>&1
