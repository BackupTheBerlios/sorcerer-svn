#!/bin/sh

case $1 in
  start)         echo  "Starting Apache web server."
                 apachectl  startssl
                 ;;
  restart|stop)  echo  "$1ing Apache web server."
                 mkdir  -p  /var/run/httpd
                 apachectl  $1
                 ;;
             *)  echo      "Usage: $0 {start|stop|restart}"
                 ;;
esac
