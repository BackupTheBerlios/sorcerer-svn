#!/bin/sh

start()  {
  echo  -n  "Starting metalog..."
  /usr/sbin/metalog  --sync  --daemonize
  echo  "done."
}

stop()  {
  PID="/var/run/metalog.pid"

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
