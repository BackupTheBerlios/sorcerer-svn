#!/bin/sh

MODULE=

echo  "$1ing lircd."

case $1 in
    start)  [  -n    "$MODULE"  ]  &&
            modprobe  $MODULE;  /usr/sbin/lircd     ;;
     stop)  pkill -15  "^lircd$"                    ;;
  restart)  $0  stop;  sleep 1;  $0  start          ;;
        *)  echo  "Usage: $0 {start|stop|restart}"  ;;
esac
