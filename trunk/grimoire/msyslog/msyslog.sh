#!/bin/bash

PIDF=/var/run/syslogd.pid


touch_log_files()  {

  /bin/cat        /etc/syslog.conf  |
  /usr/bin/tr     ' '  '\n'         |
  /usr/bin/grep   "^/var/log"       |
  /usr/bin/xargs  -l64  touch

}


echo  "$1ing myslog daemon."

case $1 in
    start)  touch_log_files;  /usr/sbin/syslogd  -i linux  -i unix   ;;
  restart)  [  -f  $PIDF  ]  &&  kill  -1   $(<  $PIDF  ) ||  $0  start  ;;
     stop)  [  -f  $PIDF  ]  &&  kill  -15  $(<  $PIDF  ) ;;
        *)  echo  "Usage: $0 {start|stop|restart}"  ;;
esac
