#!/bin/sh

case  $1  in
    start)  echo   "Starting irrd - Internet Routing Registry Daemon"
            irrd  -g irrd  -l irrd  ;;

  restart)  pkill  "^irrd$";  sleep  2
            irrd  -g irrd -l irrd  ;;

     stop)  pkill  "^irrd$"  ;;

        *)  echo  "Usage: $0 {start|stop|restart}"  ;;

esac
