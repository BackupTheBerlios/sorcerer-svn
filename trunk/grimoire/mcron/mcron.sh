#!/bin/sh

PID="/var/run/cron.pid"

start()  {
  echo  -n  "Starting mcron..."
  TERM="dumb"  /usr/sbin/cron  --noetc
}

stop()  {
  echo  -n  "Stopping mcron..."
  [     -f            $PID  ]  &&
  kill  -15  $(  cat  $PID  )
  rm    -f            $PID
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
echo  "done."
