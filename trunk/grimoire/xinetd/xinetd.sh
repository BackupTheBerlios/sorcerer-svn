#!/bin/sh

PID="/var/run/xinetd.pid"

start()  {
  echo  -n  "Starting xinetd..."
  /usr/sbin/xinetd -reuse  -pidfile  $PID
  echo  "done."
}

stop()  {
  echo  -n  "Stopping xinetd..."
  [     -f            $PID  ]  &&
  kill  -15  $(  cat  $PID  )
  rm    -f            $PID
  echo  "done."
}

help()  {
  echo   "Usage: $0 {start|stop|restart}"
}


case  $1  in
    start)                       start  ;;
  restart)  stop  &&  sleep  3;  start  ;;
     stop)  stop                        ;;
        *)  help                        ;;
esac
