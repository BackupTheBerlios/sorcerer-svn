#!/bin/bash

PIDF=/var/run/rsyslogd.pid

touch_log_files()  {
  [  -f  /var/log/syslog  ]   ||
  touch  /var/log/syslog
}

echo  "$1ing rsyslog daemon."

case $1 in
    start)  touch_log_files;  /usr/sbin/rsyslogd   ;;
  restart)  [  -f  $PIDF  ]  &&  kill  -1   $(<  $PIDF  ) ||  $0  start  ;;
     stop)  [  -f  $PIDF  ]  &&  kill  -15  $(<  $PIDF  ) ;;
        *)  echo  "Usage: $0 {start|stop|restart}"  ;;
esac
