#!/bin/sh

case "$1" in
  start)  
    if  [ ! -e /proc/acpi ]; 
      then  echo "ACPI support has not been compiled into the kernel, failed !"
      exit 1
    fi
    echo  "$1ing ACPId."
    /usr/sbin/acpid  -c  /etc/acpi/events
    ;;
     
  stop)
    echo  "$1ing ACPId."
    pkill "^acpid$" &> /dev/null
    ;;
    
  restart)
    $0 stop
    sleep  1
    $0 start
    ;;

  *)
    echo "Usage: $0 {start|stop|restart}" 
    exit 1
    ;;
esac
