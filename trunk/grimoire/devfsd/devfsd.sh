#!/bin/sh

start() {  devfsd  /devices;  }

stop()  {

  echo -n "Stopping devfsd..."
  PID="$(  ps  -C devfsd -o pid=  )"
  if    [  -n  "$PID"  ]
  then  kill    $PID
  fi
  echo  "done."

}


case  $1  in
    start)  start  ;;
     stop)  stop   ;;
  restart)  stop
            start  ;;
        *)  echo      "Usage: $0 {start|stop|restart}"  ;;
esac
