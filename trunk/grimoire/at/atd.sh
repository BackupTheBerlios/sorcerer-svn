#!/bin/sh

PID="/var/run/atd.pid"

start()  {
  echo  -n  "Starting atd..."
  /usr/sbin/atd
  echo  "done."
}

stop()  {
  echo  -n  "Stopping atd..."
  [     -f            $PID  ]  &&
  kill  -15  $(  cat  $PID  )
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
