#!/bin/bash

start_check()  {

  [      -d  /overlay  ]  ||
  mkdir  -p  /overlay

  [  -c  /dev/cfs0  ]  ||
  mknod  -m 600  /dev/cfs0 c 67 0

  [  -c  /dev/cfs1  ]  ||
  mknod  -m 600  /dev/cfs0 c 67 1

  modprobe  coda
  modprobe  redir

}


stop()  {

  pkill  avfscoda
  rmmod  redir

}


case  "$1"  in

  start)    echo  "Starting avfscoda"
            start_check
            /usr/sbin/avfscoda  ;;

  stop)     echo  "Stopping avfscoda"
            stop  ;;

  restart)  echo  "Restarting avfscoda"
            stop
            start_check
            /usr/sbin/avfscoda  ;;

  *)        echo  "Usage: $0 {start|stop|reload|restart}"
            exit  1  ;;
esac
