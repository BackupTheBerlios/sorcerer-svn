#!/bin/bash

PFILE="/var/run/xinetd.pid"


start()  {
  echo  -n  "Starting xinetd..."
  /usr/sbin/xinetd -reuse  -pidfile  $PFILE
  echo  "done."
}


stop()  {
  echo  -n  "Stopping xinetd..."
  [     -f        $PFILE  ]  &&
  kill  -15  $(<  $PFILE  )
  rm    -f        $PFILE
  echo  "done."
}


help()  {
  echo   "Usage: $0 {start|stop|restart}"
}


case  $1  in
    start)                       start  ;;
  restart)  stop  &&  sleep  1;  start  ;;
     stop)  stop                        ;;
        *)  help                        ;;
esac
