#!/bin/sh

PID=/var/run/swapd.pid

start() {
  [      -d  /swap  ]  ||
  mkdir  -p  /swap          2>/dev/null
  if  touch  /swap/rw.test  2>/dev/null;  then
    rm  -f   /swap/rw.test
    echo  "Starting swapd..."
    /usr/sbin/swapd
    echo  "done."
  fi
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
