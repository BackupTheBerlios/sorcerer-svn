#!/bin/sh

echo  "$1ing Snort Intrusion Detection System."

case $1 in
    start)  /usr/bin/snort  -D  ;;
  restart)  $0  stop;  sleep  1;  $0  start  ;;
     stop)  pkill  "^snort$"  ;;
        *)  echo   "Usage: $0 {start|stop|restart}"  ;;
esac
