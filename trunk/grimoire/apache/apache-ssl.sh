#!/bin/sh

case  $1  in
         start)  echo      "$1ing Apache web server."
                 apachectl  startssl
                 ;;
  restart|stop)  echo      "$ing Apache web server."
                 apachectl  $1
                 ;;
             *)  echo      "Usage: $0 {start|stop|restart}"
                 ;;
esac
