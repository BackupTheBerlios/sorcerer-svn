#!/bin/sh

PID="/var/run/dhcpd.pid"

start()  {
  echo  -n  "Starting dhcpd..."
  dhcpd
  if    [  -f  $PID  ]
  then  echo   "done."
  else  echo   "failed."
  fi
}

stop()  {
  if    [  -f  $PID  ];  then
    kill   -15  $(  cat  $PID  )
    echo   "Stopped dhcpd."
    rm     -f  $PID
  else  false
  fi

}

help()  {
  echo  "Usage:  $0  {start|stop|restart}"
}


case  $1  in
    start)  stop                 start  ;;
  restart)  stop  &&  sleep  1;  start  ;;
     stop)  stop                        ;;
        *)  help                        ;;
esac
