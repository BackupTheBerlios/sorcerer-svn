#!/bin/sh

start()  {
  echo  -n  "Starting rpc.dracd..."
  /usr/sbin/rpc.dracd
  echo  "done."
}

stop()  {
  echo  -n  "Stopping rpc.dracd..."
  pkill "^rpc.dracd$"
  echo  "done."
}

help()  {
  echo  "Usage:  $0  {start|stop|restart}"
}


case $1 in
    start)                       start  ;;
  restart)  stop  &&  sleep  3;  start  ;;
     stop)  stop                        ;;
        *)  help                        ;;
esac
