#!/bin/sh

case $1 in
  start|restart)  echo   "$1ing atd periodic scheduler."
                  pkill  "^atd$"
                  atd
                  ;;
           stop)  echo   "$1ing atd."
                  pkill  "^atd$"
                  ;;
              *)  echo   "Usage: $0 {start|stop|restart}"
                  ;;
esac
