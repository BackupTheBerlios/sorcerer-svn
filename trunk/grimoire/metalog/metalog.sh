#!/bin/sh

PID="/var/run/metalog.pid"

start()  {
  echo  -n  "Starting metalog..."
  /usr/sbin/metalog  --synchronous  &
  echo  "$!"  >  $PID
  echo  "done."
}

stop()  {
  echo  -n  "Stopping metalog..."
  [     -f            $PID  ]  &&
  kill  -15  $(  cat  $PID  )
  rm    -f            $PID
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
