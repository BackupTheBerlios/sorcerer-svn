#!/bin/sh

make_dirs()  {
  [      -d  /var/log/httpd  ]  ||
  mkdir  -p  /var/log/httpd  ]
}

case $1 in
  start)         echo  "Starting Apache web server."
                 make_dirs;  apachectl  startssl
                 ;;
  restart|stop)  echo  "$1ing Apache web server."
                 make_dirs;  apachectl  $1
                 ;;
             *)  echo      "Usage: $0 {start|stop|restart}"
                 ;;
esac
