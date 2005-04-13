#!/bin/sh

# Modify to match your setup.
MOUSE=        # Your mouse type, eg. "ps2"
DEV=          # Mouse device, eg. "dev/mouse" 
GPM_OPTS=     # Extra options. If none leave it blank

PID="/var/run/gpm.pid"

start()  {
  echo  -n  "Starting gpm..."
  /usr/sbin/gpm  -m  $DEV    \
                 -t  $MOUSE  \
		 $GPM_OPTS
  echo  "done."
}

stop()  {
  echo  -n  "Stopping gpm..."
  /usr/sbin/gpm  -k  &>  /dev/null
  echo  "done."
}

status()  {
  if  [  -f  $PID  ]; then
    echo  "gpm is running. pid : $(cat $PID)"
  else
    echo  "gpm is not running."
  fi
}

help()  {
  echo  "Usage:  $0  {start|stop|status|restart}"
}


case $1 in
    start)                       start  ;;
  restart)  stop  &&  sleep  1;  start  ;;
   status)  status                      ;;
     stop)  stop                        ;;
        *)  help                        ;;
esac
