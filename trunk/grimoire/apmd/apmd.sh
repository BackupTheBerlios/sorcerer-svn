#!/bin/sh

case "$1" in
  start)  
    if  [ ! -e /proc/apm ]; 
      then  echo "APM support has not been compiled into the kernel, failed !"
      exit 1
    fi
    echo  "$1ing APMd."
    /usr/sbin/apmd
    ;;
     
  stop)
    echo  "$1ing APMd."
    pkill "^apmd$" &> /dev/null
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
