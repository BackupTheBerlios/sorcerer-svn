#!/bin/sh

#  EPID="/var/spool/mail/exim-daemon.pid"
#   PID="/var/run/exim.pid"

   PID="/var/spool/mail/exim-daemon.pid"

start()  {
  echo  -n  "Starting exim..."
# /usr/sbin/exim  -bd  -q15m  -oP $PID
  /usr/sbin/exim  -bd  -q15m
# cp    $EPID  $PID
  echo  "done."
}

stop()  {
  echo  -n  "Stopping exim..."
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
