#!/bin/sh

case  $1  in
    start)  echo   "Starting Berkley Internet Name Domain"
            modprobe  capability  2>/dev/null
            named  -u  bind                         ;;

  restart)  rndc    stop
            named  -u  bind                         ;;

     stop)  rndc   stop                             ;;

        *)  echo  "Usage: $0 {start|stop|restart}"  ;;
esac
