#!/bin/sh

start() {
  echo  "Starting swapd..."
  /usr/sbin/swapd
  echo  "done."
}

stop()  {
  [     -f     /var/run/swapd.pid               ]  &&
  PID=$(  cat  /var/run/swapd.pid  2>/dev/null  )  &&
  [     -n   "$PID"                             ]  &&
  ps    -p    $PID  --no-heading -o cmd            |
  grep  -q   "[swapd]"                             &&
  echo  "Stopping swapd...$(  kill  $PID  )  done."
}


case  $1  in
    start)  start  ;;
     stop)  stop   ;;
  restart)  start  ;;
        *)  echo  "Usage: $0 {start|stop|restart}"  ;;
esac
