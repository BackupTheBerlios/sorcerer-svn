#!/bin/sh

# Edit and uncomment the appropriate lines

MODULE=

case $1 in
    start)  echo      "$1ing lircd."
            modprobe  $MODULE
	    /usr/sbin/lircd
            ;;
              
     stop)  echo      "$1ing lircd."
            pkill ^lircd &> /dev/null
            ;;

  restart)  $0  stop  &&
            $0  start
            ;;

        *)  echo  "Usage: $0 {start|stop|restart}"
            ;;
esac
