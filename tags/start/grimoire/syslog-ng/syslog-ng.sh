#!/bin/sh

case $1 in
  start|restart)  echo     "$1ing syslog-ng daemons."
                  pkill    "^syslog-ng$"
                  syslog-ng
                  ;;

   stop)          pkill    "^syslog-ng$"
                  ;;                 

      *)          echo     "Usage: $0 {start|stop|restart}"
                  ;;                                        
esac
