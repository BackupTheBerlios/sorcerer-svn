#!/bin/sh

PID=/var/run/swapd.pid

start() {
  echo  "Starting swapd..."
  /usr/sbin/swapd
  echo  "done."
}

stop()  {
  echo  -n  "Stopping swapd..."
  [     -f        $PID  ]  &&
  kill  -15  $(<  $PID  )
  rm    -f        $PID
  echo  "done."
}

case  $1  in
    start)  start  ;;
     stop)  stop   ;;
  restart)  start  ;;
        *)  echo  "Usage: $0 {start|stop|restart}"  ;;
esac
