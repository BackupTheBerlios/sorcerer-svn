(

   make CFLAGS="${CFLAGS} -g -Wall -DVERSION=\"\\\"${VERSION}\\\"\""  &&
   prepare_install                         &&
   make    install  MAN8DIR=/usr/man/man8  &&
   mkdir   -p  /etc/acpi/events            &&
   install -m 755  debian/default.sh  /etc/acpi  &&
   install debian/default  /etc/acpi/events      &&
   cp  $SCRIPT_DIR/acpid.sh  /etc/init.d
      
) > $C_FIFO 2>&1
