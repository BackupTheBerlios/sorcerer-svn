#!/bin/sh

DNSMASQ_OPTS=""

PID="/var/run/dnsmasq.pid"

start()  {
  echo  -n  "Starting dnsmasq..."
  /usr/sbin/dnsmasq  ${DNSMASQ_OPTS}
  echo  "done."
}

stop()  {
  echo  -n  "Stopping dnsmasq..."
  [     -f            $PID  ]  &&
  kill  -15  $(  cat  $PID  )
  rm    -f            $PID
  echo  "done."
}

status()  {
  if  [  -f  $PID  ]; then
    echo  "dnsmasq is running. pid : $(cat $PID)"
  else
    echo  "dnsmasq is not running."
  fi
}

help()  {
  echo  "Usage:  $0  {start|stop|restart|status}"
}


case $1 in
    start)                       start  ;;
  restart)  stop  &&  sleep  3;  start  ;;
     stop)  stop                        ;;
   status)  status                      ;;
        *)  help                        ;;
esac
