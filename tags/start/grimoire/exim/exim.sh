#!/bin/sh

case $1 in
  start|restart)  echo     "$1ing exim MTA."
                  pkill  "^exim$"  &&  sleep  3
                  exim  -bd  -q15m
                  ;;
           stop)  echo     "$1ing exim"
                  pkill  exim
                  ;;
              *)  echo     "Usage: $0 {start|stop|restart}"
                  ;;
esac
