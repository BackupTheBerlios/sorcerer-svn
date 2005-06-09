#!/bin/bash

. /lib/lsb/init-functions

PIDF="/var/run/xinetd.pid"
SERV="/usr/sbin/xinetd"

start()  {
  log_warning_msg  "xinetd about to start"
  start_daemon     -p $PIDF $SERV -reuse -pidfile $PIDF  &&
  log_success_msg  "xinetd started"                      ||
  log_failure_msg  "xinetd not started; maybe already running"
}

stop()  {
  log_warning_msg "xinetd about to stop"
  killproc        -p $PIDF -s 15  $SERV  &&
  log_success_msg "xinetd stopped"       ||
  log_failure_msg "xinetd was not running"
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
