#!/bin/sh

PID="/var/run/junkbuster.pid"

start()  {
  echo  -n  "Starting junkbuster..."
  /usr/sbin/junkbuster  /etc/junkbuster/junkbstr.ini  &
  echo  "$!"  >  /var/run/junkbuster.pid
  echo  "done."
}

stop()  {
  echo  -n  "Stopping junkbuster..."
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
